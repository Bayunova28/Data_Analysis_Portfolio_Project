-- Load chennai housing sales price
select * from practice..chennai_housing_sales_price

-- Looking total rows from dataset
select count(*) as TOTAL_ROWS from practice..chennai_housing_sales_price

-- Looking unique of area values
select distinct AREA from practice..chennai_housing_sales_price

-- Looking count of area values
select AREA, count(AREA) as count from practice..chennai_housing_sales_price
group by AREA
order by count desc

-- Looking missing values from number of bedroom
select * from practice..chennai_housing_sales_price
where N_BEDROOM is null

-- Fill missing values from number of bedroom
update practice..chennai_housing_sales_price
set N_BEDROOM = 0
where N_BEDROOM is null

-- Looking missing values from number of bathroom 
select * from practice..chennai_housing_sales_price
where N_BATHROOM is null

-- Fill missing values from bathroom column
update practice..chennai_housing_sales_price
set N_BATHROOM = 0
where N_BATHROOM is null

-- Looking unique of sale condition values
select distinct SALE_COND from practice..chennai_housing_sales_price

-- Looking count of sale condition values
select SALE_COND, count(SALE_COND) as count from practice..chennai_housing_sales_price
group by SALE_COND
order by count desc

-- Looking unique of build type values
select distinct BUILDTYPE from practice..chennai_housing_sales_price

-- Looking count of build type values
select BUILDTYPE, count(BUILDTYPE) as count from practice..chennai_housing_sales_price
group by BUILDTYPE
order by count desc

-- Looking unique of utility availability values
select distinct UTILITY_AVAIL from practice..chennai_housing_sales_price

-- Looking count of utility availability values
select UTILITY_AVAIL, count(UTILITY_AVAIL) as count from practice..chennai_housing_sales_price
group by UTILITY_AVAIL
order by count desc

-- Looking unique of street values
select distinct STREET from practice..chennai_housing_sales_price

-- Looking count of street values
select STREET, count(STREET) as count from practice..chennai_housing_sales_price
group by STREET 
order by count desc

-- Looking missing values from overall column
select * from practice..chennai_housing_sales_price
where QS_OVERALL is null

-- Fill missing values from overall column
update practice..chennai_housing_sales_price
set QS_OVERALL = 0
where QS_OVERALL is null

-- Looking sales price based on period of date sales
select DATE_SALE, SALES_PRICE from practice..chennai_housing_sales_price

-- Looking average sales price based on area at chrompet and KK nagar along with number of bedroom less than 4
select AREA, N_BEDROOM, avg(SALES_PRICE) as AVG_SALES_PRICE from practice..chennai_housing_sales_price
where AREA in ('Chrompet', 'KK Nagar') and N_BEDROOM < 4
group by AREA, N_BEDROOM
order by AVG_SALES_PRICE desc

-- Looking sales price based on build type and has park facility 
select BUILDTYPE, PARK_FACIL, SALES_PRICE from practice..chennai_housing_sales_price
where PARK_FACIL = 'Yes'
order by SALES_PRICE desc

-- Looking sales price based on area and build type on house
select AREA, BUILDTYPE, SALES_PRICE from practice..chennai_housing_sales_price
where BUILDTYPE = 'House'
order by SALES_PRICE desc

-- Looking sales price based on sale condition on normal sales and has park facility 
select top 10 * from practice..chennai_housing_sales_price
where SALE_COND = 'Normal Sale' and PARK_FACIL = 'Yes'
order by SALES_PRICE desc



