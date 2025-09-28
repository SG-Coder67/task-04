Queries:


SELECT customer_state,
    COUNT(customer_unique_id) AS number_of_customers
FROM
    olist_customers_dataset
GROUP BY
    customer_state
ORDER BY
    number_of_customers DESC;




SELECT
    payment_type,
    SUM(payment_value) AS total_payments,
    AVG(payment_value) AS average_payment
FROM
    olist_order_payments_dataset
GROUP BY
    payment_type
ORDER BY
    total_payments DESC;



SELECT
    o.order_id,
    o.order_status,
    c.customer_city
FROM
    olist_orders_dataset AS o
INNER JOIN
    olist_customers_dataset AS c ON o.customer_id = c.customer_id;


SELECT
    order_id,
    payment_value
FROM
    olist_order_payments_dataset
WHERE
    payment_value > (SELECT AVG(payment_value) FROM olist_order_payments_dataset);



DROP VIEW IF EXISTS AllOrderDetails;

CREATE VIEW AllOrderDetails AS
SELECT
    o.order_id,
    o.order_status,
    p.payment_type,
    p.payment_value,
    c.customer_city,
    c.customer_state
FROM
    olist_orders_dataset AS o
LEFT JOIN
    olist_order_payments_dataset AS p ON o.order_id = p.order_id
LEFT JOIN
    olist_customers_dataset AS c ON o.customer_id = c.customer_id;




SELECT
    *
FROM
    AllOrderDetails
WHERE
    customer_state = 'SP' AND payment_type = 'credit_card';