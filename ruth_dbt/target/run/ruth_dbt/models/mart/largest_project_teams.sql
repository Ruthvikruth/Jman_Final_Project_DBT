
  
    

        create or replace transient table JMAN_FINAL_PROJECT.PUBLIC_mart.largest_project_teams
         as
        (


-- Largest team projects each person has dealt with
WITH COUNT_OF_PROJECTS_PER_USER AS (
    SELECT PROJECT_ID, COUNT(USER_ID) as TEAM_SIZE FROM user_projects GROUP BY PROJECT_ID HAVING PROJECT_ID IS NOT NULL ORDER BY PROJECT_ID
),

-- Project Details for the projects
PROJECTS_DETAILS_JOIN_TEAM_SIZE AS (
    SELECT
        COUNT_OF_PROJECTS_PER_USER.PROJECT_ID as PROJECT_ID,
        COUNT_OF_PROJECTS_PER_USER.TEAM_SIZE as TEAM_SIZE,

        projects.PROJECT_NAME as PROJECT_NAME,
        projects.START_DATE as START_DATE,
        CASE
            WHEN projects.END_DATE IS NULL THEN 'Ongoing'
            ELSE projects.END_DATE
        END as END_DATE,
        projects.CLIENT as CLIENT,
        projects.BUDGET_USD as BUDGET

        from COUNT_OF_PROJECTS_PER_USER INNER JOIN PROJECTS
        on COUNT_OF_PROJECTS_PER_USER.PROJECT_ID = PROJECTS.PROJECT_ID
)

SELECT * FROM PROJECTS_DETAILS_JOIN_TEAM_SIZE
        );
      
  