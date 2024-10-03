-- models/staging/stg_beneficiaries.sql

SELECT *

FROM
    read_csv_auto(
        '{{ var("raw_dir") }}/DE1_0_2008_Beneficiary_Summary_File_Sample_1.csv'
    )

UNION ALL

SELECT *

FROM
    read_csv_auto(
        '{{ var("raw_dir") }}/DE1_0_2009_Beneficiary_Summary_File_Sample_1.csv'
    )

UNION ALL

SELECT *

FROM
    read_csv_auto(
        '{{ var("raw_dir") }}/DE1_0_2010_Beneficiary_Summary_File_Sample_1.csv'
    )
