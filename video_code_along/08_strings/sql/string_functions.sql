-- remove leading and trailing spaces
SELECT
    trim(sql_word, ' ') AS trimmed_word
FROM
    staging.sql_glossary;


SELECT
    trim(sql_word, ' ') AS trimmed_word,
    trimmed_word[1] AS first_character,
    trimmed_word[-1] AS last_character
FROM
    staging.sql_glossary;


-- transfrom character to upprecase
SELECT
    upper(trim(sql_word, ' ')) AS sql_term,
    sql_term[1] AS first_character,
    sql_term[-1] AS last_character
FROM
    staging.sql_glossary;


-- replace 2 or more spaces with one space
SELECT 
    description,
    replace(description, '  ', ' ') AS cleaned_description
FROM staging.sql_glossary;

--concatenate strings with vertical bars
SELECT
    concat(upper(trim(sql_word, ' ')), ' command') AS sql_command,
    upper(trim(sql_word, ' ')) || ' command' AS sql_command_1,
FROM
    staging.sql_glossary;


-- extract substrings
SELECT
    trim(sql_word) AS trimmed_word,
FROM
    staging.sql_glossary;

SELECT
    trim(sql_word) AS trimmed_word,
    substring(trim(sql_word),1,5) AS first_five_chars,
    trimmed_word[1:5] AS sliced_five_chars,
FROM
    staging.sql_glossary;


-- reverse characters
SELECT
    reverse(trim(sql_word)) AS reversed_word,
FROM
    staging.sql_glossary;



-- find position of first occurence of a substring
-- return 0 if substring is not found
SELECT
    description,
    instr(description, 'select') AS select_position,
    select_position != 0 AS about_select  -- to see if select is inside of description
FROM
    staging.sql_glossary;


SELECT 'fun' || ' joke' AS concatenated_string;