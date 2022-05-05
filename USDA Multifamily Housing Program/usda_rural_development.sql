-- Load USDA rural development dataset
SELECT 
  * 
FROM 
  practice..usda_rural 
  
-- Looking average claim amount based on borrower type and tax credit indicator
SELECT 
  Borrower_Type, 
  Tax_Credit_Indicator, 
  ROUND(
    AVG(Loan_Amt - Interest_Rate), 
    0
  ) AS Average_Claim_Amt 
FROM 
  practice..usda_rural 
GROUP BY 
  Borrower_Type, 
  Tax_Credit_Indicator 
ORDER BY 
  Borrower_Type ASC 
  
-- Looking average loan amount based on state
SELECT 
  State, 
  ROUND(
    AVG(Loan_Amt), 
    0
  ) AS Average_Loan_Amt 
FROM 
  practice..usda_rural 
GROUP BY 
  State 
ORDER BY 
  State ASC 
  
-- Looking average loan amount based on borrower type and borrower profit type
SELECT 
  Borrower_Type, 
  Borrower_Profit_Type, 
  ROUND(
    AVG(Loan_Amt), 
    0
  ) AS Average_Loan_Amt 
FROM 
  practice..usda_rural 
GROUP BY 
  Borrower_Type, 
  Borrower_Profit_Type 
ORDER BY 
  Borrower_Type ASC 
  
-- Looking average loan amount based on date of operation
SELECT 
  Date_of_Operation, 
  ROUND(
    AVG(Loan_Amt), 
    0
  ) AS Average_Loan_Amt 
FROM 
  practice..usda_rural 
GROUP BY 
  Date_of_Operation 
ORDER BY 
  Date_of_Operation ASC 
  
-- Delete specific rental type value
DELETE FROM 
  practice..usda_rural 
WHERE 
  Rental_Type = '??' 
  
-- Looking average claim amount based on rental type
SELECT 
  Rental_Type, 
  ROUND(
    AVG(Loan_Amt - Interest_Rate), 
    0
  ) AS Average_Claim_Amt 
FROM 
  practice..usda_rural 
GROUP BY 
  Rental_Type 
ORDER BY 
  Rental_Type ASC 
  
-- Looking average claim amount based on rental type and borrower profit type
SELECT 
  Rental_Type, 
  Borrower_Profit_Type, 
  ROUND(
    AVG(Loan_Amt - Interest_Rate), 
    0
  ) AS Average_Claim_Amt 
FROM 
  practice..usda_rural 
GROUP BY 
  Rental_Type, 
  Borrower_Profit_Type 
  
-- Looking average claim amount which has more than equals to 500000 based on borrower name, borrower address and borrower type
SELECT 
  Borrower_Name, 
  Borrower_Address, 
  Borrower_Type, 
  ROUND(
    AVG(Loan_Amt - Interest_Rate), 
    0
  ) AS Average_Claim_Amt 
FROM 
  practice..usda_rural 
GROUP BY 
  Borrower_Name, 
  Borrower_Address, 
  Borrower_Type 
HAVING 
  ROUND(
    AVG(Loan_Amt - Interest_Rate), 
    0
  ) >= 500000 
ORDER BY 
  Borrower_Name ASC 
  
-- Looking loan amount description based on borrower name, borrower address and borrower type
SELECT 
  Borrower_Name, 
  Borrower_Address, 
  Borrower_Type, 
  ROUND(
    AVG(Loan_Amt), 
    0
  ) AS Average_Loan_Amt, 
  CASE WHEN ROUND(
    AVG(Loan_Amt), 
    0
  ) > 500000 THEN 'Big Loan' WHEN ROUND(
    AVG(Loan_Amt), 
    0
  ) = 500000 THEN 'Mediuam Loan' ELSE 'Small Loan' END AS loan_amount_description 
FROM 
  practice..usda_rural 
GROUP BY 
  Borrower_Name, 
  Borrower_Address, 
  Borrower_Type 
ORDER BY 
  Borrower_Name ASC 
  
-- Looking average loan amount based on borrower name, borrower address and borrower type on individual, ineligible and public body
SELECT 
  Borrower_Name, 
  Borrower_Address, 
  Borrower_Type, 
  ROUND(
    AVG(Loan_Amt), 
    0
  ) AS Average_Loan_Amt 
FROM 
  practice..usda_rural 
WHERE 
  Borrower_Type IN (
    'INDIVIDUAL', 'INELIGIBLE', 'PUBLIC BODY'
  ) 
GROUP BY 
  Borrower_Name, 
  Borrower_Address, 
  Borrower_Type 
ORDER BY 
  Borrower_Name ASC
