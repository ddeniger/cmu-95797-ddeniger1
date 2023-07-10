with source as (

    select * from {{ source('main', 'central_park_weather') }}

),

renamed as (
    select
        station as station_id,
        name as station_name,
        date::date as date,
        awnd::double as windspeed_mph,
        prcp::double as precipitation,
        snow::double as snow_fall,
        snwd::double as snow_depth,
        tmax::int as temperature_max,
        tmin::int as temperature_min,
        filename

    from source

)

select * from renamed