with source_bikes as (

    select * from {{ ref('mart__fact_all_bike_trips') }} --not sure if referencing mart is a good idea, but didn't want to duplicate code either

),
source_taxis as (

    select * from {{ ref('mart__fact_all_taxi_trips') }} --not sure if referencing mart is a good idea, but didn't want to duplicate code either

),

renamed as (
    select
      'Taxi - ' || type as type,
      pickup_datetime as started_at_ts,
      dropoff_datetime as ended_at_ts,
      duration_min,
      duration_sec
    from source_taxis

    UNION ALL

    select
      'Bike' as type,
      started_at_ts,
      ended_at_ts,
      duration_min,
      duration_sec
    from source_bikes

)

select * from renamed