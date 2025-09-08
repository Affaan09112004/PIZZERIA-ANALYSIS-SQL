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

-- TOTAL NUMBER OF ORDER PLACED

SELECT COUNT(order_id) as TOTAL_NUMBER_OF_ORDERS_PLACED
from orders 

-- TOTAL NUMBER OF PIZZAS SOLD

SELECT COUNT(order_details_id) as TOTAL_NUMBER_OF_PIIZA_ORDERS_PLACED
from order_details 

-- TOTAL TYPES OF PIZZAS

select count(pizza_type_id) as TOTALTYPES_OF_PIZZAS
from pizza_types  

-- NAMES OF EVERY PIZZA 

select `name` 
from pizza_types

-- different types of size in piizas

select distinct(size)
from pizzas

-- CALCULATING THE TOTAL REVENUE GENERATED FROM PIZZA SALES / TOTAL SALES  

select round(SUM(order_details.quantity*pizzas.price),2) as TOTAL_SALES
from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id

-- INDENTITY THE HIGHEST PRICED pizza_id

SELECT pizza_types.`name`,pizzas.price
from pizza_types inner join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc
limit 1


-- INDENTIFY THE MOST COMMON PIZZA SIZE ORDERED

select pizzas.size,count(order_details.order_details_id) as order_count
from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
group by pizzas.size
order by order_count desc 
limit 1 


-- list the 5 most pizza types along with their quantity

SELECT pizza_types.`name`, SUM(order_details.quantity) AS total_quantity
FROM pizza_types
INNER JOIN pizzas
  ON pizza_types.pizza_type_id = pizzas.pizza_type_id
INNER JOIN order_details
  ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.`name`
order by total_quantity desc
limit 5

-- TOTAL QUANTITY OF EACH PIZZA CATEGORY ORDERED

select pizza_types.category,sum(order_details.quantity) as qty
from pizza_types inner join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
inner join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.category
order by qty desc

-- DETERMINE THE DISTRIBUTION OF ORDERS BY HOUR OF THE DAY
select hour(order_time)as hour1,count(order_id)
from orders
group by hour1 


-- find category wise distribution of pizzas 

select category,count(`name`) from pizza_types
group by category


-- group the order by date and calculate the average number of pizzas ordered per day

select round(avg(quantity),2) as avg_order_per_day from
(select orders.order_date,sum(order_details.quantity) as quantity
from orders inner join order_details
on orders.order_id=order_details.order_id
group by orders.order_date) as order_quantity


-- top 3 ordered pizza based on revenue 

select pizza_types.`name`,sum(order_details.quantity*pizzas.price) as revenue 
from pizza_types inner join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
inner join order_details
on pizzas.pizza_id=order_details.pizza_id
group by pizza_types.`name`
order by revenue desc
limit 3

-- calculate the percentage contribution of each pizza category to total renvenue 

SELECT 
    pizza_types.category,
    ROUND(
        (SUM(order_details.quantity * pizzas.price) / 
        (SELECT SUM(order_details.quantity * pizzas.price)
         FROM order_details 
         INNER JOIN pizzas 
         ON order_details.pizza_id = pizzas.pizza_id)
        ) * 100, 2
    ) AS revenue_percentage
FROM pizza_types
INNER JOIN pizzas 
    ON pizza_types.pizza_type_id = pizzas.pizza_type_id
INNER JOIN order_details 
    ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue_percentage DESC 

-- analyze the cumulative revenue generated over time 

select order_date,sum(revenue)over (order by order_date) as cum from
(select orders.order_date,sum(order_details.quantity*pizzas.price) as revenue
from order_details inner join pizzas
on order_details.pizza_id=pizzas.pizza_id
inner join orders
on orders.order_id =orders.order_id
group by orders.order_date) as sales

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category

select rank1, category,`name`,revenue from
(select category,`name`,revenue,rank()over(partition by category order by revenue)as rank1 from
(select pizza_types.category,pizza_types.`name`,sum(order_details.quantity*pizzas.price) as revenue
from pizza_types inner join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
inner join order_details
on order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category,pizza_types.`name`)as a) as b
where rank1<=3



