{{ config(materialized='view') }}

with fhv_data as (
    select * from {{ source('stage','fhv') }}
)
select * from fhv_data

{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
