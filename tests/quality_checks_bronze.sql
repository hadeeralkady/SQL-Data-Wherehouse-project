USE DataWherehouse;

SELECT * FROM bronze.crm_cust_info;
-- ====================================================================
-- Checking 'bronze.crm_cust_info'
-- ====================================================================
-- Check For Nulls or Duplicates in Primary Key
-- Expectation: No Result
SELECT 
cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT (*) > 1 OR cst_id IS NULL;

--Check for unwanted Spaces
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname);

SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname);

-- Data Standardization & Consistency
SELECT DISTINCT 
    cst_gndr
FROM bronze.crm_cust_info;

SELECT DISTINCT 
    cst_marital_status
FROM bronze.crm_cust_info;

-- ====================================================================
-- Checking 'bronze.crm_prd_info'
-- ====================================================================
-- Check For Nulls or Duplicates in Primary Key
SELECT 
    prd_id,
    COUNT(*) 
FROM bronze.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

--Check for unwanted Spaces
SELECT prd_nm
FROM bronze.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Check for NULLs or Negative Values in Cost
SELECT 
    prd_cost 
FROM bronze.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Data Standardization & Consistency
SELECT DISTINCT 
    prd_line 
FROM bronze.crm_prd_info;

-- Check for Invalid Date Orders (Start Date > End Date)
SELECT 
    * 
FROM bronze.crm_prd_info
WHERE prd_end_dt < prd_start_dt;
