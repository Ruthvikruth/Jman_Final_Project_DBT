


WITH projects AS (
    SELECT
        PROJECT_NAME,
        PROJECT_ID,
        DESCRIPTION,
        START_DATE ,
        PROJECT_STATUS,
        END_DATE,
        CLIENT,
        BUDGET_USD,
        PRIORITY,
        PROJECT_CATEGORY,
        TEAM_LEAD,
        LOCATION
    FROM JMAN_FINAL_PROJECT.PUBLIC.projects
)

SELECT * FROM projects