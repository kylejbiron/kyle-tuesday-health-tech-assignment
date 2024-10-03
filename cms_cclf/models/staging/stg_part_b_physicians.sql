-- models/staging/stg_part_b_physicians.sql

select *
from read_csv_auto('{{ var("raw_dir") }}/partb_physicians.csv')
