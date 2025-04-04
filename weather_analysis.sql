--Query to sort the weather data by the hottest month of the year 

Select *
From `bigquery-public-data.noaa_gsod.gsod2020`
Order by mo DESC
AND temp 







-- Query to clean and retrieve weather data from the NOAA GSOD dataset

SELECT
  stn,  -- Weather station ID
  date, -- Date of observation
  IF(
     temp=9999.9,  -- Missing temperature values are marked as 9999.9
     NULL,
     temp) AS temperature,
  IF(
     wdsp="999.9",  -- Missing wind speed values are marked as "999.9"
     NULL,
     CAST(wdsp AS Float64)) AS wind_speed,
  IF(
     prcp=99.99,  -- Missing precipitation values are marked as 99.99
     0,
     prcp) AS precipitation
FROM
  `bigquery-public-data.noaa_gsod.gsod2020`
WHERE
  stn="725030" -- La Guardia Airport
  OR stn="744860" -- JFK Airport
ORDER BY
  date DESC,
  stn ASC;

## Weather Data Cleaning Query

This query extracts weather station data from the **NOAA GSOD 2020 dataset** in Google BigQuery.  
It cleans missing values by replacing placeholders with `NULL` or `0` where appropriate.

- **Dataset:** `bigquery-public-data.noaa_gsod.gsod2020`
- **Weather stations:** La Guardia (`725030`), JFK (`744860`)
- **Fixes applied:**
  - `9999.9` → `NULL` for missing temperatures
  - `"999.9"` → `NULL` for missing wind speeds (converted to Float64)
  - `99.99` → `0` for missing precipitation values
