with source as (

    select * from {{ source('main', 'fhvhv_tripdata') }}

),

renamed as (
    select
        hvfhs_license_num,
        dispatching_base_num,
        originating_base_num,
        request_datetime,
        on_scene_datetime,
        pickup_datetime,
        dropoff_datetime,
        pulocationid as pu_location_id,
        dolocationid as do_location_id,
        trip_miles,
        trip_time,
        base_passenger_fare, --should we remove negative fares?
        tolls,
        bcf,
        sales_tax,
        congestion_surcharge,
        airport_fee,
        tips,
        driver_pay,
        {{ clean_bool('shared_request_flag') }} as shared_request_flag,
        {{ clean_bool('shared_match_flag') }} as shared_match_flag,
        {{ clean_bool('access_a_ride_flag') }} as access_a_ride_flag, --should blanks be TRUE?
        {{ clean_bool('wav_request_flag') }} as wav_request_flag, 
        {{ clean_bool('wav_match_flag') }} as wav_match_flag,
        filename

    from source

)

select * from renamed