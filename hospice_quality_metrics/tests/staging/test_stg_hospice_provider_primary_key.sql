-- tests/staging/test_stg_hospice_provider_primary_key.sql

select
    ccn,
    measure_code,
    count(*) as row_count
from {{ ref('stg_hospice_provider') }}
group by ccn, measure_code
having count(*) > 1
