{{
    config(
        tags=['basic', 'staging']
    )
}}


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

    FROM {{ source('jman', 'user_skills') }}
)

SELECT * FROM user_skills