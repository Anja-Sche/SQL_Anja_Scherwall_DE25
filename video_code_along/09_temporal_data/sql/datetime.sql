DESC staging.sweden_holidays;

FROM
    staging.sweden_holidays
LIMIT
    5;

-- addition and subtraction
SELECT
    date,
    date + interval 5 day AS plus_5_days,
    typeof (plus_5_days) AS plus_5_days_type,
    date - interval 5 day AS minus_5_days
FROM
    staging.sweden_holidays;

-- DATE functions
SELECT
    today ();

SELECT
    today () AS today,
    date - today AS time_after_holiday,
    *
FROM
    staging.sweden_holidays;

--pick out weekday
SELECT
    date,
    dayname (date) AS weekday
FROM
    staging.sweden_holidays;

--latest from two dates
SELECT
    *,
    today () AS today,
    greatest (date, today) AS later_day
FROM
    staging.sweden_holidays;

-- convert date to string
SELECT
    date,
    strftime(date, '%d/%m/%Y') AS date_string -- big Y to get 4 digits on year
FROM
    staging.sweden_holidays;

-- convert string to date

SELECT
    date,
    strftime(date, '%d/%m/%Y') AS date_string,
    strptime(date_string, '%d/%m/%Y'):: DATE AS new_date, --type convert with ::
    typeof(new_date)  
FROM
    staging.sweden_holidays;