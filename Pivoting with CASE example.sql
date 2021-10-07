SELECT cl.SUBJECT      AS Code
       , sb.NAME         AS Subject
       , cl.CLASS         AS Class
       --, s.COURSE       AS Course -- For the case of separating classes by student's course
	   , Sum(CASE WHEN he.SITUATION_HIST = 'Pass' THEN 1 ELSE 0 END) AS Pass
	   , Sum(CASE WHEN he.SITUATION_HIST = 'Failed Grade' THEN 1 ELSE 0 END) AS FailedGrade
	   , Sum(CASE WHEN he.SITUATION_HIST = 'Failed Freq' THEN 1 ELSE 0 END) AS FailedFreq
	   , Sum(CASE WHEN he.SITUATION_HIST = 'Locked' THEN 1 ELSE 0 END) AS Locked
	   , Sum(CASE WHEN he.SITUATION_HIST = 'Canceled' THEN 1 ELSE 0 END) AS Canceled
       , Count(hm.STUDENT) AS Total
FROM   CLASS cl
       INNER JOIN HISTENROLLMENT he
               ON cl.YEAR = he.YEAR
                  AND cl.SEMESTER = he.SEMESTER
                  AND cl.SUBJECT = he.SUBJECT
                  AND cl.CLASS = he.CLASS
       INNER JOIN STUDENT s
               ON he.STUDENT = s.STUDENT
       INNER JOIN SUBJECT  sb
               ON he.SUBJECT = sb.SUBJECT
WHERE  he.YEAR = @p_year
       AND he.SEMESTER = @p_semester
       -- Returns only the subjects of the courses in parentheses
       -- Being able to have students from other courses in these subjects
       AND cl.COURSE  IN ( @p_course1, @p_course2, @p_course3 )
       -- Solves students from other courses
       AND s.COURSE  IN ( @p_course1, @p_course2, @p_course3 )
GROUP  BY cl.CLASS
          , cl.SUBJECT
          , sb.NAME
          --, s.COURSE 