{#

this macro sourced from: https://docs.getdbt.com/docs/build/custom-schemas#how-does-dbt-generate-a-models-schema-name
modified to fit repo use case

#}
{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}
        

    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}