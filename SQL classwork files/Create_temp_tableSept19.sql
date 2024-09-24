DROP VIEW IF EXISTS vendor_daily_sales;
CREATE VIEW IF NOT EXISTS vendor_daily_sales AS
	
	SELECT 
	md.market_date
	,market_day
	,market_week
	,market_year
	,vendor_name
	,SUM(quantity*cost_to_customer_per_qty) as sales
	
	FROM customer_purchases cp
	JOIN market_date_info md 
		ON cp.market_date = md.market_date
	JOIN vendor v
		ON cp.vendor_id = v.vendor_id
		
	GROUP BY cp.market_date, v.vendor_id