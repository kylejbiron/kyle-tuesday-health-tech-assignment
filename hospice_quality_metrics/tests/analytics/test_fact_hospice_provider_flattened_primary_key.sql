-- tests/analytics/test_fact_hospice_provider_flattened_primary_key.sql

select
    ccn,
    count(*) as row_count
from {{ ref('fact_hospice_provider_flattened') }}
group by ccn
having count(*) > 1
