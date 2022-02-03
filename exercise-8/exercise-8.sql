-- rank of film category by times rented
-- include the name, count, and rank
SELECT category.name, 
RANK() OVER (ORDER BY COUNT(rental.rental_date) DESC),
COUNT(*)
FROM rental
INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id
INNER JOIN film
ON film.film_id = inventory.film_id
INNER JOIN film_category
ON film.film_id = film_category.film_id
INNER JOIN category
ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY RANK ASC