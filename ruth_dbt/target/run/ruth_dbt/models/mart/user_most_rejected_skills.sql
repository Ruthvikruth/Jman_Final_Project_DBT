
  
    

        create or replace transient table JMAN_FINAL_PROJECT.PUBLIC_mart.user_most_rejected_skills
         as
        (


-- INNER Join Users and User_skills table

WITH USER_SKILL_JOIN AS (
    SELECT
        user_skills.USER_ID as USER_ID,
        user_skills.SKILL as SKILL,
        user_skills.PROFICIENCY_LEVEL as PROFICIENCY_LEVEL,
        user_skills.STATUS as STATUS,

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
        WHERE user_skills.STATUS = 'Rejected'
),

-- Calculating the person with most rejected skills
PERSON_MOST_REJECTED_SKILL_COUNT AS (
        SELECT
        USER_SKILL_JOIN.USER_ID as USER_ID,
        USER_SKILL_JOIN.FULL_NAME as FULL_NAME,
        USER_SKILL_JOIN.EMAIL as EMAIL,
        COUNT(USER_SKILL_JOIN.SKILL) as REJECTED_SKILL_COUNT

    from USER_SKILL_JOIN
    GROUP BY (USER_SKILL_JOIN.USER_ID, USER_SKILL_JOIN.FULL_NAME, USER_SKILL_JOIN.EMAIL) ORDER BY COUNT(USER_SKILL_JOIN.SKILL) DESC
)

SELECT * FROM PERSON_MOST_REJECTED_SKILL_COUNT
        );
      
  