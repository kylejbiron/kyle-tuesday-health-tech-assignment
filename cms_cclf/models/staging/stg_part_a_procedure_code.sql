-- models/staging/stg_part_a_procedure_code.sql

select *
from read_csv_auto('{{ var("raw_dir") }}/parta_procedure_code.csv')
