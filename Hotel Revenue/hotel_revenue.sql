-- Load hotel revenue dataset
SELECT 
  * 
FROM 
  practice..hotel_revenue 
  
-- Looking total revenue based on assigned room type
SELECT 
  assigned_room_type, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue 
FROM 
  practice..hotel_revenue 
GROUP BY 
  assigned_room_type 
ORDER BY 
  assigned_room_type ASC 
  
-- Looking total nights based on customer type at week days and weekend
SELECT 
  customer_type, 
  SUM(
    stays_in_week_nights + stays_in_weekend_nights
  ) AS total_nights 
FROM 
  practice..hotel_revenue 
GROUP BY 
  customer_type 
ORDER BY 
  customer_type ASC 
  
-- Looking total revenue based on market segment
SELECT 
  market_segment, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue 
FROM 
  practice..hotel_revenue 
GROUP BY 
  market_segment 
ORDER BY 
  market_segment ASC 
  
-- Looking total adr based on distribution channel
SELECT 
  distribution_channel, 
  SUM(adr) AS total_adr 
FROM 
  practice..hotel_revenue 
GROUP BY 
  distribution_channel 
ORDER BY 
  distribution_channel ASC 
  
-- Looking total lead time based on meal and customer type
SELECT 
  meal, 
  customer_type, 
  SUM(lead_time) AS total_lead_time 
FROM 
  practice..hotel_revenue 
GROUP BY 
  meal, 
  customer_type 
ORDER BY 
  meal ASC 
  
-- Looking total revenue based on market segment and hotel
SELECT 
  market_segment, 
  hotel, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue 
FROM 
  practice..hotel_revenue 
GROUP BY 
  market_segment, 
  hotel 
ORDER BY 
  market_segment ASC 
  
-- Looking total revenue, total adr and total nights based on reservation status date
SELECT 
  reservation_status_date, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue, 
  SUM(adr) AS total_adr, 
  SUM(
    stays_in_week_nights + stays_in_weekend_nights
  ) AS total_nights 
FROM 
  practice..hotel_revenue 
GROUP BY 
  reservation_status_date 
  
-- Looking total lead time based on customer type and reservation status
SELECT 
  customer_type, 
  reservation_status, 
  SUM(lead_time) AS total_lead_time 
FROM 
  practice..hotel_revenue 
GROUP BY 
  customer_type, 
  reservation_status 
ORDER BY 
  customer_type ASC 
  
-- Looking total adr and revenue based on market segment and distribution channel
SELECT 
  market_segment, 
  distribution_channel, 
  SUM(adr) AS total_adr, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    2
  ) AS total_revenue 
FROM 
  practice..hotel_revenue 
GROUP BY 
  market_segment, 
  distribution_channel 
ORDER BY 
  market_segment ASC 
  
-- Looking total adr, revenue per day and per month based on market segment and distribution channel
SELECT 
  market_segment, 
  distribution_channel, 
  SUM(adr) AS total_adr, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue_per_day, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) * 30 AS total_revenue_per_month 
FROM 
  practice..hotel_revenue 
GROUP BY 
  market_segment, 
  distribution_channel 
ORDER BY 
  market_segment ASC 
  
-- Looking total revenue which has more than equals to 50000 based on country, hotel and customer type
SELECT 
  country, 
  hotel, 
  customer_type, 
  stays_in_week_nights, 
  stays_in_weekend_nights, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue 
FROM 
  practice..hotel_revenue 
GROUP BY 
  country, 
  hotel, 
  customer_type, 
  stays_in_week_nights, 
  stays_in_weekend_nights 
HAVING 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) >= 50000 
ORDER BY 
  country ASC 
  
-- Looking revenue description based on market segment, hotel, country and distribution channel
SELECT 
  market_segment, 
  hotel, 
  country, 
  distribution_channel, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue, 
  CASE WHEN ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) > 50000 THEN 'Very Expensive' WHEN ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) = 50000 THEN 'Intermediate' ELSE 'Cheaper' END AS revenue_description 
FROM 
  practice..hotel_revenue 
GROUP BY 
  market_segment, 
  hotel, 
  country, 
  distribution_channel 
ORDER BY 
  market_segment ASC 
  
-- Looking total revenue based on hotel, customer type, market segment and country on indonesia, france and egypt
SELECT 
  country, 
  hotel, 
  customer_type, 
  market_segment, 
  ROUND(
    SUM(
      (
        stays_in_week_nights + stays_in_weekend_nights
      ) * adr
    ), 
    0
  ) AS total_revenue 
FROM 
  practice..hotel_revenue 
WHERE 
  country IN ('IDN', 'FRA', 'EGY') 
GROUP BY 
  country, 
  hotel, 
  customer_type, 
  market_segment 
ORDER BY 
  country ASC
