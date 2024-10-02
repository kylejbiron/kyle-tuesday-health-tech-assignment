# Tuesday Health: Hospice Quality Metrics Technical Assessment
Author: Kyle Biron  
Email: kylejbiron@gmail.com  
LinkedIn: [linkedin.com/in/kylebiron](https://www.linkedin.com/in/kylebiron/)

## Useful Links
* [Current Measures | CMS](https://www.cms.gov/medicare/quality/hospice/current-measures)
* [HIS Manual](https://www.cms.gov/files/document/hismanualv302apr152024.pdf)
* [Hospice Care Index Technical Report](https://www.cms.gov/files/document/hospice-care-index-hci-technical-reportjuly-2022.pdf)
* Optional read: [Analysis Journal](https://docs.google.com/document/d/1SECftKCQdrU6C_VH_hN-ZWl7HQkYOIakkvui1QyOsz0/edit#heading=h.xwpvjeusiqjw)

## Prompt

This is the hospice quality metrics dataset that CMS publishes annually.  We’d like you to use this dataset to answer a few questions:

1. How correlated is the HIS composite process metric and the HCI decile?  Based on the HIS process metric distribution, what do you think the pros and cons are of this quality measure?
> Response: see [hospice_analysis.ipynb](hospice_quality_metrics/notebooks/hospice_analysis.ipynb)
2. This dataset provides some information on the condition mix at each hospice (cancer, heart disease, dementia, respiratory disease, stroke).  Based on the hospice-level patient mix, which conditions appear to have longer hospice lengths-of-stay?  Note: this dataset doesn’t have a LOS variable.  However, you can use an average per diem of $200 to convert per-beneficiary spending to a LOS (this is the approximate per-diem for RHC (routine home care) which constitutes the majority of hospice claims).  Based on this finding, do you have any concerns about the construction of the HCI quality measure?
> Response: see [hospice_analysis.ipynb](hospice_quality_metrics/notebooks/hospice_analysis.ipynb)
3. Now imagine you’re working with someone in clinical operations.  They want to be able to zoom in on a geography and see the top hospices (based on quality metrics) operating in that geography.  Sketch out a schema (e.g. dimension and fact tables) that you might build in dbt to deliver that information via a BI tool.
> Response: see [analytics.yml](hospice_quality_metrics/models/analytics/analytics.yml)
> - [fact_hospice_provider_flattened](https://github.com/kylejbiron/kyle-tuesday-health-tech-assignment/blob/main/hospice_quality_metrics/models/analytics/analytics.yml#L4)
> - [dim_hospice_provider_geography](https://github.com/kylejbiron/kyle-tuesday-health-tech-assignment/blob/main/hospice_quality_metrics/models/analytics/analytics.yml#L211)

## Join Condition

The tables are joined on the `ccn` (CMS Certification Number) column, which is the primary key in both tables:



## Prerequisites
- ```Python 3.9``` or higher
- ```Poetry``` (for managing dependencies)
>If you don’t have Poetry installed, you can install it using:  

```
curl -sSL https://install.python-poetry.org | python3 -
```

## Getting Started

1. Clone the repository:

```
git clone https://github.com/kylejbiron/kyle-tuesday-health-tech-assignment.git
```


2. Install dependencies:  
> Use Poetry to install the project dependencies by running:


```
poetry install
```


3. Activate the virtual environment:
> Once the dependencies are installed, you can activate the Poetry-managed environment:

```
poetry shell
```

> Alternatively, you can run commands directly using poetry run without activating the shell, like this:

```
poetry run pre-commit run --all-files 
```

4. Retrieving and loading the raw CSV file

> download ```Hospice_Provider_Aug2024.csv``` from https://data.cms.gov/provider-data/dataset/252m-zfp9#data-table  and place it in this directory within the project:

```/kyle-tuesday-health-tech-assignment/hospice_quality_metrics/raw/```



