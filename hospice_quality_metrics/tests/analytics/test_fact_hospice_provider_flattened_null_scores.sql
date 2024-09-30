-- tests/analytics/test_fact_hospice_provider_flattened_null_scores.sql

select *
from {{ ref('fact_hospice_provider_flattened') }}
where
    H_008_01_OBSERVED_SCORE is null
    or H_008_01_OBSERVED_SCORE = 'Not Available'
    or H_012_00_OBSERVED_SCORE is null
    or H_012_00_OBSERVED_SCORE = 'Not Available'
