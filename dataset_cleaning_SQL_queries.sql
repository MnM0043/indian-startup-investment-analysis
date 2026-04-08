SELECT * FROM indian_startup_funding_2020_2025
LIMIT 20;

-- checking the total no. of rows in the table
SELECT COUNT(*) FROM indian_startup_funding_2020_2025;           

-- finding the total no. of NULL values present in the amount column
SELECT COUNT(*) FROM indian_startup_funding_2020_2025
WHERE InvestmentAmount_USD IS NULL;

-- converting the blank and 0 values to NULL
UPDATE indian_startup_funding_2020_2025
SET InvestmentAmount_USD = NULL
WHERE InvestmentAmount_USD = ' ' OR InvestmentAmount_USD = '0';

-- Ensure that the amount is in decimal data type
ALTER TABLE indian_startup_funding_2020_2025
MODIFY InvestmentAmount_USD double;

-- clean the investment amount column
UPDATE indian_startup_funding_2020_2025
SET InvestmentAmount_USD = ROUND(InvestmentAmount_USD, 0);

-- converting the date into correct format
UPDATE indian_startup_funding_2020_2025
SET Date = 
CASE 
    WHEN Date LIKE '%-%' THEN STR_TO_DATE(Date, '%Y-%m-%d')
    WHEN Date LIKE '%/%' THEN STR_TO_DATE(Date, '%d/%m/%Y')
    ELSE NULL
END;

-- creating a temp. column for clean date
ALTER TABLE indian_startup_funding_2020_2025
ADD COLUMN clean_date DATE;

-- populating the new date column
UPDATE indian_startup_funding_2020_2025
SET clean_date = DATE(Date);

-- replacing the old Date column with clean date
ALTER TABLE indian_startup_funding_2020_2025 
DROP COLUMN Date;

-- changing the column name back to Date
ALTER TABLE indian_startup_funding_2020_2025
CHANGE clean_date Date DATE;

-- cleaning city names
UPDATE indian_startup_funding_2020_2025
SET City = 'Bengaluru'
WHERE City IN ('Bangalore', 'bangalore');

UPDATE indian_startup_funding_2020_2025
SET City = 'Delhi NCR'
WHERE City IN ('Delhi', 'New Delhi', 'Gurgaon', 'Gurugram', 'Noida', 'Greater Noida', 'Ghaziabad', 'Faridabad');

-- cleaning industry names
UPDATE indian_startup_funding_2020_2025
SET Industry = TRIM(Industry);

-- cleaning startup names
UPDATE indian_startup_funding_2020_2025
SET Startup = TRIM(Startup);

UPDATE indian_startup_funding_2020_2025
SET SubVertical = TRIM(SubVertical);





















