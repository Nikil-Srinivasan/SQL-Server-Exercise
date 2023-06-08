use Office

-- Creating the table
CREATE TABLE tbl_employee (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(20),
  hire_date DATE,
  salary DECIMAL(10, 2),
  department_id INT
)

-- Inserting sample values
INSERT INTO tbl_employee (employee_id, first_name, last_name, phone_number, hire_date, salary, department_id)
VALUES
  (1, 'John', 'Doe', '1234567890', '2020-01-01', 50000.00, 1),
  (2, 'Jane', 'Smith', '9876543210', '2019-06-15', 60000.00, 1),
  (3, 'David', 'Johnson', '5555555555', '2021-03-10', 55000.00, 2),
  (4, 'Emily', 'Wilson', '4444444444', '2022-02-20', 52000.00, 2),
  (5, 'Michael', 'Brown', '7777777777', '2020-11-05', 58000.00, 1)

-- Creating the order table
CREATE TABLE tbl_order (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2)
)

-- Inserting sample values into the order table
INSERT INTO tbl_order (order_id, customer_id, order_date, total_amount)
VALUES
  (1, 1, '2023-01-05', 100.00),
  (2, 2, '2023-02-10', 250.00),
  (3, 1, '2023-03-15', 150.00),
  (4, 3, '2023-04-20', 350.00),
  (5, 2, '2023-05-25', 200.00)

-- Creating the customer table
CREATE TABLE tbl_customer (
  customer_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  phone_number VARCHAR(20)
)

-- Inserting sample values into the customer table
INSERT INTO tbl_customer (customer_id, first_name, last_name, email, phone_number)
VALUES
  (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
  (2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210'),
  (3, 'David', 'Johnson', 'david.johnson@example.com', '555-555-5555'),
  (4, 'Emily', 'Wilson', 'emily.wilson@example.com', '444-444-4444'),
  (5, 'Michael', 'Brown', 'michael.brown@example.com', '777-777-7777')

-- Create a Store Procedure without parameter read the data from the tables such as orders,customer and employee separately

CREATE PROCEDURE sp_read_office
AS
SELECT * FROM tbl_employee
SELECT * FROM tbl_customer
SELECT * FROM tbl_order

EXEC sp_read_office

-- Create a Store Procedure with parameter read the data from the tables such as employee,customer and order separately

CREATE PROCEDURE sp_read_office_with_parameter
  @department_id INT,
  @customer_id INT,
  @order_id INT
AS
  -- Retrieve data from tbl_employee based on department_id parameter
  SELECT * FROM tbl_employee WHERE department_id = @department_id;

  -- Retrieve data from tbl_customer based on customer_id parameter
  SELECT * FROM tbl_customer WHERE customer_id = @customer_id;

  -- Retrieve data from tbl_order based on order_id parameter
  SELECT * FROM tbl_order WHERE order_id = @order_id;

EXEC sp_read_office_with_parameter @department_id = 1, @customer_id = 2, @order_id = 1;

--Stored Procedure with parameters and joins 
CREATE PROCEDURE sp_read_order
@customer_id INT,
@order_id INT,
@employee_id INT
AS
SELECT c.first_name, c.last_name, c.phone_number, o.order_date, o.total_amount, e.hire_date, e.salary FROM tbl_customer c
JOIN tbl_order o ON c.customer_id = o.customer_id
  JOIN tbl_employee e ON e.employee_id = o.order_id
  WHERE c.customer_id = @customer_id
    AND o.order_id = @order_id
    AND e.employee_id = @employee_id;

EXEC sp_read_order @customer_id = 1, @order_id = 1, @employee_id = 1

--Stored Procedure with parameters and joins using different aggregate functions
CREATE PROCEDURE sp_read_details
@customer_id INT,
@order_id INT,
@employee_id INT
AS
  SELECT
	MAX(e.salary) AS max_salary,
	COUNT(o.order_id) AS order_count,
	SUM(o.total_amount) AS total_amount_sum,
	AVG(e.salary) AS average_salary
  FROM 
    tbl_customer c
	JOIN tbl_order o ON c.customer_id = o.customer_id
    JOIN tbl_employee e ON e.employee_id = o.order_id
  WHERE
	c.customer_id = @customer_id
    AND o.order_id = @order_id
    AND e.employee_id = @employee_id;

EXEC sp_read_details @customer_id = 1, @order_id = 1, @employee_id = 1


CREATE PROCEDURE sp_read_details1
  @customer_id INT,
  @order_id INT,
  @employee_id INT
AS
  SELECT
    e.employee_id,
    e.salary,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_amount_sum
  FROM
    tbl_customer c
    JOIN tbl_order o ON c.customer_id = o.customer_id
    JOIN tbl_employee e ON e.employee_id = o.order_id
  WHERE
    c.customer_id = @customer_id
    AND o.order_id = @order_id
    AND e.employee_id = @employee_id
  GROUP BY
    e.employee_id,
    e.salary
  HAVING
    COUNT(o.order_id) > 1
    OR SUM(o.total_amount) > 200

EXEC sp_read_details1 @customer_id = 2, @order_id=2, @employee_id = 2

