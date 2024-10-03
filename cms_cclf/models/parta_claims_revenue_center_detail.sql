-- models/parta_claims_revenue_center_detail.sql

select
    *,
    'parta_claims_revenue_center_detail' as file_name,
    null as ingest_datetime
from
    read_csv_auto('{{ var("raw_dir") }}/parta_claims_revenue_center_detail.csv')
