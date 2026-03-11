-- Query 1: Overall Churn Rate
SELECT
count(*) as TotalCustomers,
sum(Churn) as ChurnedCustomers,
round(sum(Churn) * 100.00 / count(*), 2) as ChurnRate
FROM customers;

-- Query 2: Churn Rate by Tenure Group 
WITH ChurnByTenure as (
SELECT
TenureGroup,
count(*) as TotalCustomers,
sum(Churn) as ChurnedCustomers
FROM customers
GROUP by TenureGroup
)

SELECT
TenureGroup,
TotalCustomers,
ChurnedCustomers,
ROUND(ChurnedCustomers * 100.0 / TotalCustomers, 2) AS ChurnRate
FROM ChurnByTenure
ORDER BY ChurnRate DESC;

--Query 3: Churn Rate by Contract Type 
WITH ChurnByContract AS (
SELECT
Contract,
count(*) as TotalCustomers,
sum(Churn) as ChurnedCustomers
FROM customers
GROUP BY Contract
)

SELECT
Contract,
TotalCustomers,
ChurnedCustomers,
ROUND(ChurnedCustomers * 100.0 / TotalCustomers, 2) AS ChurnRate
FROM ChurnByContract
ORDER BY ChurnRate DESC;

-- Query 4: Segments Ranked by Revenue Lost
SELECT
TenureGroup,
Contract,
ROUND(SUM(RevenueAtRisk), 2) AS TotalRevenueAtRisk,
RANK() OVER (ORDER BY SUM(RevenueAtRisk) DESC) AS RevenueRank
from customers
GROUP BY TenureGroup, Contract;

--Query 5: Churn Rate by Payment Method
SELECT
PaymentMethod,
count(*) as TotalCustomers,
sum(Churn) as ChurnedCustomers,
round(sum(Churn) * 100.00 / count(*), 2) as ChurnRate
FROM customers
GROUP BY PaymentMethod
ORDER BY ChurnRate  DESC;