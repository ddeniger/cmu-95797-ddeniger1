# ddeniger 7/1/2023
# run_week1.sh : 
# Orchestrate steps to download s3 data, ingest to duckdb, and validate schemas/counts
aws s3 sync s3://cmu-95797-23m6 ../data/ --no-sign-request
../../duckdb main.db -s ".read ../SQL/ingest.sql"
../../duckdb main.db -s ".read ../SQL/dump_raw_schemas.sql" > ../Answers/raw_schemas.txt
../../duckdb main.db -s ".read ../SQL/dump_raw_counts.sql" > ../Answers/raw_counts.txt

