USE project;
SELECT * FROM project.`hotel reservation`;

## 1.What is the total number of reservations in the dataset
SELECT COUNT(*) AS total_reservations FROM project.`hotel reservation`;

## 2.Which meal plan is the most popular among guests? 
SELECT type_of_meal_plan, COUNT(*) AS total_reservations
FROM project.`hotel reservation`
GROUP BY type_of_meal_plan
ORDER BY total_reservations DESC
LIMIT 1;

## 3.What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) 
FROM project.`hotel reservation`
WHERE no_of_children > 0;

## 4.How many reservations were made for the year 20XX (replace XX with the desired year)? 
SELECT COUNT(booking_status) AS no_of_reservations_in_2018
FROM project.`hotel reservation`
WHERE YEAR(STR_TO_DATE(arrival_date, '%Y-%m-%d')) = 2022;

## 5.What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(*) as most_common_room_type
FROM project.`hotel reservation`
GROUP BY room_type_reserved 
ORDER BY most_common_room_type DESC
LIMIT 1;

## 6.How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
SELECT COUNT(*) reservations_fall_on_weekend
FROM project.`hotel reservation`
WHERE no_of_weekend_nights > 0;

## 7.What is the highest and lowest lead time for reservations?  
SELECT 
MAX(lead_time) AS highest_lead_time,
MIN(lead_time) As lowest_lead_time
FROM 
project.`hotel reservation`;

## 8.What is the most common market segment type for reservations? 
SELECT market_segment_type, COUNT(*) AS most_common_market_segment_type
FROM project.`hotel reservation`
GROUP BY market_segment_type
ORDER BY most_common_market_segment_type DESC 
LIMIT 1;

## 9.How many reservations have a booking status of "Confirmed"?  
SELECT COUNT(*) AS No_of_confirmed_reservations
FROM project.`hotel reservation`
WHERE booking_status = "Confirmed";

## 10.What is the total number of adults and children across all reservations?  
SELECT COUNT(*) AS total_number_of_adults_and_children FROM project.`hotel reservation`;

## 11.What is the average number of weekend nights for reservations involving children?  
SELECT AVG(no_of_weekend_nights) AS average_number_of_weekend_nights
FROM project.`hotel reservation`
WHERE no_of_children > 0;

## 12.How many reservations were made in each month of the year? 
SELECT MONTH(STR_TO_DATE(arrival_date, '%Y-%m-%d')) AS MONTH,
COUNT(*) AS reservations_made_in_year_per_month
FROM project.`hotel reservation`
GROUP BY MONTH(STR_TO_DATE(arrival_date, '%Y-%m-%d'))
ORDER BY MONTH(STR_TO_DATE(arrival_date, '%Y-%m-%d'))

##  13.What is the average number of nights (both weekend and weekday) spent by guests for each room type?  
SELECT room_type_reserved,
AVG(no_of_weekend_nights + no_of_week_nights) AS average_number_of_nights
FROM project.`hotel reservation`
GROUP BY room_type_reserved;

## 14.For reservations involving children, what is the most common room type, and what is the average 
price for that room type? 
SELECT room_type_reserved, COUNT(room_type_reserved) AS common_room_type,
AVG(avg_price_per_room) AS avg_price
FROM project.`hotel reservation`
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY common_room_type DESC
LIMIT 1;

## 15.Find the market segment type that generates the highest average price per room?
SELECT market_segment_type,
MAX(avg_price_per_room) AS average_price_per_room
FROM project.`hotel reservation`
GROUP BY market_segment_type
ORDER BY average_price_per_room DESC
LIMIT 1;



