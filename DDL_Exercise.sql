create database Electricity_Bill

use Electricity_Bill

create table tbl_electricity_connection_type (
	id int Primary Key,
	connection_name varchar(20) not null
)

create table tbl_slab(
	id int Primary Key,
	connection_type_id int Foreign Key References tbl_electricity_connection_type(id),
	from_unit int,
	to_unit int,
	rate double precision
)

create table tbl_building_type (
	id int Primary Key,
	connection_name varchar(100) not null,
	connection_type_id int Foreign Key References tbl_electricity_connection_type(id)
)

create table tbl_building (
	id int Primary Key,
	owner_name varchar(100) not null,
	building_address varchar(100) not null,
	building_type_id int Foreign Key References tbl_building_type(id),
	contact_number varchar(100) not null,
	email_address varchar(100)
)

EXEC sp_rename 'tbl_building.owner_name', 'building_owner_name', 'COLUMN';

alter table tbl_building
alter column building_address varchar(255)

alter table tbl_electricity_connection_type 
add constraint check_connection_name 
check (connection_name in('commercial', 'home'))

EXEC sp_rename 'tbl_building', 'tbl_building_details'

drop table tbl_slab

drop table tbl_building_details
