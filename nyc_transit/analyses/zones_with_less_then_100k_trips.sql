select 
    zone,
    count(*) as trips
from {{ref('mart__fact_all_taxi_trips')}} taxi_trips
inner join {{ref('mart__dim_locations')}} locs 
    on taxi_trips.pulocationid=locs.locationid 
group by zone 
having count(*) < 100000; --answer specifically for pickup zones