-- models/partb_dme.sql

select
    *,
    'partb_dme' as file_name,
    null as ingest_datetime
from read_csv_auto('{{ var("raw_dir") }}/partb_dme.csv')
