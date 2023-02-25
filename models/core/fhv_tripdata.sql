with dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select fhv.* from {{ ref('stg_fhv_tripdata') }} fhv 
inner join dim_zones zones_pickup on fhv.PULocationId = zones_pickup.locationid
inner join dim_zones zones_dropoff on fhv.DOLocationId = zones_dropoff.locationid
where extract(year from fhv.pickup_datetime)=2019