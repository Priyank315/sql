-- CROSS JOIN

DROP TABLE if EXISTS temp.sizes;
CREATE TEMP TABLE IF NOT EXISTS temp.sizes(size TEXT);

INSERT INTO temp.sizes
VALUES('small'),
('medium'),
('large');

SELECT * from temp.sizes;

SELECT product_name, size
FROM product
CROSS JOIN temp.sizes
