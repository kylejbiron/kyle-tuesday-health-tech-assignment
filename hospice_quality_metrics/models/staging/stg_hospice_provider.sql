-- models/stg_hospice_provider

with raw_data as (
    select *
    from read_csv_auto('{{ var("raw_dir") }}/Hospice_Provider_Aug2024.csv')
)

select
    "CMS Certification Number (CCN)" as ccn,
    "Facility Name" as facility_name,
    "Address Line 1" as address_line_1,
    "Address Line 2" as address_line_2,
    "City/Town" as city_town,
    state,
    "ZIP Code" as zip_code,
    "County/Parish" as county_parish,
    "Telephone Number" as telephone_number,
    "CMS Region" as cms_region,
    "Measure Code" as measure_code,
    cast("Measure Name" as varchar(255)) as measure_name,
    score,
    footnote,
    "Measure Date Range" as measure_date_range,
    split_part("Measure Date Range", '-', 1) as measure_from_date,
    split_part("Measure Date Range", '-', 2) as measure_end_date
from raw_data
