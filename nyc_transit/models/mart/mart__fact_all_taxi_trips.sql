with source_fhv as (

    select * from {{ ref('stg__fhv_tripdata') }}

),
source_fhvhv as (

    select * from {{ ref('stg__fhvhv_tripdata') }}

),
source_green as (

    select * from {{ ref('stg__green_tripdata') }}

),
source_yellow as (

    select * from {{ ref('stg__yellow_tripdata') }}

),

renamed as (
    select
      'Yellow' as type,
      tpep_pickup_datetime as pickup_datetime,
      tpep_dropoff_datetime as dropoff_datetime,
      date_diff('minute', tpep_pickup_datetime, tpep_dropoff_datetime) as duration_min,
      date_diff('second', tpep_pickup_datetime, tpep_dropoff_datetime) as duration_sec,
      pu_location_id as pulocationid,
      do_location_id as dolocationid
    from source_yellow

    UNION ALL

        select
      'Green' as type,
      lpep_pickup_datetime as pickup_datetime,
      lpep_dropoff_datetime as dropoff_datetime,
      date_diff('minute', lpep_pickup_datetime, lpep_dropoff_datetime) as duration_min,
      date_diff('second', lpep_pickup_datetime, lpep_dropoff_datetime) as duration_sec,
      pu_location_id as pulocationid,
      do_location_id as dolocationid
    from source_green

    UNION ALL

        select
      'FHV' as type,
      pickup_datetime,
      dropoff_datetime,
      date_diff('minute', pickup_datetime, dropoff_datetime) as duration_min,
      date_diff('second', pickup_datetime, dropoff_datetime) as duration_sec,
      pu_location_id as pulocationid,
      do_location_id as dolocationid
    from source_fhv

    UNION ALL

        select
      'FHVHV' as type,
      pickup_datetime,
      dropoff_datetime,
      date_diff('minute', pickup_datetime, dropoff_datetime) as duration_min,
      date_diff('second', pickup_datetime, dropoff_datetime) as duration_sec,
      pu_location_id as pulocationid,
      do_location_id as dolocationid
    from source_fhvhv
)

select * from renamed