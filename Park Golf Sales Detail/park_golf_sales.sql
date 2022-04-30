-- Load park golf sales dataset
SELECT * FROM practice..park_golf_sales

-- Looking total sales price based on sale date
SELECT SaleDate, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
GROUP BY SaleDate
ORDER BY SaleDate

-- Looking total actual price based on sale date
SELECT SaleDate, SUM(ActualPrice * 1000) AS TotalActualPrice
FROM practice..park_golf_sales
GROUP BY SaleDate
ORDER BY SaleDate

-- Looking total sales price based on course name
SELECT CourseName, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
GROUP BY CourseName
ORDER BY CourseName

-- Looking total actual price based on course name
SELECT CourseName, SUM(ActualPrice * 1000) AS TotalActualPrice
FROM practice..park_golf_sales
GROUP BY CourseName
ORDER BY CourseName

-- Looking total sales price based on LMP
SELECT LMPField, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
GROUP BY LMPField

-- Looking total actual price vs total sales price based on course name and LMP
SELECT CourseName, LMPField, SUM(ActualPrice * 1000) AS TotalActualPrice, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
GROUP BY CourseName, LMPField

-- Looking total sales price vs total actual price less than 100 based on course name and LMP on food
SELECT CourseName, LMPField, ActualPrice, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
WHERE ActualPrice <= 100 AND LMPField = 'Food'
GROUP BY CourseName, ActualPrice, LMPField

-- Looking total sales price vs total actual price based on course name and LMP on hole rentals
SELECT CourseName, LMPField, ActualPrice, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
WHERE LMPField = '18HoleRentals'
GROUP BY CourseName, ActualPrice, LMPField

-- Looking total actual price vs total sales price based on course name, LMP and item description on senior green fee
SELECT CourseName, LMPField, ItemDescription, SUM(ActualPrice * 1000) AS totalActualPrice, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
WHERE ItemDescription = 'Senior Green Fee'
GROUP BY CourseName, LMPField, ItemDescription
ORDER BY CourseName

-- Looking total actual price vs total sales price based on course name, LMP and item description start with golf
SELECT CourseName, LMPField, ItemDescription, SUM(ActualPrice * 1000) AS totalActualPrice, SUM(((ActualPrice * Quantity) - SalesTax) * 1000) AS SalesPrice
FROM practice..park_golf_sales
WHERE ItemDescription LIKE 'Golf%'
GROUP BY CourseName, LMPField, ItemDescription
ORDER BY CourseName

