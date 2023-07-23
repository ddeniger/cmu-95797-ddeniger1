select count(*) as count_bike_trips,
sum(case when duration_min between 0 and 9000 then duration_min else NULL end) as sum_duration_min, --excluding unrealistic trip durations
sum(case when duration_sec between 0 and (60*9000) then duration_sec else NULL end) as sum_duration_sec,
date_part('dayofweek', started_at_ts) as weekday
from {{ ref('mart__fact_all_bike_trips')}}
group by date_part('dayofweek', started_at_ts); --Answer applies to weekday based on start of trip date