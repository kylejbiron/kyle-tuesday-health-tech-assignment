-- tests/staging/test_stg_beneficiaries_record_count.sql

WITH actual_record_count AS (
    SELECT COUNT(*) AS actual_count FROM {{ ref('stg_beneficiaries') }}
),

expected_record_count AS (
    WITH unioned_counts AS (
        SELECT COUNT(*) AS record_count FROM READ_CSV_AUTO('{{ var("raw_dir") }}/DE1_0_2008_Beneficiary_Summary_File_Sample_1.csv')
        UNION ALL
        SELECT COUNT(*) AS record_count FROM READ_CSV_AUTO('{{ var("raw_dir") }}/DE1_0_2009_Beneficiary_Summary_File_Sample_1.csv')
        UNION ALL
        SELECT COUNT(*) AS record_count FROM READ_CSV_AUTO('{{ var("raw_dir") }}/DE1_0_2010_Beneficiary_Summary_File_Sample_1.csv')
    )

    SELECT SUM(record_count) AS expected_count FROM unioned_counts
)

-- Check that the actual row count matches the expected row count
SELECT
    actual_record_count.actual_count,
    expected_record_count.expected_count
FROM actual_record_count, expected_record_count
WHERE actual_record_count.actual_count != expected_record_count.expected_count
