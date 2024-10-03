-- models/staging/stg_part_a_claims_revenue_center_detail.sql

select *
from
    read_csv_auto('{{ var("raw_dir") }}/parta_claims_revenue_center_detail.csv')
