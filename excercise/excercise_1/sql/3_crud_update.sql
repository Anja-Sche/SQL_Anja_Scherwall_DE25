UPDATE
    staging.data_job
SET
   employment_type = CASE 
        WHEN employment_type = 'CT' THEN 'Contract'
        WHEN employment_type = 'FL' THEN 'Freelance'
        WHEN employment_type = 'PT' THEN 'Part time'
        WHEN employment_type = 'FT' THEN 'Full time'
    END;

-- change comapny size from one letter to full meaning

UPDATE 
    staging.data_job
SET
    company_size = CASE 
        WHEN company_size = 'L' THEN 'Large'
        WHEN company_size = 'M' THEN 'Medium'
        WHEN company_size = 'S' THEN 'Small'
    END;

-- change salary usd to sek

UPDATE staging.data_job
SET salary_anual_sek = ROUND(salary_in_usd*9,56);

UPDATE staging.data_job
SET salary_monthly_sek = ROUND(salary_anual_sek/12);

-- set salary level

UPDATE  
    staging.data_job
SET salary_level = 'low'
WHERE 
    salary_monthly_sek < 80000;

UPDATE  
    staging.data_job
SET salary_level = 'Medium'
WHERE 
    salary_monthly_sek >= 80000 AND salary_monthly_sek < 120000;

UPDATE  
    staging.data_job
SET salary_level = 'high'
WHERE 
    salary_monthly_sek >= 120000 AND salary_monthly_sek < 170000;

UPDATE  
    staging.data_job
SET salary_level = 'insanely high'
WHERE 
    salary_monthly_sek >= 170000;


--change experience level to full meaning

UPDATE
    staging.cleaned_salaries
SET 
    experience_level = CASE
        WHEN experience_level = 'SE' THEN 'Senior'
        WHEN experience_level = 'EX' THEN 'Expert'
        WHEN experience_level = 'MI' THEN 'Mid level'
        WHEN experience_level = 'EN' THEN 'Entry level'
    END;