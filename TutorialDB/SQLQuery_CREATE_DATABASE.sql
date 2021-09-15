USE master
GO
-- Create a new db if it doesn't exist
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   -- N'' is for Unicode, needed in case the DB stores multilingual data
   WHERE name = N'TutorialDB'
)
CREATE DATABASE [TutorialDB]
GO
