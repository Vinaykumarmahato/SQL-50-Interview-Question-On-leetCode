# Write your MySQL query statement below
WITH MonthlyTransactions AS (
    SELECT
        DATE_FORMAT(trans_date, '%Y-%m') AS month,
        country,
        COUNT(*) AS trans_count,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(amount) AS trans_total_amount,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
    FROM Transactions
    GROUP BY month, country
)

SELECT
    month,
    country,
    trans_count,
    approved_count,
    trans_total_amount,
    approved_total_amount
FROM MonthlyTransactions
ORDER BY month, country;
