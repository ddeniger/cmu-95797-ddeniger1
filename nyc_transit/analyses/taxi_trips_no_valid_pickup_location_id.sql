select 
    --taxi.*,
    count(*) as trips
from {{ref('mart__fact_all_taxi_trips')}} taxi 
left join {{ref('mart__dim_locations')}} locs_pu 
    on taxi.pulocationid=locs_pu.locationid 
left join {{ref('mart__dim_locations')}} locs_do
    on taxi.dolocationid=locs_do.locationid 
where locs_pu.locationid is null or locs_do.locationid is null; --checks for both missing dropoff and pickup