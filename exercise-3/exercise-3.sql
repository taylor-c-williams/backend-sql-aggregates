-- the average rental amount by country
-- include the country name and avg amount
-- use AVG to average the amount
SELECT country.country, AVG(amount) from country
INNER JOIN city 
ON country.country_id = city.country_id
INNER JOIN address
ON city.city_id = address.city_id
INNER JOIN customer
ON customer.address_id = address.address_id
INNER JOIN payment on payment.customer_id = customer.customer_id
GROUP BY country.country
ORDER BY AVG desc
LIMIT 10