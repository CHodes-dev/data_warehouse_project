/* 
=========================================================================
Quality Checks
=========================================================================
Script Purpose:
	This script performs various quality checks for data consistency,
	accuracy, and standarization across the 'silver' schemas. It includes
	checks for:
	- Null or duplicate primary keys
	- Unwanted spaces in string fields
	- Data standarization and consistency
	- Invalid date ranges and orders
	- Data consistency between related fields

Usage Notes:
	- Run these checks after data loading Silver Layer
	- Investigate and resolve any discrepancies found during the checks
=========================================================================
*/

-- =====================================================================
-- Checking 'silver.crm_cust_info'
-- =====================================================================

/* (1) Check for NULLs or Duplicates in Primary Key
	Expectation: No Results */

-- column cst_id
select
	cst_id,
	count(*)
from silver.crm_cust_info
group by cst_id
having count(*) > 1 or cst_id is null

-- column cst_key 
select
	cst_key,
	count(*)
from silver.crm_cust_info
group by cst_key
having count(*) > 1 or cst_key is null

/* (2) Check for unwanted spaces 
	Ecpectation: No Result */

-- column cst_firstname
select
	cst_firstname
from silver.crm_cust_info
where cst_firstname <> trim(cst_firstname)

-- column cst_lastname
select
	cst_lastname
from silver.crm_cust_info
where cst_lastname <> trim(cst_lastname)

-- column cst_marital_status
select
	cst_marital_status
from silver.crm_cust_info
where cst_marital_status <> trim(cst_marital_status)

-- column cst_gndr
select
	cst_gndr
from silver.crm_cust_info
where cst_gndr <> trim(cst_gndr)

/* (3) Data standarization & consistency 
	Expectation: */

-- column cst_gndr
select distinct cst_gndr
from silver.crm_cust_info

-- column cst_marital_status
select distinct cst_marital_status
from silver.crm_cust_info

-- =====================================================================
-- Checking 'silver.crm_prd_info'
-- =====================================================================

/* (1) Check for NULLs or Duplicates in Primary Key
	Expectation: No Results */
select
	prd_id,
	count(*)
from bronze.crm_prd_info
group by prd_id
having count(*) > 1 or prd_id is null

/* (2) Check for unwanted spaces 
	Ecpectation: No Result */
select
	prd_nm
from silver.crm_prd_info
where prd_nm<> trim(prd_nm)

/* (3) Check for irrational values and NULL
	Expectation: No Result */
select
	prd_cost
from silver.crm_prd_info
where prd_cost < 0 or prd_cost is null

/* (4) Data standarization & consistency */
select distinct prd_line
from silver.crm_prd_info

/* (5) Check for invalid date orders
	Expectation: No Result */
select
	*
from silver.crm_prd_info
where prd_end_dt < prd_start_dt

-- =====================================================================
-- Checking 'silver.crm_sales_details'
-- =====================================================================

/* (1) Check for data logic
	Expectation: No Result */
select 
	*
from silver.crm_sales_details
where sls_order_dt > sls_ship_dt or sls_order_dt > sls_due_dt

/* (2) Check for data consistency
	Expectation: No NULL, 0, or Negative */
select distinct
	sls_sales,
	sls_quantity,
	sls_price
from silver.crm_sales_details
where	sls_sales <> sls_quantity*sls_price
or		sls_sales is null 
or		sls_quantity is null 
or		sls_price is null
or		sls_sales <= 0 
or		sls_quantity <= 0 
or		sls_price <= 0
order by sls_sales, sls_quantity, sls_price

-- =====================================================================
-- Checking 'silver.erp_cust_az12'
-- =====================================================================

/* (1) Check for data consistency
	Excpectation: No Result */
select cid
from silver.erp_cust_az12
where cid = 'NAS%'

/* (2) Identify out-of-range dates
	Expectation: No Result */
select distinct bdate
from silver.erp_cust_az12
where bdate < '1924-02-02' or bdate > getdate()
--> Older record still exist but there is no illogical data

/* (3) Data standarization & consistency */
select distinct gen
from silver.erp_cust_az12

-- =====================================================================
-- Checking 'silver.erp_loc_a101'
-- =====================================================================

/* (1) Check for data consistency
	Excpectation: No Result */ 
select cid
from silver.erp_loc_a101
where cid = '%-%'

/* (2) Data standarization & consistency */
select distinct cntry
from silver.erp_loc_a101
order by cntry

-- =====================================================================
-- Checking 'silver.erp_px_cat_g1v2'
-- =====================================================================

/* (1) Check for unwanted spaces
	Expectation: No Result */
select cat
from bronze.erp_px_cat_g1v2
where cat <> trim(cat);

/* (2) Data standarization & consistency */

-- column cat
select distinct cat
from bronze.erp_px_cat_g1v2;

-- column subcat
select distinct subcat
from bronze.erp_px_cat_g1v2;

-- column maintenance
select distinct MAINTENANCE
from bronze.erp_px_cat_g1v2;
