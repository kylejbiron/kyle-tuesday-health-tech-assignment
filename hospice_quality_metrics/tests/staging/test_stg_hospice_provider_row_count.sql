-- tests/staging/test_stg_hospice_provider_row_count.sql

WITH actual_record_count AS (
    SELECT COUNT(*) AS actual_count FROM {{ ref('stg_hospice_provider') }}
),

expected_record_count AS (
    SELECT COUNT(*) AS expected_count FROM READ_CSV_AUTO('{{ var("raw_dir") }}/Hospice_Provider_Aug2024.csv')
)

-- Check that the actual row count matches the expected row count
SELECT
    actual_record_count.actual_count,
    expected_record_count.expected_count
FROM actual_record_count, expected_record_count
WHERE actual_record_count.actual_count != expected_record_count.expected_count
