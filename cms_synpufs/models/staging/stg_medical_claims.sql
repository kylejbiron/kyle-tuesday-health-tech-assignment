-- models/staging/stg_medical_claims.sql

SELECT
    DESYNPUF_ID,
    CLM_ID,
    SEGMENT,
    CLM_FROM_DT,
    CLM_THRU_DT,
    PRVDR_NUM,
    CLM_PMT_AMT,
    NCH_PRMRY_PYR_CLM_PD_AMT,
    AT_PHYSN_NPI,
    OP_PHYSN_NPI,
    OT_PHYSN_NPI,
    CLM_ADMSN_DT,                          -- Inpatient column, leave as is
    ADMTNG_ICD9_DGNS_CD,
    CLM_PASS_THRU_PER_DIEM_AMT,             -- Inpatient column, leave as is
    NCH_BENE_IP_DDCTBL_AMT,                 -- Inpatient column, leave as is
    NCH_BENE_PTA_COINSRNC_LBLTY_AM,         -- Inpatient column, leave as is
    NCH_BENE_BLOOD_DDCTBL_LBLTY_AM,
    CLM_UTLZTN_DAY_CNT,                     -- Inpatient column, leave as is
    NCH_BENE_DSCHRG_DT,                     -- Inpatient column, leave as is
    CLM_DRG_CD,                             -- Inpatient column, leave as is
    ICD9_DGNS_CD_1,
    ICD9_DGNS_CD_2,
    ICD9_DGNS_CD_3,
    ICD9_DGNS_CD_4,
    ICD9_DGNS_CD_5,
    ICD9_DGNS_CD_6,
    ICD9_DGNS_CD_7,
    ICD9_DGNS_CD_8,
    ICD9_DGNS_CD_9,
    ICD9_DGNS_CD_10,
    ICD9_PRCDR_CD_1,
    ICD9_PRCDR_CD_2,
    ICD9_PRCDR_CD_3,
    ICD9_PRCDR_CD_4,
    ICD9_PRCDR_CD_5,
    ICD9_PRCDR_CD_6,
    NULL AS NCH_BENE_PTB_DDCTBL_AMT,        -- Outpatient column, set to NULL
    NULL AS NCH_BENE_PTB_COINSRNC_AMT,      -- Outpatient column, set to NULL
    HCPCS_CD_1,
    HCPCS_CD_2,
    HCPCS_CD_3,
    HCPCS_CD_4,
    HCPCS_CD_5,
    HCPCS_CD_6,
    HCPCS_CD_7,
    HCPCS_CD_8,
    HCPCS_CD_9,
    HCPCS_CD_10,
    HCPCS_CD_11,
    HCPCS_CD_12,
    HCPCS_CD_13,
    HCPCS_CD_14,
    HCPCS_CD_15,
    HCPCS_CD_16,
    HCPCS_CD_17,
    HCPCS_CD_18,
    HCPCS_CD_19,
    HCPCS_CD_20,
    HCPCS_CD_21,
    HCPCS_CD_22,
    HCPCS_CD_23,
    HCPCS_CD_24,
    HCPCS_CD_25,
    HCPCS_CD_26,
    HCPCS_CD_27,
    HCPCS_CD_28,
    HCPCS_CD_29,
    HCPCS_CD_30,
    HCPCS_CD_31,
    HCPCS_CD_32,
    HCPCS_CD_33,
    HCPCS_CD_34,
    HCPCS_CD_35,
    HCPCS_CD_36,
    HCPCS_CD_37,
    HCPCS_CD_38,
    HCPCS_CD_39,
    HCPCS_CD_40,
    HCPCS_CD_41,
    HCPCS_CD_42,
    HCPCS_CD_43,
    HCPCS_CD_44,
    HCPCS_CD_45,
    'IP' AS TOS
FROM
    read_csv_auto(
        '{{ var("raw_dir") }}/DE1_0_2008_to_2010_Inpatient_Claims_Sample_1.csv',
        TYPES = {
            'ICD9_PRCDR_CD_1': 'VARCHAR',
            'ICD9_PRCDR_CD_2': 'VARCHAR',
            'ICD9_PRCDR_CD_3': 'VARCHAR',
            'ICD9_PRCDR_CD_4': 'VARCHAR',
            'ICD9_PRCDR_CD_5': 'VARCHAR',
            'ICD9_PRCDR_CD_6': 'VARCHAR'
        }
    )

