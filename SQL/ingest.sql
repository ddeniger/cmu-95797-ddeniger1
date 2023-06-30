

--bike_data, 
CREATE TABLE bike_data AS SELECT * FROM '../data/data/bike/20*-citibike-tripdata.csv.gz';
--central_park_weather,
CREATE TABLE central_park_weather AS SELECT * FROM '../data/data/central_park_weather.csv';
--daily_citi_bike_trip_counts_and_weather,
CREATE TABLE daily_citi_bike_trip_counts_and_weather AS SELECT * FROM '../data/data/daily_citi_bike_trip_counts_and_weather.csv';

--fhv_bases, 
CREATE TABLE fhv_bases AS SELECT * FROM '../data/data/fhv_bases.csv';

--fhv_tripdata, 
CREATE TABLE fhv_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/fhv_tripdata_20*.parquet');

--fhvhv_tripdata,
CREATE TABLE fhvhv_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/fhvhv_tripdata_20*.parquet');

--green_tripdata, 
CREATE TABLE green_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/green_tripdata_20*.parquet');

--yellow_tripdata
CREATE TABLE yellow_tripdata AS SELECT * FROM read_parquet('../data/data/taxi/yellow_tripdata_20*.parquet');

