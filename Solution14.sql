# Write your MySQL query statement below
SELECT
    s.user_id,
    IFNULL(
        ROUND(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id),
            2
        ),
        0.00
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;
