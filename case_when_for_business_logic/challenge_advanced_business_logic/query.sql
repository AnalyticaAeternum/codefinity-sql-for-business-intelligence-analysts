SELECT o.order_id,
       r.region_name,
       o.total_amount,
       CASE
            WHEN r.region_name = 'Europe' AND o.total_amount > 100 THEN 'Priority' 
            WHEN o.total_amount > 200 THEN 'High Value'
            ELSE 'Regular'
       END AS order_label
FROM orders o
JOIN regions r ON o.region_id = r.region_id;