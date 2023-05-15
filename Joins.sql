use Electricity_Bill

-- Question 1

Select tbl_meter.meter_number, tbl_building.owner_name, tbl_building.contact_number, tbl_building_type.connection_name, tbl_electricity_connection_type.connection_name
from tbl_meter
join tbl_building on tbl_meter.building_id = tbl_building.id
join tbl_building_type on tbl_building.building_type_id = tbl_building_type.id
join tbl_electricity_connection_type on tbl_building_type.connection_type_id = tbl_electricity_connection_type.id
order by tbl_building.owner_name asc, tbl_meter.meter_number asc

-- Question 2

Select * 
from tbl_bill
join tbl_meter on tbl_bill.meter_id = tbl_meter.id
order by tbl_bill.payable_amount asc

-- Question 3

select tbl_meter.meter_number, tbl_building.owner_name, tbl_building.building_address, tbl_building.contact_number
from tbl_meter
right join tbl_building on tbl_meter.building_id = tbl_building.id
order by tbl_building.owner_name asc, tbl_meter.meter_number

-- Question 4

select tbl_electricity_connection_type.connection_name, tbl_slab.from_unit, tbl_slab.to_unit, tbl_slab.rate
from tbl_electricity_connection_type
right join tbl_slab on tbl_electricity_connection_type.id = tbl_slab.connection_type_id
order by tbl_slab.rate asc

-- Question 6

SELECT tbl_building.owner_name, tbl_building.building_address, tbl_meter.meter_number, tbl_bill.payable_amount
FROM tbl_building
JOIN tbl_meter ON tbl_building.id = tbl_meter.building_id
JOIN tbl_bill ON tbl_bill.meter_id = tbl_meter.id
WHERE tbl_bill.fine_amount = (SELECT MAX(tbl_bill.fine_amount) FROM tbl_bill)
ORDER BY tbl_building.owner_name ASC;

-- Question 7

SELECT tbl_building.owner_name, tbl_building.building_address, tbl_meter.meter_number, tbl_electricity_reading.total_units
FROM tbl_building
JOIN tbl_meter ON tbl_meter.building_id = tbl_building.id
JOIN tbl_electricity_reading ON tbl_electricity_reading.meter_id = tbl_meter.id
JOIN tbl_bill ON tbl_bill.meter_id = tbl_meter.id
WHERE MONTH(tbl_bill.bill_month) = 12 AND YEAR(tbl_bill.bill_year) = 2017
ORDER BY tbl_electricity_reading.total_units DESC
