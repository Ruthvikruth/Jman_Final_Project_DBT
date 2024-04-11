
  create or replace   view JMAN_FINAL_PROJECT.PUBLIC_staging.stg_user_projects
  
   as (
    


WITH user_projects AS (
    SELECT

    USER_ID,
	PROJECT_ID,
	ROLE,
	SKILL
    FROM JMAN_FINAL_PROJECT.PUBLIC.user_projects
)

SELECT * FROM user_projects
  );

