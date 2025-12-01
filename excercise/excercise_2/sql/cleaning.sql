-- sql_word
SELECT
  sql_word,
  upper(trim(sql_word)) AS cleaned_word
FROM staging.sql_glossary;


-- description
SELECT
    description,
    trim(regexp_replace(description, ' +', ' ', 'g')) AS cleaned_description
FROM staging.sql_glossary;


-- example
SELECT
    example,
    lower(trim(regexp_replace(cleaned_example, ' +', ' ', 'g'))) AS cleaned_example
FROM staging.sql_glossary;


