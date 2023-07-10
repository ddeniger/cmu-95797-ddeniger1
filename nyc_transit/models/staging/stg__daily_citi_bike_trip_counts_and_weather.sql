with source as (

    select * from {{ source('main', 'daily_citi_bike_trip_counts_and_weather') }}

),

renamed as (
    select
        date::date as date,
        trips::int as trips,
        precipitation::double as precipitation, --matched several names to central_park_weather
        snow_depth::double as snow_depth,--matched several names to central_park_weather
        snowfall::double as snow_fall,--matched several names to central_park_weather
        max_temperature::double as temperature_max,--matched several names to central_park_weather
        min_temperature::double as temperature_min,--matched several names to central_park_weather
        {{ clean_na_raw('average_wind_speed', 'double') }} as average_wind_speed,
        dow::int as day_of_week,
        year::int as year,
        month::int as month,
        holiday::boolean as holiday,
        {{ clean_na_raw('stations_in_service', 'int') }} as stations_in_service,
        weekday::boolean as weekday,
        weekday_non_holiday::boolean as weekday_non_holiday,
        filename

    from source

)

select * from renamed