with source as (

    select * from {{ ref('stg__bike_data') }}

),


renamed as (
    select
      trip_start_datetime as started_at_ts,
      trip_end_datetime as ended_at_ts,
      trip_duration/60 as duration_min,
      trip_duration as duration_sec,
      start_station_id,
      end_station_id

    from source

)

select * from renamed