-- models/parta_claims_header.sql

select
    *,
    'parta_claims_header' as file_name,
    null as ingest_datetime
from read_csv_auto('{{ var("raw_dir") }}/parta_claims_header.csv')
