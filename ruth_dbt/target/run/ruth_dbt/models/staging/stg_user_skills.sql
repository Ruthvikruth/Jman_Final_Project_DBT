
  create or replace   view JMAN_FINAL_PROJECT.PUBLIC_staging.stg_user_skills
  
   as (
    


WITH user_skills AS (
    SELECT
	USER_ID,
	SKILL,
	CERTIFICATION_NAME,
	OBTAINED_DATE,
	EXPIRY_DATE,
	STATUS,
	PROFICIENCY_LEVEL,
	CERTIFICATION_ID,
	ISSUED_BY

    FROM JMAN_FINAL_PROJECT.PUBLIC.user_skills
)

SELECT * FROM user_skills
  );

