-- LEFT JOIN

SELECT DISTINCT p.product_id, product_name
FROM product as p
LEFT JOIN customer_purchases as cp
	ON p.product_id = cp.product_id
