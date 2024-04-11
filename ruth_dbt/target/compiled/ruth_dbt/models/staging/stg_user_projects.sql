


WITH user_projects AS (
    SELECT

    USER_ID,
	PROJECT_ID,
	ROLE,
	SKILL
    FROM JMAN_FINAL_PROJECT.PUBLIC.user_projects
)

SELECT * FROM user_projects