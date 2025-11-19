-- LIKE operator in WHERE clause -> filter rows
-- LIKE operator with wildcards to search for a pattern

SELECT
    example,
    lower(trim(example)) AS cleaned_example
FROM staging.sql_glossary;


-- search for select
SELECT
    example,
    lower(trim(example)) AS cleaned_example
FROM staging.sql_glossary
WHERE cleaned_example LIKE '%select%'; -- wildcard % matches 0 or more characters
-- ILIKE for inseceble case??


-- wildcard _ reprecents 1 character
SELECT
    example,
    trim(example) AS cleaned_example
FROM staging.sql_glossary
WHERE cleaned_example LIKE 'S_LECT%';



-- regular expression
SELECT 
    lower(trim(description)) AS cleaned_description
FROM 
    staging.sql_glossary
WHERE 
    regexp_matches(cleaned_description, '^c'); -- filter rows starting with c


-- regular expression
SELECT 
    trim(description) AS cleaned_description
FROM 
    staging.sql_glossary
WHERE 
    regexp_matches(cleaned_description, '^[CS]'); -- filter rows starting with C or S


-- \b makes it match exactly select word (e.g. doesn't match selects)
SELECT 
    lower(description) AS cleaned_description
FROM 
    staging.sql_glossary
WHERE 
    regexp_matches(cleaned_description, 'select\b');



-- [a-f] matches range of characters
-- ^[a-f] matches starting with characters a to f
SELECT 
    lower(trim(description)) AS cleaned_description
FROM 
    staging.sql_glossary
WHERE 
    regexp_matches(cleaned_description, '^[a-f]');


-- [^a-f] matches any character not in range of a to f
-- ^[^a-f] starting with characters not in range a to f
SELECT 
    lower(trim(description)) AS cleaned_description
FROM 
    staging.sql_glossary
WHERE 
    regexp_matches(cleaned_description, '^[^a-f]');


-- 
SELECT  
    description,
    regexp_replace(description, ' +', ' ') AS cleaned_description -- will only work on first occurance
FROM 
    staging.sql_glossary;


SELECT  
    description,
    regexp_replace(trim(description), ' +', ' ', 'g') AS cleaned_description --'g' makes it wor global
FROM 
    staging.sql_glossary;