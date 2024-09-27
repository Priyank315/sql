--DISTINCT

-- SELECT DISTINCT booth_type from booth

-- SELECT DISTINCT booth_price_level, booth_type
-- FROM booth

-- which vendor has sold products to a customer and which product was it?

SELECT DISTINCT vendor_id, product_id, customer_id
FROM customer_purchases