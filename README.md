Functions:
- Store all functions from the db
- DropFunctionIfExists.sql will always be called at the beginning of the function


Jobs:
- Store all sql jobs from the db


Run-once scripts:
- Store setup scripts
- Store useful debugging scripts


Schema And Data:
- Store change scripts for modification of schema and data
- Naming Convension:
    - [Release version]_[Task Code]-[Execution Sequency]_[Change Type]_[Short Summary]
    - If one task require two type of changes (schema and data), schema changes will always come first, please including execution sequency
    - For example: 
        - 1.25.0_TASK-1000-001_Schema_Create new table MemberStatus.sql
        - 1.25.0_TASK-1000-002_Data_Adding member status data to MemberStatus.sql


Stored Procedures:
- Store all stored procedures 
- CreateIfNotExists.sql will always be run at the beginning of the script
- Then alter procedure if exists


Triggers:
- Store all triggers from the db


Packages:
- Once 01_PackagingScripts.bat is run, deployment package will be added here
- This can be used for automation purpose in the future


Deploy to Production:
- Use DBForge compare to verify the change sync from other (or temp product copy db) environment
- If using temp production copy db, the temp db needs to be refreshed on a regular basis or refreshed before deployment
