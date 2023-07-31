with source_taxis as (

    select pulocationid from {{ ref('mart__fact_all_taxi_trips') }}

),
source_boroughs as (
    select locationid, borough from {{ ref('mart__dim_locations') }}
),
renamed as (
    select
      borough,
      count(*) as trips 
    from source_taxis 
    inner join source_boroughs --excludes null pickup locations and groups by pickup borough
        on source_taxis.pulocationid=source_boroughs.locationid
    group by borough
)

select * from renamed