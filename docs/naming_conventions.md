**Naming Conventions**

# **Overview**

This document outlines the naming conventions used for schemas, tables, views, columns, and other objects in the data warehouse.

## **General Principles**

- Naming Conventions: Use snake_case, with lowercase letters and underscores (\_) to separate words.
- Language: Use English for all names.
- Avoid Reserved Words: Do not use SQL reserved words as object names.

## **Table Naming Conventions**

### Bronze Rules

- All names must start with the source system name, and table names must match their original names without renaming.
- **&lt;sourcesystem&gt;\_&lt;entity&gt;**
- &lt;sourcesystem&gt;: Name of the source system (e.g., crm, erp).
- &lt;entity&gt;: Exact table name from the source system.
- Example: crm_customer_info → Customer information from the CRM system.

### Silver Rules

- All names must start with the source system name, and table names must match their original names without renaming.
- **&lt;sourcesystem&gt;\_&lt;entity&gt;**
- &lt;sourcesystem&gt;: Name of the source system (e.g., crm, erp).
- &lt;entity&gt;: Exact table name from the source system.
- Example: crm_customer_info → Customer information from the CRM system.

### Gold Rules

- All names must use meaningful, business-aligned names for tables, starting with the category prefix.
- **&lt;category&gt;\_&lt;entity&gt;**
  - &lt;category&gt;: Describes the role of the table, such as dim (dimension) or fact (fact table).
  - &lt;entity&gt;: Descriptive name of the table, aligned with the business domain (e.g., customers, products, sales).
  - Examples:
    - dim_customers → Dimension table for customer data.
    - fact_sales → Fact table containing sales transactions.

**Glossary of Category Patterns**

| Pattern  | Meaning         | Example(s)                             |
| -------- | --------------- | -------------------------------------- |
| dim\_    | Dimension table | dim_customer, dim_product              |
| fact\_   | Fact table      | fact_sales                             |
| report\_ | Report table    | report_customers, report_sales_monthly |

## **Column Naming Conventions**

### Surrogate Keys

- All primary keys in dimension tables must use the suffix \_key.
- **&lt;table_name&gt;\_key**
  - &lt;table_name&gt;: Refers to the name of the table or entity the key belongs to.
  - \_key: A suffix indicating that this column is a surrogate key.
  - Example: customer_key → Surrogate key in the dim_customers table.

### Technical Columns

- All technical columns must start with the prefix dwh\_, followed by a descriptive name indicating the column's purpose.
- **dwh\_&lt;column_name&gt;**
  - dwh: Prefix exclusively for system-generated metadata.
  - &lt;column_name&gt;: Descriptive name indicating the column's purpose.
  - Example: dwh_load_date → System-generated column used to store the date when the record was loaded.

## **Stored Procedure**

- All stored procedures used for loading data must follow the naming pattern:
- **load\_&lt;layer&gt;**.
  - &lt;layer&gt;: Represents the layer being loaded, such as bronze, silver, or gold.
  - Example:
    - load_bronze → Stored procedure for loading data into the Bronze layer.
    - load_silver → Stored procedure for loading data into the Silver layer.
