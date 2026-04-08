-- total funding in millions
SELECT (ROUND(SUM(InvestmentAmount_USD),2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025;

-- total funding (in millions) by year 
SELECT YEAR(Date) AS Year,
    (ROUND(SUM(InvestmentAmount_USD), 2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 1;

-- Top 10 cities by investment amount
SELECT City,
    (ROUND(SUM(InvestmentAmount_USD),2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Top Industries by Investment Amount
SELECT Industry,
    (ROUND(SUM(InvestmentAmount_USD),2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Top Industry SubVerticals by Investment Amount
SELECT SubVertical,
    (ROUND(SUM(InvestmentAmount_USD),2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Top Startups by Investment Amount
SELECT Startup,
    (ROUND(SUM(InvestmentAmount_USD),2)/1000000) AS total_funding_Mn
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- Investment Type Distribution
SELECT InvestmentType, COUNT(*) AS total_rounds
FROM indian_startup_funding_2020_2025
GROUP BY 1
ORDER BY 2 DESC;

-- Top Industry every Year
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









