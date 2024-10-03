-- models/staging/stg_beneficiary_demographics.sql

select *
from read_csv_auto('{{ var("raw_dir") }}/beneficiary_demographics.csv')
