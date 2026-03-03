-- Count of completed orders (status 'Delivered')
SELECT COUNT(CASE WHEN os.status_name = 'Delivered' THEN 1 END) AS completed_orders
FROM orders o
JOIN order_statuses os ON o.status_id = os.status_id;

-- Sum of high-value sales (orders with total_amount > 500)
SELECT SUM(CASE WHEN o.total_amount > 500 THEN o.total_amount ELSE 0 END) AS high_value_sales
FROM orders o;