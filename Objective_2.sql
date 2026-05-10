-- Objective 2
use restaurant_db;

-- 1. view the order details table
select * from order_details;

-- 2. Date range of the table
select min(order_date), max(order_date) from order_details;

-- 3. how many orders made within the date range
select count(distinct order_id) from order_details;

-- 4. how many items were ordered within the date range
select count(*) from order_details;

-- 5. which order has the most number of items
select order_id, count(item_id) as tot_num_items 
from order_details 
group by order_id
order by tot_num_items desc;

-- 6. How many orders has more than 12 items.
select count(*) from 
(select order_id, count(item_id) as tot_num_items 
from order_details 
group by order_id
having tot_num_items > 12) as tot_num_orders;