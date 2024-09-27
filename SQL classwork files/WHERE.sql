-- WHERE

-- SELECT * FROM customer
-- WHERE customer_id = 1
-- or customer_id =2

-- SELECT *
-- FROM customer_purchases
-- WHERE customer_id IN (3,4,5)
-- AND vendor_id= 20

SELECT * FROM product
-- WHERE product_name like '%pepper%organic'
WHERE product_id IN (1,2)
OR product_size = 'medium'