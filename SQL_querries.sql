create database ecommerce_project;
use ecommerce_project;
CREATE TABLE ecommerce_orders (
    order_id VARCHAR(20),
    customer_id VARCHAR(20),
    platform VARCHAR(50),
    order_time VARCHAR(50),
    delivery_time_minutes INT,
    product_category VARCHAR(100),
    order_value INT,
    customer_feedback TEXT,
    service_rating INT,
    delivery_delay VARCHAR(10),
    refund_requested VARCHAR(10)
);
















SELECT * 
FROM ecommerce_orders
LIMIT 10;
SELECT *
FROM ecommerce_orders
WHERE order_id IS NULL;
SELECT order_id, COUNT(*)
FROM ecommerce_orders
GROUP BY order_id
HAVING COUNT(*) > 1;
SELECT COUNT(*) AS total_orders
FROM ecommerce_orders;
SELECT *
FROM ecommerce_orders
LIMIT 10;
SELECT COUNT(*) 
FROM ecommerce_orders;
SELECT order_id, COUNT(*)
FROM ecommerce_orders
GROUP BY order_id
HAVING COUNT(*) > 1;
SELECT SUM(order_value) AS total_revenue
FROM ecommerce_orders;
SELECT AVG(delivery_time_minutes) AS avg_delivery_time
FROM ecommerce_orders;
SELECT platform,
       COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY platform
ORDER BY total_orders DESC;
SELECT platform,
       SUM(order_value) AS revenue
FROM ecommerce_orders
GROUP BY platform
ORDER BY revenue DESC;
SELECT product_category,
       COUNT(*) AS orders,
       SUM(order_value) AS revenue
FROM ecommerce_orders
GROUP BY product_category
ORDER BY revenue DESC;
SELECT delivery_delay,
       COUNT(*) AS total_orders
FROM ecommerce_orders
GROUP BY delivery_delay;
SELECT refund_requested,
       COUNT(*) AS total_refunds
FROM ecommerce_orders
GROUP BY refund_requested;
SELECT service_rating,
       COUNT(*) AS total_customers
FROM ecommerce_orders
GROUP BY service_rating
ORDER BY service_rating;
SELECT *
FROM ecommerce_orders
WHERE service_rating <= 2;
SELECT platform,
       COUNT(*) AS refunds
FROM ecommerce_orders
WHERE refund_requested = 'Yes'
GROUP BY platform
ORDER BY refunds DESC;
SELECT product_category,
       AVG(service_rating) AS avg_rating
FROM ecommerce_orders
GROUP BY product_category
ORDER BY avg_rating DESC;
SELECT order_id,
       order_value,
       CASE
           WHEN order_value > 800 THEN 'High Value'
           WHEN order_value BETWEEN 400 AND 800 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS order_type
FROM ecommerce_orders;
SELECT platform,
       SUM(order_value) AS revenue,
       RANK() OVER(ORDER BY SUM(order_value) DESC) AS ranking
FROM ecommerce_orders
GROUP BY platform;
WITH revenue_data AS
(
SELECT platform,
       SUM(order_value) AS revenue
FROM ecommerce_orders
GROUP BY platform
)

SELECT *
FROM revenue_data
WHERE revenue > 1000000;
