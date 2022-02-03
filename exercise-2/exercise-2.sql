SELECT city, SUM(amount)
FROM city
INNER JOIN address
ON address.city_id = city.city_id
INNER JOIN customer
ON customer.address_id = address.address_id
INNER JOIN rental
ON rental.customer_id = customer.customer_id
INNER JOIN payment
ON payment.rental_id = rental.rental_id
GROUP BY city.city
ORDER BY sum desc
LIMIT 10
