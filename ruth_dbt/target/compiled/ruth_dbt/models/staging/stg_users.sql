


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
    FROM JMAN_FINAL_PROJECT.PUBLIC.users
)

SELECT * FROM users