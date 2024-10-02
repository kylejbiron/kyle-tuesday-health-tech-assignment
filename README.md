# Tuesday Health: Hospice Quality Metrics Technical Assessment
Author: Kyle Biron  
Email: kylejbiron@gmail.com  
LinkedIn: [linkedin.com/in/kylebiron](https://www.linkedin.com/in/kylebiron/)

## Useful Links
* [Current Measures | CMS](https://www.cms.gov/medicare/quality/hospice/current-measures)
* [HIS Manual](https://www.cms.gov/files/document/hismanualv302apr152024.pdf)
* [Hospice Care Index Technical Report](https://www.cms.gov/files/document/hospice-care-index-hci-technical-reportjuly-2022.pdf)
* Optional read: [Analysis Journal](https://docs.google.com/document/d/1SECftKCQdrU6C_VH_hN-ZWl7HQkYOIakkvui1QyOsz0/edit#heading=h.xwpvjeusiqjw)

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



