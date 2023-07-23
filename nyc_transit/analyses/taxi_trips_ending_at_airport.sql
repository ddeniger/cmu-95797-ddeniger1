select count(*) as count_trips 
from {{ref('mart__fact_all_taxi_trips')}} as taxi 
inner join {{ref('mart__dim_locations')}} as loc 
on taxi.dolocationid=loc.locationid
where loc.service_zone in ('Airports','EWR');
