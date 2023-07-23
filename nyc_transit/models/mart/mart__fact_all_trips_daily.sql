with source as (

    select * from {{ ref('mart__fact_all_trips') }}

),

renamed as (
    select
      type,
      started_at_ts::DATE as date,
      count(*) as trips,
      avg(duration_min) as average_trip_duration_min

    from source
    group by type, started_at_ts::DATE

)

select * from renamed