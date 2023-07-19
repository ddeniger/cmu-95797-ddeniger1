with source as (

    select * from {{ source('main', 'green_tripdata') }}

),

renamed as (
    select
        vendorid as vendor_id,
        lpep_pickup_datetime,
        lpep_dropoff_datetime,
        {{ flag_to_bool('store_and_fwd_flag') }} as store_and_fwd_flag,
        ratecodeid as rate_code_id, --cast to int?
        pulocationid as pu_location_id,
        dolocationid as do_location_id,
        passenger_count, --cast to int?
        trip_distance, --negative trip distance should be removed?
        fare_amount, --negative fare amount should be removed?
        extra,
        mta_tax, --negative removed?
        tip_amount, --negative removed?
        tolls_amount, --negative removed?
        --ehail_fee, --removed due to 100% null source data
        improvement_surcharge,
        total_amount, --negative removed?
        payment_type, --cast to int?
        trip_type, --cast to int?
        congestion_surcharge,
        filename

    from source

)

select * from renamed