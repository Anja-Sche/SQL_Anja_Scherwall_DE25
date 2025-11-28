SELECT * FROM staging.crm_old;
SELECT * FROM staging.crm_new;


/* ========
    Task 2
   ======== */
-- find invalid emails
-- use LIKE operator with wildcards for the old data

SELECT * FROM staging.crm_old
WHERE NOT email LIKE '%@%.%';

-- use REGEXP function for the new data
-- because the above query cannot deal with the new data

SELECT * FROM staging.crm_new
WHERE NOT regexp_matches(email, '[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+');

-- combine all three conditions

SELECT * FROM staging.crm_new
WHERE  
    NOT regexp_matches(email, '[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+') OR
    NOT region IN ('EU', 'US') OR
    NOT status IN ('active', 'inactive');

SELECT * FROM staging.crm_old
WHERE 
    NOT regexp_matches(email, '[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+') OR
    NOT region IN ('EU', 'US') OR
    NOT status IN ('active', 'inactive');


/* ========
    Task 3
   ======== */

CREATE TABLE IF NOT EXISTS constrained.crm_old_class(
    customer_id INTEGER UNIQUE,
    name VARCHAR NOT NULL,
    email VARCHAR CHECK (email LIKE '%@%.%'),
    region VARCHAR CHECK (region IN ('EU', 'US')),
    status VARCHAR CHECK (status IN ('active', 'inactive'))
);


CREATE TABLE IF NOT EXISTS constrained.crm_new_class(
    customer_id INTEGER UNIQUE,
    name VARCHAR NOT NULL,
    email VARCHAR CHECK (regexp_matches(email, '[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+')),
    region VARCHAR CHECK (region IN ('EU', 'US')),
    status VARCHAR CHECK (status IN ('active', 'inactive'))
);

INSERT INTO constrained.crm_old_class 
SELECT * 
FROM staging.crm_old
WHERE 
    regexp_matches(email, '[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+') AND
    region IN ('EU', 'US') AND
    status IN ('active', 'inactive');


INSERT INTO constrained.crm_new_class 
SELECT * 
FROM staging.crm_new
WHERE 
    regexp_matches(email, '[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+') AND
    region IN ('EU', 'US') AND
    status IN ('active', 'inactive');



/* ========
    Task 4
   ======== */

-- how many customers are only in the old crm system
SELECT customer_id
FROM staging.crm_old
EXCEPT 
SELECT customer_id
FROM staging.crm_new;

-- how many customers are only in the new crm system
SELECT customer_id
FROM staging.crm_new
EXCEPT 
SELECT customer_id
FROM staging.crm_old;

-- common customers in both old and new
SELECT customer_id
FROM staging.crm_new
INTERSECT 
SELECT customer_id
FROM staging.crm_old;



/* ========
    Task 5
   ======== */



