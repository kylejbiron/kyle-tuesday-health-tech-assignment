-- models/staging/stg_part_a_diagnosis_code.sql

select *
from read_csv_auto('{{ var("raw_dir") }}/parta_diagnosis_code.csv')
