-----the first rental date for each customer


WITH sakilaRentals AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        r.rental_date,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id 
            ORDER BY r.rental_date ASC
        ) AS row_num
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
)
SELECT 
    customer_id,
    first_name,
    last_name,
    rental_date AS first_rental_date
FROM sakilaRentals
WHERE row_num = 1;


------the highest payment per customer

WITH sakilaPayments AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        p.amount,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id 
            ORDER BY p.amount DESC
        ) AS row_num
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
)
SELECT 
    customer_id,
    first_name,
    last_name,
    amount AS highest_payment_amount
FROM sakilaPayments
WHERE row_num = 1;



