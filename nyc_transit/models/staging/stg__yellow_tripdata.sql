with source as (

    select * from {{ source('main', 'yellow_tripdata') }}

),

renamed as (
    select
        vendorid as vendor_id,
        tpep_pickup_datetime,
        tpep_dropoff_datetime,
        passenger_count, --convert to int?
        trip_distance, --remove negatives?
        ratecodeid as rate_code_id, --convert to int?
        {{ clean_bool('store_and_fwd_flag') }} as store_and_fwd_flag,
        pulocationid as pu_location_id,
        dolocationid as do_location_id,
        payment_type,
        fare_amount, --remove negatives?
        extra, --remove negatives?
        mta_tax, --remove negatives?
        tip_amount, --remove negatives?
        tolls_amount, --remove negatives?
        improvement_surcharge,
        total_amount,
        congestion_surcharge,
        airport_fee,
        filename

    from source

)

select * from renamed