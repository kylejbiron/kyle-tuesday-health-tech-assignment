-- models/stg_hospice_provider

WITH raw_data AS (
    SELECT *
    FROM read_csv_auto('{{ var("raw_dir") }}/Hospice_Provider_Aug2024.csv')
)

SELECT
    "CMS Certification Number (CCN)" AS ccn,
    "Facility Name" AS facility_name,
    "Address Line 1" AS address_line_1,
    "Address Line 2" AS address_line_2,
    "City/Town" AS city_town,
    state,
    "ZIP Code" AS zip_code,
    "County/Parish" AS county_parish,
    "Telephone Number" AS telephone_number,
    "CMS Region" AS cms_region,
    "Measure Code" AS measure_code,
    "Measure Name" AS measure_name,
    score,
    footnote,
    "Measure Date Range" AS measure_date_range,
    split_part("Measure Date Range", '-', 1) AS measure_from_date,
    split_part("Measure Date Range", '-', 2) AS measure_end_date
FROM raw_data
