SELECT

---------Data concerption

--------Dates

TO_DATE(transaction_date)AS transaction_date,
DAYOFMONTH (TO_DATE(transaction_date)) AS day_of_month,
DAYNAME (TO_DATE(transaction_date)) AS  day_name,
MONTHNAME (TO_DATE(transaction_date)) AS  month_name,

CASE
    WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
    WHEN transaction_time BETWEEN '16:00:00' AND '18:59:59' THEN 'Evening'
    ELSE 'Night'
    END AS time_bucket,

CASE 
    WHEN DAYNAME(TO_DATE(transaction_date)) NOT IN ('Sat','Sun') THEN 'Morning'
    ELSE 'Weekend'
    END AS day_type,
    
ROUND(SUM(transaction_qty * unit_price)) AS total_revenue,

-----------COUNT     

COUNT(DISTINCT transaction_id)AS number_of_sales,
COUNT(DISTINCT product_id)AS unique_products,
COUNT(DISTINCT store_id)AS unique_stores,

------Categories

store_location,
product_category,
product_detail,
product_type,

FROM BRIGHTCOFFEE_SHOP.SALES_DATA.STORES

GROUP BY ALL;



