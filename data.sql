-- Display all the data of customers:

SELECT * FROM customer;



-- Display the product_name and category for products which their price is between 5000 and 10000:

SELECT product_name, category FROM product WHERE price BETWEEN 5000 AND 10000;



-- Display all the data of products sorted in descending order of price:

SELECT * FROM product ORDER BY price DESC;



-- Display the total number of orders, the average amount, the highest total amount, and the lower total amount.
-- For each product_id, display the number of orders:

SELECT 
    COUNT(*) AS total_orders,
    AVG(total_amount) AS avg_amount,
    MAX(total_amount) AS max_amount,
    MIN(total_amount) AS min_amount,
    product_id,
    COUNT(DISTINCT order_id) AS orders_per_product
FROM 
    orders
GROUP BY 
    product_id;



-- Display the customer_id which has more than 2 orders:

SELECT 
    customer_id
FROM 
    orders
GROUP BY 
    customer_id
HAVING 
    COUNT(*) > 2;


-- For each month of the 2020 year, display the number of orders:

SELECT 
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(*) AS total_orders
FROM 
    orders
WHERE 
    EXTRACT(YEAR FROM order_date) = 2020
GROUP BY 
    EXTRACT(MONTH FROM order_date);


-- For each order, display the product_name, the customer_name, and the date of the order:

SELECT 
    o.order_id,
    p.product_name,
    c.customer_name,
    o.order_date
FROM 
    orders o
JOIN 
    product p ON o.product_id = p.product_id
JOIN 
    customer c ON o.customer_id = c.customer_id;


-- Display all the orders made three months ago:

SELECT 
    *
FROM 
    orders
WHERE 
    order_date >= ADD_MONTHS(SYSDATE, -3) AND order_date < ADD_MONTHS(SYSDATE, -2);


-- Display customers (customer_id) who have never ordered a product:

SELECT 
    c.customer_id
FROM 
    customer c
LEFT JOIN 
    orders o ON c.customer_id = o.customer_id
WHERE 
    o.order_id IS NULL;


