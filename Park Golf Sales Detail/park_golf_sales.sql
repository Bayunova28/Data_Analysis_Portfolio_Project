-- Load park golf sales dataset
SELECT 
  * 
FROM 
  practice..park_golf_sales 
  
-- Looking total sales price based on sale date
SELECT 
  SaleDate, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
GROUP BY 
  SaleDate 
ORDER BY 
  SaleDate ASC 
  
-- Looking total actual price based on sale date
SELECT 
  SaleDate, 
  SUM(ActualPrice * 1000) AS TotalActualPrice 
FROM 
  practice..park_golf_sales 
GROUP BY 
  SaleDate 
ORDER BY 
  SaleDate ASC 
  
-- Looking total sales price based on course name
SELECT 
  CourseName, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
GROUP BY 
  CourseName 
ORDER BY 
  CourseName ASC 
  
-- Looking total actual price based on course name
SELECT 
  CourseName, 
  SUM(ActualPrice * 1000) AS TotalActualPrice 
FROM 
  practice..park_golf_sales 
GROUP BY 
  CourseName 
ORDER BY 
  CourseName ASC 
  
-- Looking total sales price based on LMP
SELECT 
  LMPField, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
GROUP BY 
  LMPField 
  
-- Looking total actual price vs total sales price based on course name and LMP
SELECT 
  CourseName, 
  LMPField, 
  SUM(ActualPrice * 1000) AS TotalActualPrice, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
GROUP BY 
  CourseName, 
  LMPField 
  
-- Looking total sales price vs total actual price less than 100 based on course name and LMP on food
SELECT 
  CourseName, 
  LMPField, 
  ActualPrice, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
WHERE 
  ActualPrice <= 100 
  AND LMPField = 'Food' 
GROUP BY 
  CourseName, 
  ActualPrice, 
  LMPField 
  
-- Looking total sales price vs total actual price based on course name and LMP on hole rentals
SELECT 
  CourseName, 
  LMPField, 
  ActualPrice, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
WHERE 
  LMPField = '18HoleRentals' 
GROUP BY 
  CourseName, 
  ActualPrice, 
  LMPField 
  
-- Looking total actual price vs total sales price based on course name, LMP and item description on senior green fee
SELECT 
  CourseName, 
  LMPField, 
  ItemDescription, 
  SUM(ActualPrice * 1000) AS totalActualPrice, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
WHERE 
  ItemDescription = 'Senior Green Fee' 
GROUP BY 
  CourseName, 
  LMPField, 
  ItemDescription 
ORDER BY 
  CourseName ASC 
  
-- Looking total actual price vs total sales price based on course name, LMP and item description start with golf
SELECT 
  CourseName, 
  LMPField, 
  ItemDescription, 
  SUM(ActualPrice * 1000) AS totalActualPrice, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
WHERE 
  ItemDescription LIKE 'Golf%' 
GROUP BY 
  CourseName, 
  LMPField, 
  ItemDescription 
ORDER BY 
  CourseName ASC 
  
-- Looking sales price which has more than equals to 10000 based on course name, item description and LMP
SELECT 
  CourseName, 
  ItemDescription, 
  LMPField, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
GROUP BY 
  CourseName, 
  ItemDescription, 
  LMPField 
HAVING 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) >= 10000 
ORDER BY 
  CourseName ASC 
  
-- Looking sales price description based on course name, item description and LMP
SELECT 
  CourseName, 
  ItemDescription, 
  LMPField, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice, 
  CASE WHEN SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) > 500000 THEN 'Very Expensive' WHEN SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) = 500000 THEN 'Intermediate' ELSE 'Cheaper' END AS sales_price_description 
FROM 
  practice..park_golf_sales 
GROUP BY 
  CourseName, 
  ItemDescription, 
  LMPField 
ORDER BY 
  CourseName ASC 
  
-- Looking sales price based on course name, item description and LMP on golf pass, golf special, foot golf WD and WE
SELECT 
  CourseName, 
  ItemDescription, 
  LMPField, 
  SUM(
    (
      (ActualPrice * Quantity) - SalesTax
    ) * 1000
  ) AS SalesPrice 
FROM 
  practice..park_golf_sales 
WHERE 
  LMPField IN (
    'GolfPass', 'GolfSpecial', 'FootGolfWD', 
    'FootGolfWE'
  ) 
GROUP BY 
  CourseName, 
  ItemDescription, 
  LMPField 
ORDER BY 
  CourseName ASC
