{{ 
  config(
    materialized='table',
  ) 
}}

SELECT 
    villageentity_id,
    datesurvey,
    CASE 
        WHEN SUM(CASE WHEN environmental_safety = 'Unsafe' THEN 1 ELSE 0 END) > 0 THEN 'Unsafe'
        ELSE 'Safe'
    END AS overall_safety,
    STRING_AGG(CASE WHEN environmental_safety = 'Unsafe' THEN environmental_parameter END, ', ') AS unsafe_parameters,
    survey_year,
    survey_month,
    survey_year_month,
    villagename,
    statename,
    districtname,
    blockname,
    grampanchname,
    purpose_of_test,
    description_of_environmental_source,
    sample_ref,
    test_narrative,
    test_method,
    test_vendor,
    test_options,
    is_tested,
    approval_status,
    entity_type,
    entity_name,
    latitude,
    longitude,
    reporting_date,
    reporting_year,
    reporting_month,
    reporting_year_month
 FROM {{ref('envquality_prod')}}
 GROUP BY 
    villageentity_id,
    reporting_date,
    reporting_year,
    reporting_month,
    reporting_year_month,
    purpose_of_test,
    description_of_environmental_source,
    sample_ref,
    test_narrative,
    test_method,
    test_vendor,
    test_options,
    is_tested,
    approval_status,
    entity_type,
    entity_name,
    latitude,
    longitude,
    datesurvey,
    survey_year,
    survey_month,
    survey_year_month,
    villagename,
    statename,
    districtname,
    blockname,
    grampanchname

