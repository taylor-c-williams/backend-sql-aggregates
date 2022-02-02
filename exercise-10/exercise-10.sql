-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE

SELECT 
EXTRACT(YEAR FROM payment_date) AS y,
EXTRACT(MONTH FROM payment_date) AS m,
EXTRACT(DAY FROM payment_date) AS d,
SUM(payment.amount), film.rating
FROM payment
INNER JOIN rental
ON rental.rental_id = payment.rental_id
INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id
INNER JOIN film 
ON inventory.film_id = film.film_id
GROUP BY CUBE(y, m, d, film.rating)
ORDER BY film.rating, y, m, d
