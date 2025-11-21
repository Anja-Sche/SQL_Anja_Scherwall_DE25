-- a) Count number of Data engineers jobs.
SELECT
    *
FROM
    staging.clean_salaries
WHERE
    job_title = 'Data Engineer';

-- 3464

-- b) Count number of unique job titles in total.
SELECT
    COUNT(DISTINCT job_title)
FROM staging.clean_salaries;

SELECT
    DISTINCT job_title AS amount_job_titles
FROM staging.clean_salaries 
ORDER BY job_title ASC;
-- 155


-- c) Find out how many jobs that goes into each salary level.
SELECT * FROM staging.clean_salaries WHERE salary_level = 'low';
-- 4575 (<80000)

SELECT * FROM staging.clean_salaries WHERE salary_level = 'Medium';
-- 5438 (between 80000 and 119000)

SELECT * FROM staging.clean_salaries WHERE salary_level = 'high';
-- 4611 (between 120000 and 169000)

SELECT * FROM staging.clean_salaries WHERE salary_level = 'insanely high';
-- 1910 (170000 or more)


-- d) Find out the median and mean salaries for each seniority levels.
SELECT
    ROUND(MEDIAN(salary_monthly_sek)) AS median_salary_monthly_sek,
    ROUND(AVG(salary_monthly_sek)) AS mean_salary_monthly_sek
FROM 
    staging.clean_salaries
WHERE experience_level = 'Entry level';
-- ┌───────────────────────────┬─────────────────────────┐
-- │ median_salary_monthly_sek │ mean_salary_monthly_sek │
-- │          double           │         double          │
-- ├───────────────────────────┼─────────────────────────┤
-- │          62250.0          │         69246.0         │
-- └───────────────────────────┴─────────────────────────┘

SELECT
    ROUND(MEDIAN(salary_monthly_sek)) AS median_salary_monthly_sek,
    ROUND(AVG(salary_monthly_sek)) AS mean_salary_monthly_sek
FROM 
    staging.clean_salaries
WHERE experience_level = 'Mid level'
-- ┌───────────────────────────┬─────────────────────────┐
-- │ median_salary_monthly_sek │ mean_salary_monthly_sek │
-- │          double           │         double          │
-- ├───────────────────────────┼─────────────────────────┤
-- │          86250.0          │         94442.0         │
-- └───────────────────────────┴─────────────────────────┘

SELECT
    ROUND(MEDIAN(salary_monthly_sek)) AS median_salary_monthly_sek,
    ROUND(AVG(salary_monthly_sek)) AS mean_salary_monthly_sek
FROM 
    staging.clean_salaries
WHERE experience_level = 'Senior'
-- ┌───────────────────────────┬─────────────────────────┐
-- │ median_salary_monthly_sek │ mean_salary_monthly_sek │
-- │          double           │         double          │
-- ├───────────────────────────┼─────────────────────────┤
-- │         116250.0          │        122747.0         │
-- └───────────────────────────┴─────────────────────────┘

SELECT
    ROUND(MEDIAN(salary_monthly_sek)) AS median_salary_monthly_sek,
    ROUND(AVG(salary_monthly_sek)) AS mean_salary_monthly_sek
FROM 
    staging.clean_salaries
WHERE experience_level = 'Expert'
-- ┌───────────────────────────┬─────────────────────────┐
-- │ median_salary_monthly_sek │ mean_salary_monthly_sek │
-- │          double           │         double          │
-- ├───────────────────────────┼─────────────────────────┤
-- │         144000.0          │        146448.0         │
-- └───────────────────────────┴─────────────────────────┘


-- e) Find out the top earning job titles based on their median salaries and how much they earn.
SELECT
  job_title,
    ROUND(MEDIAN(salary_monthly_sek)) AS median_salary_monthly_sek,
    ROUND(MAX(salary_monthly_sek)) AS max_salary_monthly_sek
FROM 
    staging.clean_salaries
GROUP BY job_title
ORDER BY median_salary_monthly_sek DESC
LImit 5;
-- │           job_title            │ median_salary_monthly_sek │ max_salary_monthly_sek │
-- │            varchar             │          double           │         int32          │
-- ├────────────────────────────────┼───────────────────────────┼────────────────────────┤
-- │ Analytics Engineering Manager  │                  299910.0 │                 299910 │
-- │ Data Science Tech Lead         │                  281250.0 │                 281250 │
-- │ Head of Machine Learning       │                  247500.0 │                 336000 │
-- │ Managing Director Data Science │                  210000.0 │                 225000 │
-- │ AWS Data Architect             │                  193500.0 │                 193500 │
-- └────────────────────────────────┴───────────────────────────┴────────────────────────┘


--  f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.
SELECT COUNT(*) AS full_remote
FROM 
    staging.clean_salaries
WHERE remote_ratio = 100; -- remote_ratio = 50 and remote_ratio = 0
-- ┌─────────────┐
-- │ full_remote │
-- │    int64    │
-- ├─────────────┤
-- │    5167     │
-- └─────────────┘

-- ┌──────────────────────┐
-- │ fifty_procent_remote │
-- │        int64         │
-- ├──────────────────────┤
-- │         249          │
-- └──────────────────────┘

-- ┌────────────┐
-- │ not_remote │
-- │   int64    │
-- ├────────────┤
-- │   11118    │
-- └────────────┘


--   g) Pick out a job title of interest and figure out if company size affects the salary. 
-- Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.
--Data Engineer
SELECT
    job_title,
    company_size,
    salary_monthly_sek
FROM 
    staging.clean_salaries
WHERE
    job_title = 'Data Engineer'
ORDER BY 
    salary_monthly_sek; 

/*It seems like there is a higher chans to get higher salary if you are working at a 
large or medium company. There are not that many small companies so it is hard to compare. There are some large companies at tha botom as well.
There are mostly large companies at the top*/