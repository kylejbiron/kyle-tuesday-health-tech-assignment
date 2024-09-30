-- models/analytics/fact_hospice_provider_flattened.sql

with GET_HIS_COMPOSITE_MEASURE as (

    select
        CCN,
        CMS_REGION,
        MEASURE_CODE,
        SCORE,
        FOOTNOTE
    from {{ ref('stg_hospice_provider') }}

    -- H_008_01_ OBSERVED: Facility observed rate | Hospice and Palliative Care Composite Process Measure
    where MEASURE_CODE = 'H_008_01_OBSERVED'

    --filter out records where score is not available
    and SCORE != 'Not Available'

),

GET_HCI_OVERALL_SCORE as (

    select
        CCN,
        CMS_REGION,
        MEASURE_CODE,
        SCORE,
        FOOTNOTE
    from {{ ref('stg_hospice_provider') }}

    -- H_012_00_OBSERVED: Facility observed rate | Hospice Care Index Overall Score
    where MEASURE_CODE = 'H_012_00_OBSERVED'

    --filter out records where score is not available
    and SCORE != 'Not Available'

)

select

    HCI.CCN,
    HCI.CMS_REGION,
    HIS.SCORE as H_008_01_OBSERVED_SCORE,
    HCI.SCORE as H_012_00_OBSERVED_SCORE,
    HIS.FOOTNOTE as H_008_01_OBSERVED_FOOTNOTE,
    HCI.FOOTNOTE as H_012_00_OBSERVED_FOOTNOTE

    -- HCI contains a larger set of CCNs
from GET_HCI_OVERALL_SCORE as HCI
inner join GET_HIS_COMPOSITE_MEASURE as HIS
    on HCI.CCN = HIS.CCN

--note: 
--footnote was brought into this fact table in case we needed to filter on it 
