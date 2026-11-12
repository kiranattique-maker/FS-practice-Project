---
Store Revenue Breakdown

SELECT s.store_id,SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN store s ON c.store_id = s.store_id
GROUP BY s.store_id;


----Top 5 Paying Customers

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    sub.total_payment
FROM customer c
JOIN (
    SELECT customer_id, SUM(amount) AS total_payment
    FROM payment
    GROUP BY customer_id
) sub ON c.customer_id = sub.customer_id
ORDER BY sub.total_payment DESC
LIMIT 5;

----Monthly Revenue by Store.
SELECT  c.store_id,DATE_FORMAT(p.payment_date, '%Y-%m') AS payment_month,
SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY c.store_id, DATE_FORMAT(p.payment_date, '%Y-%m')
ORDER BY c.store_id, payment_month;









