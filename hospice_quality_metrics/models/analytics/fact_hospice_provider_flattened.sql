-- models/analytics/fact_hospice_provider_flattened.sql

with get_his_composite_measure as (

    select
        ccn,
        cms_region,
        measure_code,
        score,
        footnote
    from {{ ref('stg_hospice_provider') }}

    -- H_008_01_ OBSERVED: Facility observed rate | Hospice and Palliative Care Composite Process Measure
    where measure_code = 'H_008_01_OBSERVED'

    --filter out records where score is not available
    and score != 'Not Available'

),

get_hci_overall_score as (

    select
        ccn,
        cms_region,
        measure_code,
        score,
        footnote
    from {{ ref('stg_hospice_provider') }}

    -- H_012_00_OBSERVED: Facility observed rate | Hospice Care Index Overall Score
    where measure_code = 'H_012_00_OBSERVED'

    --filter out records where score is not available
    and score != 'Not Available'

)

select

    hci.ccn,
    hci.cms_region,

    --convert to decimal for downstream analysis
    cast(his.score as decimal(5, 1)) as h_008_01_observed_score,
    cast(hci.score as decimal(5, 1)) as h_012_00_observed_score,

    --footnote was brought into this fact table in case we needed to filter on it 
    his.footnote as h_008_01_observed_footnote,
    hci.footnote as h_012_00_observed_footnote

    -- HCI contains a larger set of CCNs
from get_hci_overall_score as hci
inner join get_his_composite_measure as his
    on hci.ccn = his.ccn
