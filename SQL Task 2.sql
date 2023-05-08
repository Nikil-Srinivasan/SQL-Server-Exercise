use Electricity_Bill

insert into tbl_electricity_connection_type
values (100, 'home')

insert into tbl_electricity_connection_type
values (101, 'Commercial')

insert into tbl_electricity_connection_type
values (102, 'home')

insert into tbl_electricity_connection_type
values (103, 'Commercial')

insert into tbl_electricity_connection_type
values (104, 'Commercial')

select * from tbl_electricity_connection_type

create table tbl_slab(
	id int Primary Key,
	connection_type_id int Foreign Key References tbl_electricity_connection_type(id),
	from_unit int,
	to_unit int,
	rate double precision
)

insert into tbl_slab
values (100, 100, 145, 230, 4)

insert into tbl_slab 
values(101, 101, 127, 174, 4)

insert into tbl_slab
values (102, 102, 352, 401, 6)

select * from tbl_slab
select * from tbl_building_type

insert into tbl_building_type
values (100, 'Apartment', 100)

insert into tbl_building_type
values (101, 'home', 101)

insert into tbl_building_type
values (102, 'Skyscraper', 102)

insert into tbl_building_type
values (103, 'College', 103)

insert into tbl_building_type
values (104, 'Hospital', 104)

update tbl_slab
set from_unit = 1

update tbl_building_type
set connection_name = 'mall'
where id = 102

delete from tbl_slab

delete from tbl_building_type
where connection_type_id = 101

select * from tbl_building_type order by connection_name asc

create table tbl_building (
	id int Primary Key,
	owner_name varchar(100) not null,
	building_address varchar(100) not null,
	building_type_id int Foreign Key References tbl_building_type(id),
	contact_number varchar(100) not null,
	email_address varchar(100)
)

insert into tbl_building
values (100, 'Nikil', 'No.6, Kuruku Santhu, Dubai', 100, '9876543210', 'nikil@hotmail.com')

insert into tbl_building
values (101, 'kavin', 'No.7, Kuruku Santhu, Dubai', 101, '5876543211', 'kavin@hotmail.com')

insert into tbl_building
values (102, 'sai', 'No.8, Kuruku Santhu, Dubai', 102, '6876543212', 'sai@hotmail.com')

insert into tbl_building
values (103, 'satha', 'No.9, Kuruku Santhu, Dubai', 103, '7876543213', 'satha@hotmail.com')

insert into tbl_building
values (104, 'vicky', 'No.10, Kuruku Santhu, Dubai', 104, '8876543214', 'vicky@hotmail.com')

select * from tbl_building order by owner_name asc

create table tbl_meter(
	id int Primary Key,
	meter_number int Foreign Key References tbl_building(id),
	building_id int not null
)

create table tbl_electricity_reading(
	id int Primary Key,
	meter_id int Foreign Key References tbl_meter(id),
	reading_day Date,
	h1 int,
	h2 int,
	h3 int,
	h4 int,
	h5 int,
	h6 int,
	h7 int,
	h8 int,
	h9 int,
	h10 int,
	h11 int,
	h12 int,
	h13 int,
	h14 int,
	h15 int,
	h16 int,
	h17 int,
	h18 int,
	h19 int,
	h20 int,
	h21 int,
	h22 int,
	h23 int,
	h24 int,
	total_units int
)

select * from tbl_electricity_reading order by total_units desc

select meter_number from tbl_meter

select owner_name, contact_number from tbl_building order by owner_name asc

create table tbl_bill(
	id int Primary Key,
	meter_id int Foreign Key References tbl_meter(id),
	bill_month int not null,
	bill_year int not null,
	due_date date not null,
	total_units int not null,
	payable_amount double precision not null,
	is_payed tinyint not null,
	payment_date Date,
	fine_amount double precision
)

select total_units, payable_amount, fine_amount from tbl_bill order by total_units desc

select * from tbl_slab order by from_unit asc

select * from tbl_building where owner_name = 'kavin' 

select * from tbl_bill where total_units > 200 order by total_units desc

select * from tbl_bill where due_date = '2017-10-01' order by payable_amount desc

select owner_name, contact_number 
from tbl_building 
where email_address is null 
order by owner_name asc

select * from tbl_building where owner_name like 'S%'

select * from tbl_building where building_type_id = 100 order by owner_name asc

select * from tbl_electricity_reading
where total_units between 500 and 1000
order by total_units asc

select meter_id, total_units 
from tbl_electricity_reading
where h13 < h14
order by total_units desc