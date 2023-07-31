/*select 
    fare_amount,
    avg(fare_amount) OVER 
        (partition by zone)
        as zone_avg_fare_amount,
    avg(fare_amount) OVER 
        (partition by borough)
        as borough_avg_fare_amount,
    avg(fare_amount) OVER
        ()
        as overall_avg_fare_amount
from {{ref('stg__yellow_tripdata')}} taxi
inner join {{ref('mart__dim_locations')}} locs
    on taxi.pu_location_id=locs.locationid 
;*/

--abandoned above window logic because WSL kept terminating my process

with zoneavg as (
    select zone, avg(fare_amount) as zone_avg
    from {{ref('stg__yellow_tripdata')}} taxi
    inner join {{ref('mart__dim_locations')}} locs
    on taxi.pu_location_id=locs.locationid 
    group by zone
),
boroughavg as (
    select borough, avg(fare_amount) boro_avg
    from {{ref('stg__yellow_tripdata')}} taxi
    inner join {{ref('mart__dim_locations')}} locs
    on taxi.pu_location_id=locs.locationid 
    group by borough
),
allavg as (
    select avg(fare_amount) as all_avg
    from {{ref('stg__yellow_tripdata')}} taxi
    inner join {{ref('mart__dim_locations')}} locs
    on taxi.pu_location_id=locs.locationid 
)

select fare_amount,
zone_avg,
boro_avg,
(select all_avg from allavg) as all_avg
from {{ref('stg__yellow_tripdata')}} taxi
inner join {{ref('mart__dim_locations')}} locs
    on taxi.pu_location_id=locs.locationid 
inner join zoneavg
    on zoneavg.zone=locs.zone
inner join boroughavg 
    on boroughavg.borough=locs.borough
LIMIT 100; --limiting output to file