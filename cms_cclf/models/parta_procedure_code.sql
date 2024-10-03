-- models/parta_procedure_code.sql

select
    *,
    'parta_procedure_code' as file_name,
    null as ingest_datetime
from read_csv_auto('{{ var("raw_dir") }}/parta_procedure_code.csv')
