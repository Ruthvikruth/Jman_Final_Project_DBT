{{
    config(
        tags=['basic', 'staging']
    )
}}


WITH user_projects AS (
    SELECT

    USER_ID,
	PROJECT_ID,
	ROLE,
	SKILL
    FROM {{ source('jman', 'user_projects') }}
)

SELECT * FROM user_projects