-- Track loan book performance

-- alter table prosperloandata
-- modify LoanOriginationDate date;

SELECT 
-- LoanOriginationDate,
date_format(LoanOriginationDate, '%Y-%m-01 00:00:00') as month,
date_format(LoanOriginationDate, '%Y') as year,
sum(LoanOriginalAmount) as total_dis,
round(sum(LP_CustomerPayments), 0) as total_paid,
round(avg(EstimatedReturn), 2) as profit,
round(avg(EstimatedLoss), 2) as lossrate,
round(avg(DebtToIncomeRatio), 2) as debtincome,
round(avg(BorrowerAPR), 3) as APR, 
EmploymentStatus
FROM prosperloandata
WHERE LoanOriginationDate > '2009-12-31'
GROUP BY month, year, EmploymentStatus
ORDER BY month;

-- get information about:
-- employment status and APR
-- income range and APR
-- total number of loan per employment status
SELECT 
round(avg(BorrowerAPR), 3) as APR, 
EmploymentStatus
FROM prosperloandata
WHERE LoanOriginationDate > '2009-12-31'
GROUP BY EmploymentStatus
;

SELECT 
round(avg(BorrowerAPR), 3) as APR, 
IncomeRange
FROM prosperloandata
WHERE LoanOriginationDate > '2009-12-31'
GROUP BY IncomeRange
;

SELECT  
LoanStatus,
EmploymentStatus,
count(*)
FROM prosperloandata
WHERE LoanOriginationDate > '2009-12-31'
GROUP BY LoanStatus, EmploymentStatus
ORDER BY LoanStatus
;

SELECT  
EmploymentStatus,
count(*)
FROM prosperloandata
WHERE LoanOriginationDate > '2009-12-31'
GROUP BY EmploymentStatus
;
