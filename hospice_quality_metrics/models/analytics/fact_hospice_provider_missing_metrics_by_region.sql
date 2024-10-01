-- models/analytics/fact_hospice_provider_missing_metrics.sql

with

get_missing_metric_flags as (

    select
        cms_region,
        1 as is_denominator,
        if(h_008_01_observed is null, 1, 0) as is_missing_his,
        if(h_012_00_observed is null, 1, 0) as is_missing_hci,
        if(h_008_01_observed is null or h_012_00_observed is null, 1, 0) as is_missing_his_or_hci,
        if(h_008_01_observed is null and h_012_00_observed is null, 1, 0) as is_missing_both_hsi_hci
    from {{ ref('fact_hospice_provider_flattened') }}

)

select
    cms_region,
    sum(is_missing_his) as total_missing_his,
    sum(is_missing_hci) as total_is_missing_hci,
    sum(is_missing_his_or_hci) as total_missing_his_or_hci,
    sum(is_missing_both_hsi_hci) as total_is_missing_both_hsi_hci,
    sum(is_denominator) as total_denominator,
    round((sum(is_missing_his) / sum(is_denominator)) * 100, 2) as percent_missing_his,
    round((sum(is_missing_hci) / sum(is_denominator)) * 100, 2) as percent_missing_hci,
    round((sum(is_missing_his_or_hci) / sum(is_denominator)) * 100, 2) as percent_missing_his_or_hci,
    round((sum(is_missing_both_hsi_hci) / sum(is_denominator)) * 100, 2) as percent_missing_both_hsi_hci
from get_missing_metric_flags
group by cms_region
