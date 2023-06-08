use Office

CREATE TRIGGER trg_employee_create
ON tbl_employee
AFTER INSERT
AS
BEGIN
  SELECT * FROM tbl_employee
END

INSERT INTO tbl_employee VALUES (10, 'MiCE', 'BLACK', '23345777', '2023-10-25', 34000.00, 2)

CREATE TRIGGER trg_employee_update
ON tbl_employee
AFTER UPDATE
AS
BEGIN
  SELECT * FROM tbl_employee
END

UPDATE tbl_employee
SET salary = 10000
WHERE employee_id = 1

CREATE TRIGGER trg_employee_delete
ON tbl_employee
AFTER DELETE
AS
BEGIN
  -- Create tbl_employee_archive and insert deleted rows
  CREATE TABLE tbl_employee_archive (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(20)
  )

  INSERT INTO tbl_employee_archive (employee_id, first_name, last_name, phone_number)
  SELECT employee_id, first_name, last_name, phone_number
  FROM deleted 
END;


DROP TABLE IF EXISTS tbl_employee

DROP TRIGGER IF EXISTS trg_employee_delete