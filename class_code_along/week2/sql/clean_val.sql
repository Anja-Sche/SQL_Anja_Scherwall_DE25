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



-- show a new column which is the first answer from the AI model
-- without pattern matching
SELECT 
 answers[18:], -- slicing
 answers[18], -- indexing
 CASE 
  WHEN answers[18] = ',' THEN NULL
  ELSE answers[18:]
 END AS striped_answers,
 INSTR(striped_answers, '''') AS first_quotation_index, -- a single quoation needs to be typed as '',
 striped_answers[:first_quotation_index-1] AS first_answers,
 answers
FROM staging.squad;


-- the samt thing but in 1 line


-- generate the same results from task 4, but with pattern matching
SELECT
    answers,
    regexp_extract(answers, '''([^'']+)''') AS first_answer, 
FROM staging.squad;


-- generate the same results from task 4, but with pattern matching
SELECT
    answers,
    -- capture the outer pattern first, and stop when detecting a character not specified in the pattern
    -- extract the first group in (), not everything in ''
    -- the pattern: ' multiple characters not ' up to ' or ', 
    regexp_extract(answers, '''([^'']+)''') AS first_answer,
    regexp_extract(answers, '''([^'']+)'',') AS first_answer,
    regexp_extract(answers, '''([A-Za-z0-9 ,]+)'',') AS first_answer, -- uppercase, lowercase, digits, space, comma
    regexp_extract(answers, '''([^'']+)''', 1) AS first_answer,
    regexp_extract(answers, '''([^'']+)'',', 1) AS first_answer,
FROM staging.squad;