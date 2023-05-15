use Electricity_Bill

-- Question 1
SELECT owner_name, LEN(owner_name) AS name_length
FROM tbl_building
ORDER BY owner_name ASC;

-- Question 2
SELECT owner_name, contact_number
FROM tbl_building
WHERE LEN(owner_name) =(
	SELECT MIN(LEN(owner_name)) FROM tbl_building
)
ORDER BY owner_name ASC

-- Question 3
SELECT owner_name, CONCAT(contact_number, ' - ', email_address) AS contact_details
FROM tbl_building
ORDER BY owner_name DESC

-- Question 4
SELECT LEFT(owner_name, 3) AS name_code, contact_number
FROM tbl_building
ORDER BY owner_name ASC

-- Question 5
SELECT building_type_name
FROM tbl_building_type
WHERE building_type_name LIKE '%L'
ORDER BY building_type_name ASC

-- Question 6
SELECT * 
FROM tbl_building
WHERE owner_name LIKE '%ki%'
ORDER BY owner_name ASC