-- Load center medicare service dataset
SELECT 
  * 
FROM 
  practice..center_medicare_service 
  
-- Looking bene count based on drug name and generic name
SELECT 
  drug_name, 
  generic_name, 
  ISNULL(bene_count, '0') AS bene_count_clean 
FROM 
  practice..center_medicare_service 
ORDER BY 
  drug_name ASC 
  
-- Looking bene count at age +65 based on generic name and provider city
SELECT 
  generic_name, 
  nppes_provider_city, 
  ISNULL(bene_count_ge65, '0') AS bene_count_ge65 
FROM 
  practice..center_medicare_service 
ORDER BY 
  generic_name ASC 
  
-- Looking total claim account based on provider organization 
SELECT 
  nppes_provider_last_org_name, 
  total_claim_count 
FROM 
  practice..center_medicare_service 
ORDER BY 
  nppes_provider_last_org_name ASC 
  
-- Looking total all claim count based on drug name, provider city and generic name 
SELECT 
  drug_name, 
  nppes_provider_city, 
  generic_name, 
  SUM(
    total_claim_count + total_claim_count_ge65
  ) AS all_claim_count 
FROM 
  practice..center_medicare_service 
GROUP BY 
  drug_name, 
  nppes_provider_city, 
  generic_name 
ORDER BY 
  drug_name ASC 
  
-- Looking total all supply based on provider organization, provider city and provider state at new york
SELECT 
  nppes_provider_last_org_name, 
  nppes_provider_city, 
  nppes_provider_state, 
  SUM(
    total_day_supply + total_day_supply_ge65
  ) AS all_day_supply 
FROM 
  practice..center_medicare_service 
WHERE 
  nppes_provider_state = 'NY' 
GROUP BY 
  nppes_provider_last_org_name, 
  nppes_provider_city, 
  nppes_provider_state 
  
-- Looking total all drug cost per month based on drug name, provider city, provider state and provider organization
SELECT 
  drug_name, 
  nppes_provider_city, 
  nppes_provider_state, 
  nppes_provider_last_org_name, 
  SUM(
    total_drug_cost + total_drug_cost_ge65
  ) * 30 AS all_drug_cost_per_month 
FROM 
  practice..center_medicare_service 
GROUP BY 
  drug_name, 
  nppes_provider_city, 
  nppes_provider_state, 
  nppes_provider_last_org_name 
ORDER BY 
  drug_name ASC 
  
-- Looking total claim count based on provider first name and generic name
SELECT 
  nppes_provider_first_name, 
  generic_name, 
  total_claim_count 
FROM 
  practice..center_medicare_service 
ORDER BY 
  nppes_provider_first_name ASC 
  
-- Looking total claim count, total day supply and total drug cost per month based on provider city
SELECT 
  nppes_provider_city, 
  (total_claim_count * 30) AS total_claim_per_month, 
  (total_day_supply * 30) AS total_supply_per_month, 
  (total_drug_cost * 30) AS total_drug_cost_per_month 
FROM 
  practice..center_medicare_service 
ORDER BY 
  nppes_provider_city ASC 
  
-- Looking total claim count vs total day supply per month which total day supply has less than equals to 500 based on organization name and provider state
SELECT 
  nppes_provider_last_org_name, 
  nppes_provider_state, 
  SUM(total_claim_count * 30) AS total_claim_count_per_month, 
  SUM(total_day_supply) AS total_day_supply_per_month 
FROM 
  practice..center_medicare_service 
GROUP BY 
  nppes_provider_last_org_name, 
  nppes_provider_state 
HAVING 
  SUM(total_day_supply) <= 500 
ORDER BY 
  nppes_provider_last_org_name ASC 
  
-- Looking supply description based on provider city, provider state, specialty description, drug name, generic name and total day supply
SELECT 
  nppes_provider_city, 
  nppes_provider_state, 
  specialty_description, 
  drug_name, 
  generic_name, 
  total_day_supply, 
  CASE WHEN total_day_supply > 5000 THEN 'Very Enough' WHEN total_day_supply = 5000 THEN 'Enough' ELSE 'Very Less' END AS supply_description 
FROM 
  practice..center_medicare_service 
  
-- Looking total day supply based on organization name, provider city and specialty description on clinic/center, Peripheral Vascular Disease and Pharmacist  
SELECT 
  nppes_provider_last_org_name, 
  nppes_provider_city, 
  specialty_description, 
  total_day_supply 
FROM 
  practice..center_medicare_service 
WHERE 
  specialty_description IN (
    'Clinic/Center', 'Peripheral Vascular Disease', 
    'Pharmacist'
  ) 
ORDER BY 
  nppes_provider_last_org_name ASC
