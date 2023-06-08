create database Office

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

SELECT * FROM tbl_employee

-- Creating a view from the employee table
CREATE VIEW vw_employee AS
SELECT * FROM tbl_employee

SELECT * FROM vw_employee

DELETE tbl_employee

-- Creating the table
CREATE TABLE tbl_project (
  project_id INT PRIMARY KEY,
  project_name VARCHAR(100),
  project_description VARCHAR(255),
  project_start_date DATE,
  end_date DATE,
  project_manager VARCHAR(50)
)

-- Inserting sample values
INSERT INTO tbl_project (project_id, project_name, project_description, project_start_date, end_date, project_manager)
VALUES
  (1, 'Project A', 'Development of a new website', '2023-01-01', '2023-06-30', 'John Smith'),
  (2, 'Project B', 'Implementation of a CRM system', '2023-02-15', '2023-08-31', 'Jane Doe'),
  (3, 'Project C', 'Product launch campaign', '2023-03-10', '2023-05-31', 'David Johnson'),
  (4, 'Project D', 'Mobile app development', '2023-04-01', '2023-10-31', 'Emily Wilson'),
  (5, 'Project E', 'Infrastructure upgrade', '2023-05-15', '2023-11-30', 'Michael Brown')

SELECT * FROM tbl_project

-- Creating a view for employee and project
CREATE VIEW vw_employee_project AS
SELECT e.employee_id, e.first_name, e.last_name, p.project_name, p.project_start_date, p.end_date
FROM tbl_employee e
JOIN tbl_project p ON e.employee_id = p.project_id;

-- Deleting the view
DROP VIEW IF EXISTS vw_employee_project;


SELECT * FROM vw_employee_project


-- View Table do not allow direct insertion or modification of data.
-- INSERT INTO vw_employee VALUES(7,'Nikil', 'S', 'Project Agni', '2023-05-23', '2023-06-23')





