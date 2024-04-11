
  
    

        create or replace transient table JMAN_FINAL_PROJECT.PUBLIC_mart.user_skill_proficiency
         as
        (


-- INNER Join Users and User_skills table
WITH USER_SKILL_JOIN AS (
    SELECT
        user_skills.USER_ID as USER_ID,
        user_skills.SKILL as SKILL,
        user_skills.PROFICIENCY_LEVEL as PROFICIENCY_LEVEL,

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

-- Finding Average Proficiency Levels of User's skills
AVERAGE_PROFICIENCY_LEVEL AS (
    SELECT
        USER_SKILL_JOIN.USER_ID as USER_ID,
        USER_SKILL_JOIN.FULL_NAME as FULL_NAME,
        USER_SKILL_JOIN.EMAIL as EMAIL,
        AVG(USER_SKILL_JOIN.PROFICIENCY_LEVEL) as AVERAGE_PROFICIENCY

    from USER_SKILL_JOIN
    GROUP BY (USER_SKILL_JOIN.USER_ID, USER_SKILL_JOIN.FULL_NAME, USER_SKILL_JOIN.EMAIL) ORDER BY AVG(USER_SKILL_JOIN.PROFICIENCY_LEVEL) DESC
)

SELECT * from AVERAGE_PROFICIENCY_LEVEL
        );
      
  