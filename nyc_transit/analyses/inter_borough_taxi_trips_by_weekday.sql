with all_trips as (
    select date_part('dayofweek', pickup_datetime) as weekday, dolocationid, pulocationid 
    from {{ref('mart__fact_all_taxi_trips')}}
),
total_group as (
    select count(*) as total_trips, weekday 
    from all_trips 
    group by weekday
),
ib_group as (
    select count(*) as ib_trips, weekday 
    from all_trips taxi 
    inner join {{ref('mart__dim_locations')}} do_loc
        on taxi.dolocationid=do_loc.locationid
    inner join {{ref('mart__dim_locations')}} pu_loc 
        on taxi.pulocationid=pu_loc.locationid
    where do_loc.borough <> pu_loc.borough 
    and taxi.dolocationid is not null 
    and taxi.pulocationid is not null
    group by weekday
)
select total_trips, ib_trips, 100*ib_trips/total_trips as percentage_ib_trips, total.weekday 
from total_group as total
left join ib_group as ib
on total.weekday=ib.weekday;