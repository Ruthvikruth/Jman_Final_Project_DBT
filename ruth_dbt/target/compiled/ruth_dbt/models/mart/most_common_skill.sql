

WITH MOST_COMMON_SKILL AS (
    SELECT
        user_skills.SKILL as SKILL,
        COUNT(user_skills.SKILL) as "COMMON_SKILL_COUNT"

        from user_skills GROUP BY user_skills.SKILL ORDER BY COUNT(user_skills.SKILL)
)

SELECT * from MOST_COMMON_SKILL