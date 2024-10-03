-- tests/staging/test_stg_medical_claims_record_count.sql

WITH actual_record_count AS (
    SELECT COUNT(*) AS actual_count FROM {{ ref('stg_medical_claims') }}
),

expected_record_count AS (
    WITH unioned_counts AS (
        SELECT COUNT(*) AS record_count FROM READ_CSV_AUTO('{{ var("raw_dir") }}/DE1_0_2008_to_2010_Inpatient_Claims_Sample_1.csv')
        UNION ALL
        SELECT COUNT(*) AS record_count FROM READ_CSV_AUTO('{{ var("raw_dir") }}/DE1_0_2008_to_2010_Outpatient_Claims_Sample_1.csv')
    )

    SELECT SUM(record_count) AS expected_count FROM unioned_counts
)

-- Check that the actual row count matches the expected row count
SELECT
    actual_record_count.actual_count,
    expected_record_count.expected_count
FROM actual_record_count, expected_record_count
WHERE actual_record_count.actual_count != expected_record_count.expected_count
