--Subquery inside Select
--To compare the number of bikes available at a particular station to the overall average number of bikes available at all stations:

Select 
station_id, 
num_bikes_available,
(Select 
AVG(num_bikes_available)   --average of all bikes available in all stations
from  bigquery-public-data.new_york.citibike_stations) as avrg_bikes_available
from bigquery-public-data.new_york.citibike_stations



--Subquery inside Where 
SELECT 
station_id,
name

FROM bigquery-public-data.new_york.citibike_stations 

WHERE
station_id IN
	(
		SELECT
			CAST(start_station_id AS STRING) AS start_station_id_str #**
		FROM
	    	bigquery-public-data.new_york.citibike_trips
	  	WHERE
			usertype = 'Subscriber'
  	);
