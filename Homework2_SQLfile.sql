-- HOMEWORK 2

--1 SELECT FUNCTION

-- SELECT *
-- FROM customer

--SELECT *
-- FROM customer
-- ORDER BY customer_last_name, customer_first_name
-- LIMIT 10;

--2 WHERE FUNCTION

-- SELECT *
-- FROM customer_purchases
-- WHERE product_id IN (4,9)

-- SELECT *,(quantity*cost_to_customer_per_qty)as [price]
-- FROM customer_purchases
-- WHERE vendor_id BETWEEN 8 AND 10
-- AND vendor_id IN (8,10)

-- 3 CASE FUNCTION

-- SELECT product_id, product_name
-- ,CASE WHEN product_qty_type = 'unit'
-- THEN 'unit'
-- ELSE 'bulk'
-- END as prod_qty_type_condensed
-- ,CASE WHEN product_name like '%pepper%'
-- THEN '1'
-- ELSE '0'
-- END as pepper_flag
-- FROM product


-- 4 JOIN FUNCTION

-- SELECT *
-- FROM vendor as V
-- INNER JOIN vendor_booth_assignments as VBA
-- ON V.vendor_id = VBA.vendor_id
-- ORDER By V.vendor_name, VBA.market_date;
