select total_trips, ib_trips, 100*ib_trips/total_trips as percentage_ib_trips, weekday 
from 
    (select
    count(*) as total_trips,
    date_part('dayofweek', pickup_datetime) as weekday
    from {{ref('mart__fact_all_taxi_trips')}} all_taxi
    group by date_part('dayofweek', pickup_datetime)) total
left join 
    (select
    count(*) as total_trips,
    date_part('dayofweek', pickup_datetime) as weekday
    from {{ref('mart__fact_all_taxi_trips')}} taxi
    inner join {{ref('mart__dim_locations')}} do_loc
    on taxi.dolocationid=do_loc.locationid
    inner join {{ref('mart__dim_locations')}} pu_loc 
    on taxi.pulocationid=do_loc.locationid
    where do_loc.borough <> pu_loc.borough
    group by date_part('dayofweek', pickup_datetime)) ib
on total.weekday=ib.weekday;