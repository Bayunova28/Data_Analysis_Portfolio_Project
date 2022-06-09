-- Load airbnb new york dataset
select * from practice..AB_NYC_2019

-- Looking unique of name values
select distinct name from practice..AB_NYC_2019

-- Looking count of name values
select name, count(name) as value from practice..AB_NYC_2019
group by name
order by value desc

-- Check missing value in name attribute values
select count(*) from practice..AB_NYC_2019
where name is null

-- Handling missing value in name attribute values
delete from practice..AB_NYC_2019
where name is null

-- Looking unique of host name values
select distinct host_name from practice..AB_NYC_2019

-- Looking count of host name values
select host_name, count(host_name) as value from practice..AB_NYC_2019
group by host_name
order by value desc

-- Check missing value in host name attribute values
select count(*) from practice..AB_NYC_2019
where host_name is null

-- Handling missing value in host name attribute values
delete from practice..AB_NYC_2019
where host_name is null

-- Looking unique of neighbourhood group values
select distinct neighbourhood_group from practice..AB_NYC_2019

-- Looking count of neighbourhood group values
select neighbourhood_group, count(neighbourhood_group) as value from practice..AB_NYC_2019
group by neighbourhood_group
order by value desc

-- Looking unique of neighbourhood values 
select distinct neighbourhood from practice..AB_NYC_2019

-- Looking count of neighbourhood values
select neighbourhood, count(neighbourhood) as value from practice..AB_NYC_2019
group by neighbourhood
order by value desc

-- Looking unique of room type values
select distinct room_type from practice..AB_NYC_2019

-- Looking count of room type values
select room_type, count(room_type) as value from practice..AB_NYC_2019
group by room_type
order by value desc

-- Handling missing value in last review column
delete from practice..AB_NYC_2019
where last_review is null

-- Looking total minimum nights based on room type on private and shared room along with neighbourhood group at brooklyn
select name, host_name, neighbourhood_group, room_type, sum(minimum_nights) as total_minimum_nights from practice..AB_NYC_2019
where room_type in ('Private room', 'Shared room') and neighbourhood_group = 'Brooklyn'
group by name, host_name, neighbourhood_group, room_type
order by total_minimum_nights desc

-- Looking total price based on minimum nights on room type on private room and neighbourhood group on queens and staten island
select name, room_type, neighbourhood_group, minimum_nights, (sum(price) * minimum_nights) as total_price from practice..AB_NYC_2019
where room_type = 'Private room' and neighbourhood_group in ('Queens', 'Staten Island')
group by name, room_type, neighbourhood_group, minimum_nights
order by total_price desc

-- Looking average reviews per month based on host name on rachel
select name, host_name, room_type, avg(reviews_per_month) as avg_reviews_per_month from practice..AB_NYC_2019
where host_name = 'Rachel'
group by name, host_name, room_type
order by avg_reviews_per_month desc

-- Looking total number of reviews based on room type in private room and entire home/apt along with price more than equals 500
select top 20 name, host_name, room_type, price, sum(number_of_reviews) as total_number_of_reviews 
from practice..AB_NYC_2019
where room_type in ('Private room', 'Entire home/apt') and price >= 500
group by name, host_name, room_type, price
order by total_number_of_reviews desc

-- Looking average price per month based on neighbourhood group at manhattan and brooklyn along with minimum nights more than equals 50
select host_name, neighbourhood_group, neighbourhood, minimum_nights, number_of_reviews, avg((price) * 30) as avg_price_per_month
from practice..AB_NYC_2019
where neighbourhood_group in ('Manhattan', 'Brooklyn') and minimum_nights >= 50
group by host_name, neighbourhood_group, neighbourhood, minimum_nights, number_of_reviews
order by avg_price_per_month desc

-- Looking comparison of average price per day and average price per month
select name, host_name, neighbourhood_group, neighbourhood, room_type, avg(price) as avg_price_per_day, avg((price) * 30) as avg_price_per_month
from practice..AB_NYC_2019
group by name, host_name, neighbourhood_group, neighbourhood, room_type
order by avg_price_per_day desc




