WITH manager
     AS (
        /* Create anchor query */
        SELECT EMPLOYEEKEY
               , FIRSTNAME                  AS EmployeeFirstName
               , LASTNAME                   AS EmployeeLastName
               , [TITLE]                    AS EmployeeTitle
               , PARENTEMPLOYEEKEY
               , Cast(NULL AS NVARCHAR(50)) AS ManagerFirstName
               , Cast(NULL AS NVARCHAR(50)) AS ManagerLastName
               , Cast(NULL AS NVARCHAR(50)) AS ManagerTitle
               , 1                          AS ManagerLevel
        FROM   [dbo].[DIMEMPLOYEE]
        WHERE  PARENTEMPLOYEEKEY IS NULL --most senior manager will not have a line manager
         /* Create the recursive member that will reference the anchor query. 
		 This will get executed for every level in the hierarchy i.e. until no more rows are returned */
         UNION ALL
         SELECT e.EMPLOYEEKEY
                , e.FIRSTNAME
                , e.LASTNAME
                , e.TITLE
                , e.PARENTEMPLOYEEKEY
                , m.EMPLOYEEFIRSTNAME
                , m.EMPLOYEELASTNAME
                , m.EMPLOYEETITLE
                , M.MANAGERLEVEL + 1 --this will give the manager level
         FROM   [dbo].[DIMEMPLOYEE] e
                JOIN manager M
                  ON m.EMPLOYEEKEY = e.PARENTEMPLOYEEKEY --refer once to anchor query
        )
SELECT *
FROM   manager
ORDER  BY MANAGERLEVEL 