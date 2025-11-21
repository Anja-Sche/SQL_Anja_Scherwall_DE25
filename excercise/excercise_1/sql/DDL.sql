ALTER TABLE staging.data_job
ADD COLUMN salary_anual_sek INTEGER DEFAULT 0;

ALTER TABLE staging.data_job
ADD COLUMN salary_monthly_sek INTEGER DEFAULT 0;

ALTER TABLE staging.data_job
ADD COLUMN salary_level VARCHAR DEFAULT;


