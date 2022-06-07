-- Load mcdonald's nutrition menu
select 
  * 
from 
  practice..menu 
  
-- Looking unique of category values
select 
  distinct Category 
from 
  practice..menu 
  
-- Looking count of category values
select 
  Category, 
  count(Category) as value 
from 
  practice..menu 
group by 
  Category 
order by 
  value desc 
  
-- Looking unique of item values
select 
  distinct Item 
from 
  practice..menu 
  
-- Looking count of item values
select 
  Item, 
  count(Item) as value 
from 
  practice..menu 
group by 
  Item 
order by 
  value desc 
  
-- Looking unique of serving size values
select 
  distinct [Serving Size] 
from 
  practice..menu 
  
-- Looking count of serving size values
select 
  [Serving Size], 
  count([Serving Size]) as value 
from 
  practice..menu 
group by 
  [Serving Size] 
order by 
  value desc 
  
-- Looking average of calories based on category, item and serving size
select 
  Category, 
  Item, 
  [Serving Size], 
  avg(Calories) as Avg_Calories 
from 
  practice..menu 
group by 
  Category, 
  Item, 
  [Serving Size] 
order by 
  Avg_Calories desc 
  
-- Looking average of calories based on category on beverages, item and serving size
select 
  Category, 
  Item, 
  [Serving Size], 
  avg(Calories) as Avg_Calories 
from 
  practice..menu 
where 
  Category = 'Beverages' 
group by 
  Category, 
  Item, 
  [Serving Size] 
order by 
  Avg_Calories desc 
  
-- Looking item for soda or coffee
select 
  * 
from 
  practice..menu 
where 
  Item like 'Coca-Cola%' 
  or Item like 'Sprite%' 
  or Item like 'Coffee%' 
order by 
  Calories desc 
  
-- Looking average of calories based on category on chicken and fish along with item
select 
  Category, 
  Item, 
  [Serving Size], 
  avg(Calories) as Avg_Calories 
from 
  practice..menu 
where 
  Category = 'Chicken & Fish' 
group by 
  Category, 
  Item, 
  [Serving Size] 
order by 
  Avg_Calories desc 
  
-- Looking item for chicken
select 
  * 
from 
  practice..menu 
where 
  Item like 'Chicken%' 
  or Item like '%Chicken%' 
  or Item like '%Chicken' 
order by 
  Calories desc 
  
-- Looking item for egg
select 
  * 
from 
  practice..menu 
where 
  Item like 'egg%' 
  or Item like '%egg%' 
  or Item like '%egg' 
order by 
  Calories desc 
  
-- Looking menu low calory
select 
  * 
from 
  practice..menu 
where 
  Calories <= '800' 
order by 
  Calories desc 
  
-- Looking menu high protein and low calory
select 
  * 
from 
  practice..menu 
where 
  Protein >= '20' 
  and Calories <= '800' 
order by 
  Protein desc
