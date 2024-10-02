# Welcome to the ```hospice_quality_metrics``` project!

### Getting oriented

```bash
hospice_quality_metrics/
├── macros/              # Custom macros to reuse SQL logic (currently unused)
├── models/              # Contains all dbt models (SQL files)
│   ├── analytics/       # Business logic models and analysis prep
│   └── staging/         # ETL to prepare raw data 
├── notebooks/           # Jupyrter notebooks
├── raw/                 # Raw data (i.e. CSVs)
└── tests/               # Custom data quality tests as needed
```
