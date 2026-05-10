-- Objective 3
select * from menu_items;
select * from order_details;
-- 1. join both menu and order table
select * from 
menu_items as a join order_details as b 
on a.menu_item_id = b.item_id;

-- 2. least and most ordered items? Which category are they?
select a.item_name,a.category,count(b.order_details_id) as tot_purchase from 
menu_items as a join order_details as b 
on a.menu_item_id = b.item_id 
group by a.item_name,a.category
order by tot_purchase asc;

-- 3. What are the top 5 orders that spent the most money?
select b.order_id,sum(a.price) as total_sum from 
menu_items as a join order_details as b 
on a.menu_item_id = b.item_id
group by b.order_id
order by total_sum desc limit 5;

-- 4. View the details of the highest spet order. What insights you gather from that?
select a.category,count(b.item_id) as ord_item from 
menu_items as a join order_details as b 
on a.menu_item_id = b.item_id
where b.order_id = 440
group by a.category
order by ord_item desc;

-- 5. View the details of the top 5 highest spent orders. What insights you gather from that?
select b.order_id,a.category,count(b.item_id) as ord_item from 
menu_items as a join order_details as b 
on a.menu_item_id = b.item_id
where b.order_id in (440, 2675,2075,1957,330)
group by b.order_id,a.category;

-- 6. How much was the most expensive order?
select b.order_id,sum(a.price) as expensive_price from 
menu_items as a join order_details as b 
on a.menu_item_id = b.item_id
group by b.order_id
order by expensive_price desc limit 1;