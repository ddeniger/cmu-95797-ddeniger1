.echo on 

--Get counts of each table that was ingested
SELECT COUNT(*) AS TBL_CNT, 'daily_citi_bike_trip_counts_and_weather' as TBL_NM from daily_citi_bike_trip_counts_and_weather
UNION
SELECT COUNT(*) AS TBL_CNT, 'bike_data' as TBL_NM from bike_data
UNION
SELECT COUNT(*) AS TBL_CNT, 'central_park_weather' as TBL_NM from central_park_weather
UNION
SELECT COUNT(*) AS TBL_CNT, 'fhv_bases' as TBL_NM from fhv_bases
UNION
SELECT COUNT(*) AS TBL_CNT, 'fhv_tripdata' as TBL_NM from fhv_tripdata
UNION
SELECT COUNT(*) AS TBL_CNT, 'fhvhv_tripdata' as TBL_NM from fhvhv_tripdata
UNION
SELECT COUNT(*) AS TBL_CNT, 'green_tripdata' as TBL_NM from green_tripdata
UNION
SELECT COUNT(*) AS TBL_CNT, 'yellow_tripdata' as TBL_NM from yellow_tripdata;
