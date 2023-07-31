select 
    date,
    avg(precipitation) OVER 
        (ORDER BY date ASC 
        RANGE BETWEEN INTERVAL 3 DAYS PRECEDING 
        AND INTERVAL 3 DAYS FOLLOWING)
        as seven_day_prcp_avg
from {{ref('stg__central_park_weather')}};