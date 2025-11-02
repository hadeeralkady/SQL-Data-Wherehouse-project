USE DataWherehouse;

SELECT * FROM bronze.crm_cust_info;

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
