-- models/analytics/fact_hospice_provider_flattened.sql

select
    ccn,
    cms_region,
    h_001_01_denominator,
    h_001_01_observed,
    h_002_01_denominator,
    h_002_01_observed,
    h_003_01_denominator,
    h_003_01_observed,
    h_004_01_denominator,
    h_004_01_observed,
    h_005_01_denominator,
    h_005_01_observed,
    h_006_01_denominator,
    h_006_01_observed,
    h_007_01_denominator,
    h_007_01_observed,
    h_008_01_denominator,

    -- casting below cols as decimal for downstream modeling
    cast(h_008_01_observed as decimal(5, 1)) as h_008_01_observed,

    h_011_01_denominator,
    h_011_01_observed,

    -- casting below cols as decimal for downstream modeling
    cast(h_012_00_observed as decimal(5, 1)) as h_012_00_observed,

    h_012_01_denominator,
    h_012_01_observed,
    h_012_01_percentile,
    h_012_02_denominator,
    h_012_02_observed,
    h_012_02_percentile,
    h_012_03_denominator,
    h_012_03_observed,
    h_012_03_percentile,
    h_012_04_denominator,
    h_012_04_observed,
    h_012_04_percentile,
    h_012_05_denominator,
    h_012_05_observed,
    h_012_05_percentile,
    h_012_06_denominator,
    h_012_06_observed,
    h_012_06_percentile,

    -- casting below cols as decimal for downstream modeling
    cast(replace(h_012_07_denominator, ',', '') as decimal(15, 2)) as h_012_07_denominator,
    cast(replace(h_012_07_observed, ',', '') as decimal(15, 2)) as h_012_07_observed,

    h_012_07_percentile,
    h_012_08_denominator,
    h_012_08_observed,
    h_012_08_percentile,
    h_012_09_denominator,
    h_012_09_observed,
    h_012_09_percentile,
    h_012_10_denominator,
    h_012_10_observed,
    h_012_10_percentile,
    average_daily_census,
    bene_dual_pct,
    bene_ma_pct,
    care_provided_assisted_living,
    care_provided_home,
    care_provided_inpatient_hospice,
    care_provided_inpatient_hospital,
    care_provided_nursing_facility,
    care_provided_skilled_nursing,
    care_provided_other_locations,

    -- casting below cols as int for downstream modeling
    cast(pct_pts_w_cancer as int) as pct_pts_w_cancer,
    cast(pct_pts_w_circ_heart_disease as int) as pct_pts_w_circ_heart_disease,
    cast(pct_pts_w_dementia as int) as pct_pts_w_dementia,
    cast(pct_pts_w_resp_disease as int) as pct_pts_w_resp_disease,
    cast(pct_pts_w_stroke as int) as pct_pts_w_stroke,
    cast(pct_pts_w_other_conditions as int) as pct_pts_w_other_conditions,

    provided_home_care_and_other,
    provided_home_care_only,

    -- round to the next highest integer to proxy length of stay
    cast(ceil(cast(replace(h_012_07_observed, ',', '') as numeric) / 200) as int) as los_proxy

from {{ ref('stg_hospice_provider_flattened') }}
