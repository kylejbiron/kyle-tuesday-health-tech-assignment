-- models/analytics/fact_hospice_provider_missing_metrics.sql

with

missing_his as (
    select
        cms_region,
        count(distinct ccn) as ccns_missing_his
    from (
        select distinct
            sp.ccn,
            sp.cms_region
        from {{ ref('stg_hospice_provider') }} as sp
        where
            sp.measure_code = 'H_008_01_OBSERVED'
            and sp.score = 'Not Available'
    ) as his
    group by cms_region
),

missing_hci as (
    select
        cms_region,
        count(distinct ccn) as ccns_missing_hci
    from (
        select distinct
            sp.ccn,
            sp.cms_region
        from {{ ref('stg_hospice_provider') }} as sp
        where
            sp.measure_code = 'H_012_00_OBSERVED'
            and sp.score = 'Not Available'
    ) as hci
    group by cms_region
),

incomplete_measures as (
    select
        cms_region,
        count(distinct ccn) as ccns_missing_one_or_both_measures
    from (
        select distinct
            sp.ccn,
            sp.cms_region
        from {{ ref('stg_hospice_provider') }} as sp
        except
        select distinct
            fp.ccn,
            fp.cms_region
        from {{ ref('fact_hospice_provider_flattened') }} as fp
    ) as incomplete
    group by cms_region
),

denominator as (
    select
        sp.cms_region,
        count(distinct sp.ccn) as total_ccn_count
    from {{ ref('stg_hospice_provider') }} as sp
    group by sp.cms_region
)

select
    im.cms_region,
    mhis.ccns_missing_his,
    mhci.ccns_missing_hci,
    im.ccns_missing_one_or_both_measures,
    d.total_ccn_count,
    round((mhis.ccns_missing_his / d.total_ccn_count) * 100, 2) as percent_missing_his,
    round((mhci.ccns_missing_hci / d.total_ccn_count) * 100, 2) as percent_missing_hci,
    round((im.ccns_missing_one_or_both_measures / d.total_ccn_count) * 100, 2) as percent_missing_one_or_both_measures
from incomplete_measures as im
inner join denominator as d
    on im.cms_region = d.cms_region
inner join missing_his as mhis
    on im.cms_region = mhis.cms_region
inner join missing_hci as mhci
    on im.cms_region = mhci.cms_region
