-- AGGREGATE

-- Answer1
SELECT vendor_id, COUNT(*) AS booth_count
FROM vendor_booth_assignments
GROUP BY vendor_id;

-- Answer2

SELECT c.customer_first_name, c.customer_last_name, SUM(cp.cost_to_customer_per_qty) AS total_spent
FROM customer AS c
JOIN customer_purchases AS cp ON c.customer_id = cp.customer_id
GROUP BY c.customer_id
HAVING total_spent > 2000
ORDER BY c.customer_last_name, c.customer_first_name;


-- TEMP TABLE
DROP TABLE if EXISTS new_vendor;
CREATE temp TABLE new_vendor AS
Select * FROM vendor;

INSERT INTO new_vendor(vendor_id, vendor_name, vendor_type, vendor_owner_first_name, vendor_owner_last_name)
VALUES(10, 'Thomass Superfood Store', 'Fresh Focused', 'Thomas', 'Rosenthal')

SELECT * FROM new_vendor

-- DATE 
SELECT customer_id,
sum(quantity*cost_to_customer_per_qty) AS total_customer_expense
FROM customer_purchases
WHERE
strftime('%m', market_date) = '04'
AND
strftime('%Y', market_date) = '2022'
GROUP by customer_id