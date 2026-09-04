USE quickride_plus;

-- “For the report I need every completed trip showing the rider's name, 
-- the driver's name, the city and the fare. The trips table only keeps ids,
--  so bring in the actual names.” 
-- TRIP HAVE DRIVER ID AND RIDER ID
SELECT d.driver_name, r.rider_name, t.city, t.fare
FROM trips AS t
JOIN riders AS r ON t.rider_id = r.rider_id
JOIN drivers AS d ON t.driver_id = d.driver_id;

-- “Pull all our Lagos trips, showing the rider, the driver, the vehicle type and the fare.” 
SELECT d.driver_name, r.rider_name, d.vehicle_type, t.city, t.fare
FROM trips AS t
JOIN riders AS r ON t.rider_id = r.rider_id
JOIN drivers AS d ON t.driver_id = d.driver_id
WHERE t.city = 'lagos';

-- “Who are our most valuable riders? Total spend per rider on completed trips, biggest spender first.” 
SELECT T.fare
FROM trips AS T
JOIN riders AS R ON T.rider_id = R.rider_id
WHERE status = 'Completed'
ORDER BY fare DESC;

-- “For the driver scorecard: for each driver, how many completed trips they did and their average rating.”
SELECT
	t.status,
    d.driver_name,
    AVG(t.rating)
FROM trips AS t
JOIN drivers AS d ON t.driver_id = d.driver_id
GROUP BY t.status, d.driver_name;
    
-- “Show me the trips that cost more than our average fare. I want to see the premium rides.”
SELECT fare
FROM trips
WHERE fare > (SELECT AVG(fare) FROM trips);

-- “For a reliability badge, which drivers have never had a single cancelled trip?” 
SELECT status, d.driver_name
FROM trips AS t
JOIN drivers AS d ON t.driver_id = d.driver_id
WHERE status !=  'Cancelled';

-- “Marketing wants to feature our biggest ride ever. Which rider took the most expensive trip of all?”
SELECT 
	MAX(t.fare) AS max,
    r.rider_name
FROM trips AS t
JOIN riders AS r ON t.rider_id = r.rider_id
GROUP BY r.rider_name
ORDER BY max DESC;

-- Q9
SELECT DISTINCT
    r.rider_id,
    r.rider_name
FROM riders r
JOIN trips t
    ON r.rider_id = t.rider_id
WHERE t.rating = 5.0;
