SELECT *
FROM (
    SELECT 
        s.employee_id,
        SUM(s.amount) AS total_sales,
        RANK() OVER (ORDER BY SUM(s.amount) DESC) AS sales_rank
    FROM sales s
    GROUP BY s.employee_id
) ranked
WHERE sales_rank <= 2;