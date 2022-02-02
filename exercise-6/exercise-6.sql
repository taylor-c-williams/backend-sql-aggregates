-- customer ranking by total amount spent
-- include email and rank
-- use RANK ORDER BY the SUM of the amount in descending order
SELECT customer.email, RANK() OVER (ORDER BY SUM(payment.amount)DESC)
 FROM customer
INNER JOIN rental
ON rental.customer_id = customer.customer_id
INNER JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY customer.email
ORDER BY RANK ASC
                                   