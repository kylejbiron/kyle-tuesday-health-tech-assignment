-- models/staging/stg_part_b_dme.sql

select *
from read_csv_auto('{{ var("raw_dir") }}/partb_dme.csv')
