-- do select first to see that we get as we want
-- change the experience_level labels
SELECT
    CASE
        WHEN experience_level = 'SE' THEN 'Senior level'
        WHEN experience_level = 'EN' THEN 'Entry level'
        WHEN experience_level = 'MI' THEN 'Mid level'
        WHEN experience_level = 'EX' THEN 'Expert level'
    END AS experience_level,
    * EXCLUDE (experience_level)
FROM
    data_jobs;

-- to persist changes
UPDATE data_jobs
SET
    EXPERIENCE_LEVEL = CASE
        WHEN experience_level = 'SE' THEN 'Senior level'
        WHEN experience_level = 'EN' THEN 'Entry level'
        WHEN experience_level = 'MI' THEN 'Mid level'
        WHEN experience_level = 'EX' THEN 'Expert level'
    END;

SELECT DISTINCT
    experience_level
FROM
    data_jobs;