-- CROSS JOIN 
WITH customer_count AS (
    SELECT COUNT(DISTINCT customer_id) AS num_customers
    FROM customer
),
vendor_products AS (
    SELECT v.vendor_name, p.product_name, vi.original_price
    FROM vendor_inventory vi
    JOIN vendor v ON vi.vendor_id = v.vendor_id
    JOIN product p ON vi.product_id = p.product_id
)
SELECT vp.vendor_name, 
       vp.product_name, 
       (5 * vp.original_price * cc.num_customers) AS total_revenue
FROM vendor_products vp
CROSS JOIN customer_count cc;

-- INSERT 
-- Create the product_units table with a snapshot_timestamp
CREATE TABLE product_units AS
SELECT *, CURRENT_TIMESTAMP AS snapshot_timestamp
FROM product
WHERE product_qty_type = 'unit';

-- Insert a new row for a product with an updated timestamp
INSERT INTO product_units (product_id, product_name, product_size, product_category_id, product_qty_type, snapshot_timestamp)
VALUES (101, 'Apple Pie', 'Medium', 1, 'unit', CURRENT_TIMESTAMP);

-- DELETE 
DELETE FROM product_units
WHERE product_id = 101
AND snapshot_timestamp < (SELECT MAX(snapshot_timestamp) FROM product_units WHERE product_id = 101);

--UPDATE 
-- Add the new column current_quantity
ALTER TABLE product_units
ADD current_quantity INT;

-- Update the current_quantity using the most recent vendor inventory details
UPDATE product_units
SET current_quantity = COALESCE((SELECT vi.quantity
                                 FROM vendor_inventory vi
                                 WHERE vi.product_id = product_units.product_id
                                 ORDER BY vi.market_date DESC LIMIT 1), 0)
WHERE product_id IN (SELECT product_id FROM product_units);

