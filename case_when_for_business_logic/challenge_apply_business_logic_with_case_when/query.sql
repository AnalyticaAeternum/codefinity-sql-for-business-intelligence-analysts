-- 1. Label each order as 'High' if total_amount >= 500, otherwise 'Standard'
SELECT
    order_id,
    order_date,
    total_amount,
    CASE
        WHEN total_amount >= 500 THEN 'High'
        ELSE 'Standard'
    END AS order_priority
FROM orders;

-- 2. Categorize each product as 'Tech' if it belongs to the 'Electronics' category, otherwise 'Other'
SELECT
    product_id,
    product_name,
    price,
    CASE
        WHEN pc.category_name = 'Electronics' THEN 'Tech'
        ELSE 'Other'
    END AS product_type
FROM products p
JOIN product_categories pc
    ON p.category_id = pc.category_id;