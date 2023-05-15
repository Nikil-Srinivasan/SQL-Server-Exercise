CREATE TABLE Salesman (
    salesman_id INT PRIMARY KEY,
    salesman_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Salesman (salesman_id, salesman_name, city)
VALUES
    (1001, 'John Doe', 'London'),
    (1002, 'Jane Smith', 'New York'),
    (1003, 'David Johnson', 'London'),
    (1004, 'Sarah Williams', 'Paris')

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Sample Values for Customer Table
INSERT INTO Customer (customer_id, customer_name, city)
VALUES
    (2001, 'Michael Brown', 'London'),
    (2002, 'Emily Davis', 'Sydney'),
    (2003, 'Robert Wilson', 'London'),
    (2004, 'Emma Taylor', 'New York');

SELECT * FROM Salesman 
WHERE city = 'London'
UNION
SELECT * FROM Customer
WHERE city = 'London'

SELECT salesman_id, city
FROM Salesman
UNION
SELECT customer_id, city
FROM Customer;

SELECT salesman_id, 'Salesman' AS role
FROM Salesman
UNION
SELECT customer_id, 'Customer' AS role
FROM Customer;
