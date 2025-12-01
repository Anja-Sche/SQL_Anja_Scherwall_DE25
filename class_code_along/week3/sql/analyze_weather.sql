/* ==========
     Task 2
   ==========*/

-- find the data types of columns
DESC staging.weather;


DESC 
SELECT
  sunriseTime,
  sunsetTime,
  temperatureHighTime,
  temperatureLowTime,
  windGustTime,
  precipIntensityMaxTime
FROM
  staging.weather;


-- show the UNIX values of these columns
-- the values are the number of seconds counted from a reference time point (1970-01-01 00:00:00)
SELECT
  sunriseTime,
  sunsetTime,
  temperatureHighTime,
  temperatureLowTime,
  windGustTime,
  precipIntensityMaxTime
FROM
  staging.weather;


/* ========
    Task 3 
   ======== */

SELECT * FROM staging.weather;

-- each row in the dataset contains weather data for each combination of country/region, province/state and date(time column)
-- it's important to understand which columns can be used to uniquely identify each row
-- use aggregation function together with group by

SELECT 
  "Country/Region" AS Country,
  "Province/State" AS State,
  COUNT (*) AS Nr_Records,
FROM 
  staging.weather
GROUP BY 
  "Country/Region", 
  "Province/State"
ORDER BY 
  "Country/Region", 
  "Province/State";



  
/* ========
    Task 4 
   ======== */

-- 

SELECT
  to_timestamp(sunriseTime) AS sunrise, -- this transform numeric columns to timestamp
  to_timestamp(sunriseTime) AT TIME ZONE 'Europe/Stockholm' AS sunrise_swetime,
  to_timestamp(sunsetTime) AS sunset,
  to_timestamp(sunsetTime) AT TIME ZONE 'Europe/Stockholm' AS sunset_swetime,
FROM staging.weather
WHERE "Country/Region" = 'Sweden'; -- note the use of single and double quotation



/* ========
    Task 5 
   ======== */

-- the new year and month columns involves subtracting a part of timestamp
-- to pick up the date with the largest gap within a month involves the use of aggregation function
-- the gaps can be calculated directly with UNIX time

SELECT
  date_part('year', to_timestamp(sunriseTime)) AS year,
  date_part('month', to_timestamp(sunriseTime)) AS month,

  ROUND(MAX(sunsetTime - sunriseTime)/3600) AS gap_hours --divide by 3600 to get the gap in hours
FROM staging.weather
WHERE "Country/Region" = 'Sweden'
GROUP BY year, month, 
ORDER BY year, month ASC; -- note the use of single and double quotation


/* ========
    Task 6 
   ======== */

-- concatenate integer and string 
SELECT 
  to_timestamp(windGustTime) AT TIME ZONE 'Europe/Stockholm' AS most_windy_timestamp,
  date_part('hour', most_windy_timestamp) AS most_windy_hour,
  CONCAT('IT´s dangerous to use the crane at kl.', most_windy_hour)
FROM staging.weather
WHERE "Country/Region" = 'Sweden';

-- concatenate string and string
SELECT 
  to_timestamp(windGustTime) AT TIME ZONE 'Europe/Stockholm' AS most_windy_timestamp,
  -- strftime(), string format time, transforms timestamp to string
  -- use the format, like '%H', to design the presentation
  -- strptime(), string parse time, transform string to timestamp 
  strftime(most_windy_timestamp, '%H') AS most_windy_hour,
  CONCAT('IT´s dangerous to use the crane at kl.', most_windy_hour)
FROM staging.weather
WHERE "Country/Region" = 'Sweden';