USE Interview;
GO

IF OBJECT_ID(N'dbo.EMPLOYEE', N'U') IS NOT NULL  --Drop and create in case you want to run it individually
   DROP TABLE [dbo].[EMPLOYEE];

	CREATE TABLE EMPLOYEE (
		ID_EMPLOYEE INT,
		[NAME] VARCHAR(25),
		LASTNAME VARCHAR(25),
		SSN VARCHAR(25),
		ID_DEPARTMENT TINYINT,
		ID_SUPERVISOR INT,
		DATEOFJOINING SMALLDATETIME,
		ISACTIVE BIT
	)

IF OBJECT_ID(N'dbo.DEPARTMENT', N'U') IS NOT NULL  --Drop and create in case you want to run it individually
   DROP TABLE [dbo].[DEPARTMENT];

	CREATE TABLE DEPARTMENT (
		ID_DEPARTMENT TINYINT,
		[DESCRIPTION] VARCHAR(25)
	)
IF OBJECT_ID(N'dbo.EMPLOYEE_SALARIES', N'U') IS NOT NULL  --Drop and create in case you want to run it individually
   DROP TABLE [dbo].[EMPLOYEE_SALARIES];

	CREATE TABLE EMPLOYEE_SALARIES (
		ID_EMPLOYEE INT,
		SALARY INT,
		STARTDATE SMALLDATETIME
	)

IF OBJECT_ID(N'dbo.DUPLICATES', N'U') IS NOT NULL  --Drop and create in case you want to run it individually
   DROP TABLE [dbo].[DUPLICATES];

	CREATE TABLE DUPLICATES(
		ID INT,
		[NAME] VARCHAR(25) 
	)

