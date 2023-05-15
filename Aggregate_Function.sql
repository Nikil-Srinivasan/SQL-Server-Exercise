create database Office

use Office

CREATE TABLE tbl_orders (
  order_id INT PRIMARY KEY,
  purchase_amount DECIMAL(10,2),
  salesman_id INT,
  customer_id INT FOREIGN KEY REFERENCES tbl_customer(customer_id),
  order_date DATE
)

--drop table tbl_orders

INSERT INTO tbl_orders
VALUES (1, 100.00, 123, 456, '2023-05-15');

INSERT INTO tbl_orders
VALUES (2, 200.00, 234, 567, '2023-05-16');

INSERT INTO tbl_orders
VALUES (3, 300.00, 345, 678, '2023-05-17');

INSERT INTO tbl_orders
VALUES (5, 500.00, 567, 890, '2023-05-19');

INSERT INTO tbl_orders
VALUES (6, 1200.00, 678, 901, '2023-05-19');

SELECT 
	SUM(purchase_amount) total_purchase
FROM 
	tbl_orders

SELECT
	AVG(purchase_amount) average_purchase
FROM
	tbl_orders

SELECT salesman_id, COUNT(DISTINCT customer_id) AS customer_count
FROM tbl_orders
GROUP BY salesman_id;

CREATE TABLE tbl_customer (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  city VARCHAR(50),
  grade VARCHAR(10)
)

--drop table tbl_customer

INSERT INTO tbl_customer 
VALUES (456, 'John Wick', 'Tamil Nadu', 'A');

INSERT INTO tbl_customer 
VALUES (678, 'Nikil', 'Los Angeles', 'B');

INSERT INTO tbl_customer 
VALUES (567, 'Michael Jackson', 'Coimbatore', 'A');

INSERT INTO tbl_customer 
VALUES (890, null, 'Pondy', 'C');

INSERT INTO tbl_customer 
VALUES (901, null, 'Madurai', 'B');

SELECT COUNT (customer_name) customer_count
FROM tbl_customer
WHERE customer_name IS NOT NULL

SELECT COUNT (grade) customer_grade
FROM tbl_customer
WHERE grade IS NOT NULL

SELECT MAX (purchase_amount) max_purchase
FROM tbl_orders

SELECT MIN (purchase_amount) max_purchase
FROM tbl_orders

SELECT city, MAX(grade) AS highest_grade
FROM tbl_customer
GROUP BY city

SELECT customer_id, MAX(purchase_amount) AS highest_purchase_amount
FROM tbl_orders
GROUP BY customer_id