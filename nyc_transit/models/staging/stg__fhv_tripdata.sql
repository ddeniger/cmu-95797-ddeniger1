with source as (

    select * from {{ source('main', 'fhv_tripdata') }}

),

renamed as (
    select
        UPPER(dispatching_base_num) as dispatching_base_num, --some ids are lowercase/duplicate
        pickup_datetime,
        dropoff_datetime,
        pulocationid as pu_location_id,
        dolocationid as do_location_id,
        --sr_flag, --Removed due to 100% null source data. No trips were shared.
        UPPER(affiliated_base_number) as affiliated_base_number,
        filename

    from source

)

select * from renamed