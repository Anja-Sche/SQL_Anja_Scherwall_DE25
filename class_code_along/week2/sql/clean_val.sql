-- Find rows that do not contain the title column value in the context column value.

SELECT
    title,
    instr(context, title) AS find_title,
    find_title != 0 AS not_title
FROM staging.squad
WHERE not_title;
--9953 context values does not contain the title value



-- Find rows that start with title column value in the context column value.

SELECT 
    title,
    context
FROM staging.squad
WHERE context LIKE title || '%';

-- if you use regular expression functions, underscore will be a literal character
SELECT *
FROM staging.squad
WHERE regexp_matches(context, CONCAT('^', title)); 
-- 641 rows in context column starts with the word in title column


-- Create a new column which is the first answer of the AI model. Do not use pattern matching in your query.

