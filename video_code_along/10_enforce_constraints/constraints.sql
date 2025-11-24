CREATE TABLE
    IF NOT EXISTS students (name VARCHAR NOT NULL, age UINT8);

-- INSERT INTO
--     students (name, age)
-- VALUES
--     (NULL, 8),
--     ('Amy', 5);
-- DROP TABLE students;
-- CREATE TABLE students ( 
--     name VARCHAR UNIQUE, age UINT8);
-- INSERT INTO students (name, age)
-- VALUES  
--     ('Amy', 13),
--     ('Bill', 5);
-- INSERT INTO students (name, age)
-- VALUES  
--     ('Bill', 5);
-- DROP TABLE students;
-- CREATE TABLE students (
--     name VARCHAR UNIQUE,
--     age UINT8 CHECK (age >= 18)
-- );
-- INSERT INTO students (name, age)
-- VALUES  
--     ('Bill', 17);


-- DROP TABLE students;

-- CREATE TABLE
--     students (
--         name VARCHAR UNIQUE,
--         school_year INTEGER DEFAULT 2025
--     );

-- INSERT INTO students (name)
-- VALUES ('Amy'), ('Bill');


-- FROM
--     students;


-- DROP TABLE students;

-- CREATE TABLE
--     students (
--         name VARCHAR,
--         age INTEGER
--     );

-- INSERT INTO students (name)
-- VALUES ('Amy'), ('Bill');


-- FROM
--     students;


DROP TABLE students;

CREATE TABLE
    students (
        name VARCHAR UNIQUE,
        age INTEGER
    );

ALTER TABLE students
ALTER COLUMN age SET DEFAULT 10;  --you can do DROP DEFAULT to take away default value

INSERT INTO students(name)
VALUES ('Bill');


FROM
    students;