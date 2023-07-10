with source as (

    select * from {{ source('main', 'bike_data') }}

),

renamed as (
    select
        tripduration::bigint as trip_duration,
        coalesce(starttime, started_at)::timestamp as trip_start_datetime,
        coalesce(stoptime, ended_at)::timestamp as trip_end_datetime,
        coalesce("start station id", start_station_id) as start_station_id, --start_station_id might need cleaning, then cast to int
        coalesce("start station name", start_station_name) as start_station_name,
        coalesce("start station latitude", start_lat)::double as start_latitude,
        coalesce("start station longitude", start_lng)::double as start_longitude,
        coalesce("end station id", end_station_id) as end_station_id, --end_station_id might need cleaning, then cast to int
        coalesce("end station name", end_station_name) as end_station_name,
        coalesce("end station latitude", end_lat)::double as end_latitude,
        coalesce("end station longitude", end_lng)::double as end_longitude,
        bikeid as bike_id,
        usertype as user_type,
        "birth year"::int as user_birth_year,
        gender::int as user_gender,
        ride_id,
        rideable_type,
        member_casual,
        filename

    from source

)

select * from renamed