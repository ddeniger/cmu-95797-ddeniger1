
#aws s3 sync s3://cmu-95797-23m6 ../data/ --no-sign-request
../../duckdb main.db -s ".read ../SQL/ingest.sql"
#../../duckdb main.db -s ".read ../SQL/dump_raw_schemas.sql" > ../Answers/raw_schemas.txt
#../../duckdb main.db -s ".read ../SQL/dump_raw_counts.sql" > ../Answers/raw_counts.txt

#python dump_raw_counts.py > ../Answers/raw_counts.txt
