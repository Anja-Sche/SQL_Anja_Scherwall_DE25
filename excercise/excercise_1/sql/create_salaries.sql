CREATE TABLE
	IF NOT EXISTS staging.clean_salaries AS (
		SELECT
			experience_level,
			employment_type,
			job_title,
			salary_anual_sek AS salary_annual_sek,
			salary_monthly_sek,
			remote_ratio,
			company_size,
			salary_level
		FROM
			staging.data_job
	);