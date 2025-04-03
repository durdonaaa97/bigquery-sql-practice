-- Query: Analyze the most popular Citibike trips in NYC
-- Dataset: bigquery-public-data.new_york_citibike.citibike_trips
-- Description: This query retrieves the top 10 most frequent Citibike trips,
-- grouped by user type and station pairs, and calculates the average trip duration.
SELECT 
    usertype,  -- Type of user (Subscriber or Customer)
    CONCAT(start_station_name, " to ", end_station_name) AS route,  -- Trip route
    COUNT(*) AS num_trips,  -- to count Number of trips for each route
    ROUND(AVG(CAST(tripduration AS INT64) / 60), 2) AS avg_duration_minutes  -- Average trip duration in minutes (BigQuery stores numbers in a 64-bit memory system, which is why there's a 64 after integer in this case.)
FROM 
    `bigquery-public-data.new_york_citibike.citibike_trips`
GROUP BY 
    start_station_name, 
    end_station_name, 
    usertype
ORDER BY 
    num_trips DESC
LIMIT 10;
