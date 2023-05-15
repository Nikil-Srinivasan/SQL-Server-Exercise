create database SalesManagement

use SalesManagement

CREATE TABLE tbl_orders (
    order_number INT PRIMARY KEY,
    order_date DATE,
    purchase_amount DECIMAL(10,2),
    salesman_id INT
);

INSERT INTO tbl_orders
VALUES (1, '2012-05-10', 500.00, 5001);

INSERT INTO tbl_orders
VALUES (2, '2012-06-15', 750.00, 5002);

INSERT INTO tbl_orders
VALUES (3, '2012-07-20', 1000.00, 5001);

INSERT INTO tbl_orders
VALUES (4, '2012-08-25', 250.00, 5003);

INSERT INTO tbl_orders
VALUES (5, '2012-09-30', 1200.00, 5001);

INSERT INTO tbl_orders
VALUES (6, '2012-10-30', 100.00, 5003);

SELECT order_number, order_date, purchase_amount
FROM tbl_orders
WHERE salesman_id = 5001

CREATE TABLE tbl_customer (
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    grade INT
);

INSERT INTO tbl_customer
VALUES (1, 'John Smith', 'New York', 90);

INSERT INTO tbl_customer
VALUES (2, 'Jane Doe', 'Los Angeles', 110);

INSERT INTO tbl_customer
VALUES (3, 'Michael Johnson', 'Chicago', 95);

INSERT INTO tbl_customer
VALUES (4, 'Emily Williams', 'New York', 120);

INSERT INTO tbl_customer
VALUES (5, 'David Brown', 'Houston', 105);

SELECT *
FROM tbl_customer
WHERE grade > 100

SELECT *
FROM tbl_customer
WHERE city='New York' AND grade > 100

SELECT *
FROM tbl_customer
WHERE city='New York' OR grade > 100

SELECT *
FROM tbl_customer
WHERE city='New York' OR NOT grade > 100

SELECT *
FROM tbl_orders
WHERE purchase_amount < 200 OR NOT order_date >= '2012-02-10'

CREATE TABLE tbl_emp_details (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
)

INSERT INTO tbl_emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
VALUES
    (127323, 'Michale', 'Robbin', 57),
    (526689, 'Carlos', 'Snares', 63),
    (843795, 'Enric', 'Dosio', 57),
    (328717, 'Jhon', 'Snares', 63),
    (444527, 'Joseph', 'Dosni', 47),
    (659831, 'Zanifer', 'Emily', 47),
    (847674, 'Kuleswar', 'Sitaraman', 57),
    (748681, 'Henrey', 'Gabriel', 47),
    (555935, 'Alex', 'Manuel', 57),
    (539569, 'George', 'Mardy', 27),
    (733843, 'Mario', 'Saule', 63),
    (631548, 'Alan', 'Snappy', 27),
    (839139, 'Maria', 'Foster', 57)

SELECT *
FROM tbl_emp_details
WHERE EMP_DEPT = 47 OR EMP_DEPT = 63

SELECT *
FROM tbl_emp_details
WHERE EMP_LNAME = 'Dosni' OR EMP_LNAME = 'Mardy'
