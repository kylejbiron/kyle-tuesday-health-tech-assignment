-- models/parta_diagnosis_code.sql

select
    *,
    'parta_diagnosis_code' as file_name,
    null as ingest_datetime
from read_csv_auto('{{ var("raw_dir") }}/parta_diagnosis_code.csv')