UNION ALL

SELECT
    DESYNPUF_ID,
    CLM_ID,
    SEGMENT,
    CLM_FROM_DT,
    CLM_THRU_DT,
    PRVDR_NUM,
    CLM_PMT_AMT,
    NCH_PRMRY_PYR_CLM_PD_AMT,
    AT_PHYSN_NPI,
    OP_PHYSN_NPI,
    OT_PHYSN_NPI,
    NULL AS CLM_ADMSN_DT,                  -- Inpatient column, set to NULL
    ADMTNG_ICD9_DGNS_CD,
    NULL AS CLM_PASS_THRU_PER_DIEM_AMT,     -- Inpatient column, set to NULL
    NULL AS NCH_BENE_IP_DDCTBL_AMT,         -- Inpatient column, set to NULL
    NULL AS NCH_BENE_PTA_COINSRNC_LBLTY_AM, -- Inpatient column, set to NULL
    NCH_BENE_BLOOD_DDCTBL_LBLTY_AM,
    NULL AS CLM_UTLZTN_DAY_CNT,             -- Inpatient column, set to NULL
    NULL AS NCH_BENE_DSCHRG_DT,             -- Inpatient column, set to NULL
    NULL AS CLM_DRG_CD,                     -- Inpatient column, set to NULL
    ICD9_DGNS_CD_1,
    ICD9_DGNS_CD_2,
    ICD9_DGNS_CD_3,
    ICD9_DGNS_CD_4,
    ICD9_DGNS_CD_5,
    ICD9_DGNS_CD_6,
    ICD9_DGNS_CD_7,
    ICD9_DGNS_CD_8,
    ICD9_DGNS_CD_9,
    ICD9_DGNS_CD_10,
    ICD9_PRCDR_CD_1,
    ICD9_PRCDR_CD_2,
    ICD9_PRCDR_CD_3,
    ICD9_PRCDR_CD_4,
    ICD9_PRCDR_CD_5,
    ICD9_PRCDR_CD_6,
    NCH_BENE_PTB_DDCTBL_AMT,                -- Outpatient column, leave as is
    NCH_BENE_PTB_COINSRNC_AMT,              -- Outpatient column, leave as is
    HCPCS_CD_1,
    HCPCS_CD_2,
    HCPCS_CD_3,
    HCPCS_CD_4,
    HCPCS_CD_5,
    HCPCS_CD_6,
    HCPCS_CD_7,
    HCPCS_CD_8,
    HCPCS_CD_9,
    HCPCS_CD_10,
    HCPCS_CD_11,
    HCPCS_CD_12,
    HCPCS_CD_13,
    HCPCS_CD_14,
    HCPCS_CD_15,
    HCPCS_CD_16,
    HCPCS_CD_17,
    HCPCS_CD_18,
    HCPCS_CD_19,
    HCPCS_CD_20,
    HCPCS_CD_21,
    HCPCS_CD_22,
    HCPCS_CD_23,
    HCPCS_CD_24,
    HCPCS_CD_25,
    HCPCS_CD_26,
    HCPCS_CD_27,
    HCPCS_CD_28,
    HCPCS_CD_29,
    HCPCS_CD_30,
    HCPCS_CD_31,
    HCPCS_CD_32,
    HCPCS_CD_33,
    HCPCS_CD_34,
    HCPCS_CD_35,
    HCPCS_CD_36,
    HCPCS_CD_37,
    HCPCS_CD_38,
    HCPCS_CD_39,
    HCPCS_CD_40,
    HCPCS_CD_41,
    HCPCS_CD_42,
    HCPCS_CD_43,
    HCPCS_CD_44,
    HCPCS_CD_45,
    'OP' AS TOS
FROM
    read_csv_auto(
        '{{ var("raw_dir") }}/DE1_0_2008_to_2010_Outpatient_Claims_Sample_1.csv',
        TYPES = {
            'ICD9_PRCDR_CD_1': 'VARCHAR',
            'ICD9_PRCDR_CD_2': 'VARCHAR',
            'ICD9_PRCDR_CD_3': 'VARCHAR',
            'ICD9_PRCDR_CD_4': 'VARCHAR',
            'ICD9_PRCDR_CD_5': 'VARCHAR',
            'ICD9_PRCDR_CD_6': 'VARCHAR'
        }
    )
