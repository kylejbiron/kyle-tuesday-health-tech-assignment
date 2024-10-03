-- models/beneficiary_demographics.sql

select
    *,
    'beneficiary_demographics' as file_name,
    null as ingest_datetime
from read_csv_auto('{{ var("raw_dir") }}/beneficiary_demographics.csv')
