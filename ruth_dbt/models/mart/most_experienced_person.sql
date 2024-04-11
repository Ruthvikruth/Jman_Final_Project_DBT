{% set users = ref('stg_users') %}
{% set user_projects = ref('stg_user_projects') %}


-- INNER JOIN Users and User_projects table
WITH USERS_PROJECTS_JOIN AS (
    SELECT
        user_projects.USER_ID AS USER_ID,
        users.FULL_NAME as FULL_NAME,
        users.EMAIL as EMAIL,
        users.GENDER as GENDER,
        users.BIRTH_DATE as BIRTH_DATE,
        users.LOCATION as LOCATION,
        users.PHONE as PHONE,

        user_projects.PROJECT_ID as PROJECT_ID,
        user_projects.ROLE as PROJECT_ROLE,
        user_projects.SKILL as SKILL

        FROM
        users INNER JOIN user_projects
        ON users.user_id = user_projects.user_id
),

-- Number of projects each person has dealt with
COUNT_OF_PROJECTS_PER_USER AS (
    SELECT USER_ID, FULL_NAME, EMAIL, COUNT(PROJECT_ID) as PROJECT_COUNT FROM USERS_PROJECTS_JOIN
    GROUP BY (USER_ID, FULL_NAME, EMAIL) ORDER BY COUNT(PROJECT_ID) DESC
)

SELECT * FROM COUNT_OF_PROJECTS_PER_USER