
with fhv_data as (
    select * from {{ source('stage','fhv') }}
)
select * from fhv_data