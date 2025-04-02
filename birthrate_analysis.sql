-- Query: Retrieve birth data for selected counties in New York
-- Dataset: bigquery-public-data.sdoh_cdc_wonder_natality.county_natality
-- Description: This query fetches birth statistics for Erie, Niagara, and Chautauqua counties, ordered by the highest number of births.

SELECT *
FROM `bigquery-public-data.sdoh_cdc_wonder_natality.county_natality`
WHERE County_of_Residence IN ("Erie County, NY", "Niagara County, NY", "Chautauqua County, NY")
ORDER BY Births DESC;


