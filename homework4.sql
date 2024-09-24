-- COALESCE
SELECT
product_name || ', ' || coalesce(product_size, '') || ' (' || coalesce(product_qty_type, '') || ')'

FROM product

-- Windowed functions
--1
SELECT customer_id,
       market_date,
       row_number() OVER (PARTITION BY customer_id ORDER BY market_date) AS visit_number
FROM customer_purchases;

--2
SELECT customer_id, market_date
FROM (
    SELECT customer_id,
           market_date,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY market_date DESC) AS visit_number
    FROM customer_purchases
) AS ranked_visits
WHERE visit_number = 1;

--3
SELECT 
    cp.product_id,
    cp.vendor_id,
    cp.market_date,
    cp.customer_id,
    cp.quantity,
    cp.cost_to_customer_per_qty,
    cp.transaction_time,
    pc.purchase_count
FROM 
    customer_purchases cp
JOIN (
    SELECT 
        customer_id,
        product_id,
        COUNT(*) AS purchase_count
    FROM 
        customer_purchases
    GROUP BY 
        customer_id, product_id
) pc ON cp.customer_id = pc.customer_id AND cp.product_id = pc.product_id;

---4
SELECT 
    product_name,
    TRIM(SUBSTR(product_name, INSTR(product_name, '-') + 1)) AS description
FROM 
    product
	

--- 5

WITH total_sales AS (
    SELECT 
        market_date,
        SUM(quantity * cost_to_customer_per_qty) AS total_sales
    FROM 
        customer_purchases
    GROUP BY 
        market_date
),
ranked_sales AS (
    SELECT 
        market_date,
        total_sales,
        RANK() OVER (ORDER BY total_sales DESC) AS sales_rank_desc,
        RANK() OVER (ORDER BY total_sales ASC) AS sales_rank_asc
    FROM 
        total_sales
)

SELECT 
    market_date,
    total_sales
FROM 
    ranked_sales
WHERE 
    sales_rank_desc = 1  -- Highest total sales
UNION ALL
SELECT 
    market_date,
    total_sales
FROM 
    ranked_sales
WHERE 
    sales_rank_asc = 1;  -- Lowest total sales
	

