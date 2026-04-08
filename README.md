# indian-startup-investment-analysis
SQL + Power BI project analyzing Indian startup funding trends

**Overview:**

This project analyzes Indian startup funding trends (2020–2025) using MySQL for data analysis and Power BI for visualization.
It focuses on uncovering insights related to investment patterns, top industries, and regional performance.

**Objectives:**
1. Analyze funding trends over time
2. Identify top cities and industries
3. Understand investment distribution
4. Highlight top-funded startups

**Dataset:**

1. Source: Kaggle – Indian Startup Funding Dataset (2020–2025)
2. Records: ~1000+ funding rounds
3. Fields include:
    i. Startup
    ii. Industry
    iii. City
    iv. Investment Type
    v. Funding Amount

**Tools Used:**
1. MySQL – Data cleaning & analysis
2. Power BI – Dashboard & visualization
3. Power Query & DAX – Data transformation & KPIs

**Data Cleaning (SQL)**

Key preprocessing steps performed in MySQL:
1. Converted date column to proper DATE format
2. Cleaned inconsistent city names (e.g., Bangalore → Bengaluru)
3. Handled missing/null values in funding amount
4. Standardized industry and categorical fields
5. Removed/handled multi-value inconsistencies

**SQL Analysis (Highlights)**

1. Top Industry every Year --

WITH ranked AS (
	SELECT 
        YEAR(Date) AS year,
        Industry, (SUM(InvestmentAmount_USD))/1000000 AS Total_Investment_Mn,
        RANK() OVER (PARTITION BY YEAR(Date) ORDER BY (SUM(InvestmentAmount_USD))/1000000 DESC) AS rnk
    FROM indian_startup_funding_2020_2025
    GROUP BY 1, 2
)
SELECT * FROM ranked
WHERE rnk = 1;

2. total investment (in millions) by year --

SELECT YEAR(Date) AS Year,
    (ROUND(SUM(InvestmentAmount_USD), 2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 1;

3. Top 10 cities by investment amount --

SELECT City,
    (ROUND(SUM(InvestmentAmount_USD),2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

Full queries are available in the attached SQL files.

**Dashboard:**

An interactive Power BI dashboard was built to visualize:
1. Investment trend (2020–2025)
2. Top cities by investment
3. Top industries
4. Investment type distribution
5. Top startups

**Key Insights:**
1. Delhi NCR leads startup funding, followed by Pune and Kolkata
2. FoodTech is the most funded industry (~$3.5bn)
3. Funding peaks observed in 2021 and 2024
4. Majority of investments are early-stage (Seed & Series A)
5. A small number of startups account for a large share of total funding

**Project Structure:**

indian-startup-investment-analysis

│

├── indian_startup_funding_2020_2025_dataset/

├── sql/

│   └── dataset_cleaning_SQL_queries.sql

|   └── exploratory_analysis_SQL_queries.sql

├── dashboard/

│   └── indian_startup_funding.pbix

|   └── dashboard.png

└── README.md

**Dashboard Preview:**

<img width="1288" height="717" alt="image" src="https://github.com/user-attachments/assets/6b49ab9f-5bc9-42e2-ada6-31a43afc1600" />

**Key Learnings:**

1. Handling real-world messy data (missing values, inconsistent formats)
2. Writing SQL queries for business analysis
3. Designing clean, insight-driven dashboards
4. Applying data storytelling principles



