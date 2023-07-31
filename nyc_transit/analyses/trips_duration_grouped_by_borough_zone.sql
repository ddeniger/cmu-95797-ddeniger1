select --Analyzing by pickup borough/ zone
    count(*)  as trips,
    avg(duration_min) avg_duration_min,
    borough,
    zone
from {{ref('mart__fact_all_taxi_trips')}} all_taxi 
inner join {{ref('mart__dim_locations')}} locs 
    on all_taxi.pulocationid=locs.locationid 
group by borough, zone;