*
==========================================================================
Quality Checks
==========================================================================
Script Purpose:
	This script performs quality checks to validate the integrity, 
	consistency, and accuracy of the Gold Layer, these check ensure:
	- Uniqueness of surrogate keys in dimension tables.
	- Referential integrity between fact and dimension tables
	- Validation of relationship in the data model for analytical purposes.

Usage:
	- Run these checks after data loading Silver Layer.
	- Investigate and resolve any discrepancies found during the checks
==========================================================================
*/

-- =======================================================================
-- Checking table: gold.dim_customers
-- =======================================================================
-- Check for uniqueness of customer_key in gold.dim_customers
select
	customer_key,
	count(*) as duplicate_count
from gold.dim_customers
group by customer_key
having count(*) > 1;

-- =======================================================================
-- Checking table: gold.dim_products
-- =======================================================================
-- Check for uniquness of product_key in gold.dim_products
-- Expectation: No Results
select
	product_key,
	count(*) as duplicate_count
from gold.dim_products
group by product_key
having count(*) > 1;

-- =======================================================================
-- Checking table: gold.fact_sales
-- =======================================================================
-- Check the data table model connectivity between fact and dimensions
select distinct f.product_key
from gold.fact_sales f
left join gold.dim_products p
  on p.product_key = f.product_key
where p.product_key is null;
