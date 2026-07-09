# Data Warehouse Project

## Introduction

This project demonstrates a comprehensive data warehousing and analytics solution, from building a data warehouse to generating actionable insights. Starting from raw CSV files, it walks through the entire journey of data: ingestion, cleaning, transformation, and loading into a structured warehouse ready for analysis. Designed as a portfolio project, it highlights industry best practices in data engineering and analytics.

> ⚠️ **Heads up!**
> This project is part of a **free course by [Data with Baraa](https://www.blog.datawithbaraa.com/)**. The raw data, structure, and workflow in this repository follow his original course material. Full credit goes to him for the curriculum and dataset.
> This repo serves as my personal learning documentation [not an original work].

---

## 📌 Overview

This project demonstrates the end-to-end process of building a **Data Warehouse** for a retail business using **SQL** and a **Star Schema (Kimball)** approach. This project onvolves:
1. **Data Architecture**: Designing a Modern Data Warehouse using Medallion Architecture (Bronze, Silver, and Gold layers).
2. **ETL Pipelines**: Extracting, transforming, and loading data from CSV source files into the warehouse.
3. **Data Modeling**: Developing fact and dimension tables optimized for analytical queries using the Star Schema / Kimball methodology.
4. **Analytics & Reporting**: Creating SQL-based reports to generate actionable insights across sales & revenue, customer behavior, and product performance.

🎯 This repository is an excellent resource for professionals and students looking to showcase expertise in:
- SQL Development
- Data Architecture
- Data Engineering
- ETL Pipeline Development
- Data Modeling
- Data Analytics

---

## 🛠️ Tools & Resources

| **Tool** | **Description** |
| --- | --- |
| **CSV Datasets** | Source data files used as the raw input for the data warehouse pipeline |
| **SQL Server Express** | Lightweight relational database server for hosting and managing the data warehouse |
| **SQL Server Management Studio (SSMS)** | GUI-based tool for writing queries, managing database objects, and interacting with SQL Server |
| **Git & GitHub** | Version control and repository management for tracking changes and collaborating on code |
| **DrawIO** | Diagramming tool used to design data architecture, ERDs, and pipeline flow visuals |
| **Notion** | Project management tool used to organize phases, tasks, and documentation throughout the project |

---

## 🗂️ Project Requirements

### 🏗️ Building the Data Warehouse (Data Engineering)

**Objective**
Develop a modern data warehouse using SQL Server to consolidate sales data, enabling analytical reporting and informed decision-making.

**Specification**
| Specification | Detail |
|---|---|
| **Data Source** | Two source systems (ERP and CRM) provided as CSV files |
| **Data Quality** | Cleanse and resolve data quality issues prior to analysis |
| **Integration** | Combine both sources into a single, user-friendly data model designed for analytical queries |
| **Scope** | Focus on the latest dataset only — historization of data is not required |
| **Documentation** | Clear documentation of the data model to support both business stakeholders and analytics teams |

### 📊 BI: Analytics & Reporting (Data Analysis)

**Objective**
Develop SQL-based analytics to deliver detailed insights into:
- 👥 **Customer Behavior**: Understanding who buys, when, and how often
- 🛍️ **Product Performance**: Identifying which products drive value
- 📈 **Sales Trends**:Tracking revenue patterns over time

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---

## 📂 Repository Structure
```
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.png                         # png file shows all different techniquies and methods of ETL
│   ├── data_architecture.png           # png file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.png                   # png file for the data flow diagram
│   ├── data_integration.png            # png file for the data integration, how to tables are related
│   ├── data_layers.png                 # png file for the data layers (bronze, silver, gold), data processing and source system inteview
│   ├── data_mart.png                   # png file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
└── LICENSE                             # License information for the repository
```

---

## 📄 License

This project is licensed under the **MIT License**, feel free to use, modify, and distribute with attribution.

---

## 👤 About Me

Hi, I'm **Miftah**, a data analyst who believes that the best decisions come from structured thinking and the right information.

I'm passionate about turning raw data into clarity. For me, data analysis isn't just about numbers, it's about helping people understand *where* the problem really is, *how* to think through it, and *what* decision actually fits the situation.

If you share the same curiosity about making sense of data, feel free to connect!

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/miftah-alcharini/)
