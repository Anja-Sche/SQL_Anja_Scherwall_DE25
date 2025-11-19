/*  ===========================
0. Making a course database
=========================== */
--a)
SELECT
    content,
    content_type
FROM
    staging.course_structure
WHERE
    content_type = 'excercise';

--b)
FROM
    staging.course_structure
WHERE
    content_type = 'lecture';

--c)
SELECT
    *
FROM
    staging.course_structure
WHERE
    week = 48;

--d)
SELECT
    *
FROM
    staging.course_structure
WHERE
    week > 46
    and week < 50;
    
--eller
SELECT
    *
FROM
    staging.course_structure
WHERE
    week BETWEEN 47 AND 49;

--e)
SELECT
    COUNT(*)
FROM
    staging.course_structure
WHERE
    content_type = 'lecture';

--f)
SELECT
    COUNT(*)
FROM
    staging.course_structure
WHERE
    NOT content_type = 'lecture';

--g)
The unique content types are the once under content.
--h)
DELETE FROM staging.course_structure
WHERE
    content = '02_setup_duckdb';

INSERT INTO
    staging.course_structure (content, week, content_type)
VALUES
    ('02_setup_duckdb', 46, 'lecture');

--i)
SELECT
    *
FROM
    staging.course_structure
ORDER BY
    week ASC,
    content ASC;