with source as (

    select * from {{ ref('stg__bike_data') }}

),

renamed as (

    select
      start_station_id AS station_id,
      start_station_name AS station_name,
      start_latitude AS station_lat,
      start_longitude AS station_lng
    from source

      UNION

    select
      end_station_id AS station_id,
      end_station_name AS station_name,
      end_latitude AS station_lat,
      end_longitude AS station_lng
    from source

)

select * from renamed where station_id is not null --lots of extra control characters in station_id causing uniqueness error