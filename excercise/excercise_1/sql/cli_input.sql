SELECT COUNT(*) AS fifty_procent_remote
FROM 
    staging.clean_salaries
WHERE remote_ratio = 50;
