USE quickride;
-- No 1
SELECT trip_id, rider_name, fare
FROM trips
WHERE city = 'lagos';

-- No 2 
SELECT rider_name, city, fare 
FROM trips 
WHERE status = 'Completed' 
ORDER BY fare DESC
LIMIT 5

-- No 3
SELECT city
FROM trips;

-- No 4
SELECT *
FROM trips
WHERE payment_method = 'Card' ;

-- No 5-- 
SELECT *
FROM trips
WHERE distance_km 
BETWEEN '5' AND '10';

-- No 6-- 
SELECT driver_id
FROM trips
WHERE driver_id LIKE 'A%';

-- No 7
SELECT *
FROM trips
WHERE payment_method = 'Card'
	OR payment_method = 'Wallet';
    
-- No 8
SELECT	rating
FROM trips
WHERE rating = 0

-- No 9
SELECT city, fare
FROM trips
WHERE status = 'Completed'
ORDER BY City ASC, fare DESC


-- No 10
SELECT *
FROM trips
WHERE status = 'Cancelled'

-- No 11
SELECT 
	SUM(fare),
	AVG(fare),
	MIN(fare),
	Max(fare)
FROM trips
WHERE status = 'Completed'

-- No 12
SELECT 
vehicle_type,
COUNT(*)
FROM trips
WHERE status = 'Completed'
GROUP BY vehicle_type

-- No 13
SELECT 
    city,
    SUM(fare),
    MAX(fare)
FROM trips
WHERE status = 'Completed'
GROUP BY city

No 14
	SELECT 
		city,
		AVG(rating)  AS average_rating
	FROM trips
    GROUP BY city
    HAVING AVG(rating) < '4.0'
    
-- No 15
SELECT 
    t.trip_id,
    t.fare,
    t.city ,
    d.driver_name,
    d.home_city
FROM trips t
JOIN drivers d ON t.driver_id = d.driver_id;

	
    
-- No 16
SELECT 
    d.driver_name,
    COUNT(t.trip_id) AS trip_count
FROM trips t
JOIN drivers d ON t.driver_id = d.driver_id
WHERE t.status = 'Completed'
GROUP BY d.driver_id, d.driver_name
HAVING COUNT(t.trip_id) > 6;




	

