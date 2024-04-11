{% set users = ref('stg_users') %}
{% set user_skills = ref('stg_user_skills') %}

-- Joining users and user_skills table and filtering out the skills which are approved
WITH USER_SKILL_JOIN AS (
    SELECT
        user_skills.SKILL as SKILL,
        user_skills.USER_ID as USER_ID,

        users.FULL_NAME as FULL_NAME,
        users.EMAIL as EMAIL,
        users.GENDER as GENDER,
        users.ROLE as ROLE,
        users.BIRTH_DATE as BIRTH_DATE,
        users.LOCATION as LOCATION,
        users.PHONE as PHONE

    FROM
        users INNER JOIN user_skills
        ON users.user_id = user_skills.user_id
        WHERE user_skills.STATUS = 'Approved'

),

-- Grouping users based on user_id and finding the people with most number of skills
MOST_SKILLED_PERSON AS (
    SELECT
        USER_SKILL_JOIN.USER_ID as USER_ID,
        USER_SKILL_JOIN.FULL_NAME as FULL_NAME,
        USER_SKILL_JOIN.EMAIL as EMAIL,
        COUNT(USER_SKILL_JOIN.SKILL)

    from USER_SKILL_JOIN
    GROUP BY (USER_SKILL_JOIN.USER_ID, USER_SKILL_JOIN.FULL_NAME, USER_SKILL_JOIN.EMAIL) ORDER BY COUNT(USER_SKILL_JOIN.SKILL) DESC
)

SELECT * FROM MOST_SKILLED_PERSON