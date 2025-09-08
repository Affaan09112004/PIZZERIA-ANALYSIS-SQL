create database SQL_PROJECT
use SQL_PROJECT 

-- There are 4 tables in the dataset.
-- importing 3 tables using wizard and they are pizza_types,order_details and pizzas
-- creating order table first and then importing the data because order table contains date and time datatype which is not availble on wizard

create table orders(
order_id int primary key,
order_date date not null,
order_time time not null
) 
-- orders data imported 

select*from order_details
select*from orders
select*from pizza_types
select*from pizzas 


-- assigning primary key to order_details table and to column order_details_id

alter table order_details
modify order_details_id int primary key

desc order_details
desc orders
desc pizza_types
desc pizzas

