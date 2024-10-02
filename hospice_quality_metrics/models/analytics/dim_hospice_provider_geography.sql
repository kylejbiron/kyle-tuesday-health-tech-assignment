-- models/analytics/dim_hospice_provider_geography.sql

select distinct

    ccn,
    cms_region,
    address_line_1,
    address_line_2,
    city_town,
    state,
    zip_code,
    county_parish,

    --placeholder for long/lat source based on address
    null as latitude,
    null as longitude

from {{ ref('stg_hospice_provider') }}
