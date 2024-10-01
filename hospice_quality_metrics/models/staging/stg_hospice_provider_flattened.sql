-- models/staging/stg_hospice_provider_flattened.sql

{% set metrics = dbt_utils.get_column_values(ref('stg_hospice_provider'), 'measure_code') %}

{% if metrics is iterable and metrics | length > 0 %}
    with metrics as (
        select
            ccn,
            cms_region
            {% for metric in metrics %}
            , max(case 
              when measure_code = '{{ metric }}' and score != 'Not Available' then score 
              else null 
              end) as {{ metric | lower }}
            {% endfor %}
        from
            {{ ref('stg_hospice_provider') }}
        group by
            ccn,
            cms_region
    )

    select * from metrics
{% else %}
    -- print error when no metrics are found
    select 'No measure_code values found' as error_message;
{% endif %}
