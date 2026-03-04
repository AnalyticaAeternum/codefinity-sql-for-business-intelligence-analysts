SELECT ep.employee_id, 
    d.date AS review_date, 
    ep.sales_achieved,
  LAG(ep.sales_achieved) OVER (PARTITION BY ep.employee_id ORDER BY d.date) AS previous_sales_achieved,
  PERCENT_RANK() OVER (PARTITION BY d.date ORDER BY ep.sales_achieved) AS percentile
FROM employee_performance ep
  JOIN employees e ON ep.employee_id = e.employee_id
  JOIN dates d ON ep.review_date_id = d.date_id
WHERE e.department = 'Sales'
ORDER BY ep.employee_id, d.date;