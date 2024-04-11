{{
    config(
        tags=['basic', 'staging']
    )
}}


WITH users AS (
    SELECT
        USER_ID,
        FULL_NAME,
        EMAIL,
        GENDER,
        ROLE,
        BIRTH_DATE,
        LOCATION,
        PHONE
    FROM {{ source('jman', 'users') }}
)

SELECT * FROM users