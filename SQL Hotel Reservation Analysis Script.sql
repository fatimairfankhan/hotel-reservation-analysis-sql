CREATE DATABASE hotel_reservation;

USE hotel_reservation;

SET sql_safe_updates = 0;

CREATE TABLE hotel_reservations (
    Booking_ID VARCHAR(255) PRIMARY KEY,
    no_of_adults INT,
    no_of_children INT,
    no_of_weekend_nights INT,
    no_of_week_nights INT,
    type_of_meal_plan VARCHAR(255),
    room_type_reserved VARCHAR(255),
    lead_time INT,
    arrival_date VARCHAR(10), -- Store as VARCHAR
    market_segment_type VARCHAR(255),
    avg_price_per_room DECIMAL(10, 2),
    booking_status VARCHAR(50)
);

SELECT Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights,
       type_of_meal_plan, room_type_reserved, lead_time,
       STR_TO_DATE(arrival_date, '%d-%m-%y') AS arrival_date,
       market_segment_type, avg_price_per_room, booking_status
FROM hotel_reservations;

SELECT * FROM hotel_reservations;

-- 1
SELECT COUNT(*) AS total_reservations
FROM hotel_reservations;

-- 2
SELECT type_of_meal_plan, COUNT(*) AS total_bookings
FROM hotel_reservations
GROUP BY type_of_meal_plan
ORDER BY total_bookings DESC
LIMIT 1;

-- 3
SELECT AVG(avg_price_per_room) AS avg_price_per_room_children
FROM hotel_reservations
WHERE no_of_children > 0;

-- 4
SELECT COUNT(*) AS reservations_in_2018
FROM hotel_reservations
WHERE STR_TO_DATE(arrival_date, '%d-%m-%Y') BETWEEN '2018-01-01' AND '2018-12-31';

-- 5
SELECT room_type_reserved, COUNT(*) AS total_bookings
FROM hotel_reservations
GROUP BY room_type_reserved
ORDER BY total_bookings DESC
LIMIT 1;

-- 6
SELECT COUNT(*) AS weekend_reservations
FROM hotel_reservations
WHERE no_of_weekend_nights > 0;

-- 7
SELECT MAX(lead_time) AS max_reservation_time, MIN(lead_time) AS min_reservation_time
FROM hotel_reservations;

-- 8
SELECT market_segment_type, COUNT(*) AS total_bookings
FROM hotel_reservations
GROUP BY market_segment_type
ORDER BY total_bookings DESC
LIMIT 1;

-- 9
SELECT COUNT(*) AS confirmed_reservations
FROM hotel_reservations
WHERE booking_status = 'Not_Canceled';

-- 10
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM hotel_reservations;

-- 11
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
FROM hotel_reservations
WHERE no_of_children > 0;

-- 12
SELECT MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y')) AS month,
       COUNT(*) AS reservations_count
FROM hotel_reservations
GROUP BY MONTH(STR_TO_DATE(arrival_date, '%d-%m-%Y'));

-- 13
SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights
FROM hotel_reservations
GROUP BY room_type_reserved;

-- 14
SELECT room_type_reserved, COUNT(*) AS total_bookings, AVG(avg_price_per_room) AS avg_price
FROM hotel_reservations
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY total_bookings DESC
LIMIT 1;

-- 15
SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price_per_room
FROM hotel_reservations
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC
LIMIT 1;
