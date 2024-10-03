-- models/partb_physicians.sql

select
    *,
    'partb_physicians' as file_name,
    null as ingest_datetime
from read_csv_auto('{{ var("raw_dir") }}/partb_physicians.csv')
