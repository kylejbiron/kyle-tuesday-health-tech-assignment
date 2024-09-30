-- tests/staging/test_stg_hospice_provider_row_count.sql

with actual_record_count as (
    select count(*) as actual_count from {{ ref('stg_hospice_provider') }}
),

expected_record_count as (
    select count(*) as expected_count from read_csv_auto('{{ var("raw_dir") }}/Hospice_Provider_Aug2024.csv')
)

-- Check that the actual row count matches the expected row count
select
    actual_record_count.actual_count,
    expected_record_count.expected_count
from actual_record_count, expected_record_count
where actual_record_count.actual_count != expected_record_count.expected_count
