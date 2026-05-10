use restaurant_db;
-- Ojective 1

-- 1. View the menu items
select * from menu_items;

-- 2. Count the total menu items
select count(*) from menu_items;

-- 3. least and expensive items in menu
select * from menu_items order by price desc limit 1;
select * from menu_items order by price asc limit 1;

-- 4. 
select count(*) from menu_items where category = "Italian";

-- 5. least and expensive Italian dishes on the menu
select * from menu_items where category = "Italian" order by price desc;

-- 6. How many dishes in each category
select category, count(menu_item_id) as Total_num_items from menu_items group by category;

-- 7. average price of category
select category, avg(price) as avg_price from menu_items 
group by category order by avg_price;
