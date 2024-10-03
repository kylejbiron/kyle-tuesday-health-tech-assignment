-- models/staging/stg_part_a_claims_header.sql

select *
from read_csv_auto('{{ var("raw_dir") }}/parta_claims_header.csv')
