
--Ingest data from files to duckdb

--bike_data, explicitly define start_station_id so it does not assume DOUBLE 
CREATE TABLE bike_data AS SELECT * FROM read_csv_auto('../data/data/bike/20*-citibike-tripdata.csv.gz', union_by_name=True, types={'start_station_id': VARCHAR});
--central_park_weather,
CREATE TABLE central_park_weather AS SELECT * FROM read_csv_auto('../data/data/central_park_weather.csv', union_by_name=True);
--daily_citi_bike_trip_counts_and_weather,
CREATE TABLE daily_citi_bike_trip_counts_and_weather AS SELECT * FROM read_csv_auto('../data/data/daily_citi_bike_trip_counts_and_weather.csv', union_by_name=True);

--fhv_bases, explicitly define header due to all VARCHAR cols
CREATE TABLE fhv_bases AS SELECT * FROM read_csv_auto('../data/data/fhv_bases.csv', union_by_name=True, header=True);

--fhv_tripdata, 
CREATE TABLE fhv_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/fhv_tripdata_20*.parquet', union_by_name=True);

--fhvhv_tripdata,
CREATE TABLE fhvhv_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/fhvhv_tripdata_20*.parquet', union_by_name=True);

--green_tripdata, 
CREATE TABLE green_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/green_tripdata_20*.parquet', union_by_name=True);

--yellow_tripdata
CREATE TABLE yellow_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/yellow_tripdata_20*.parquet', union_by_name=True);
