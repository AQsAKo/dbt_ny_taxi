with dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select fhv.* from {{ ref('stg_fhv_tripdata') }} fhv 
inner join dim_zones zones_pickup on "fhv"."PUlocationID" = zones_pickup.locationid
inner join dim_zones zones_dropoff on "fhv"."DOlocationID" = zones_dropoff.locationid
where extract(year from fhv.pickup_datetime)=2019