--- assment 17

---- Create the View

CREATE OR REPLACE VIEW Random_Film_Rentals AS
SELECT 
    f.title AS film_title,
    r.rental_date,
    c.first_name || ' ' || c.last_name AS customer_name
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY RANDOM();



----Query the View

SELECT * 
FROM Random_Film_Rentals 
LIMIT 5;


--- Use a CTE to Display Random Actor Filmography


WITH Random_Actors AS (
    SELECT actor_id, first_name, last_name
    FROM actor
    ORDER BY RANDOM()
    LIMIT 5
)
SELECT 
    ra.first_name,
    ra.last_name,
    f.title AS film_title
FROM Random_Actors ra
JOIN film_actor fa ON ra.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;










