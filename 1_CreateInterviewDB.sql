USE master;
ALTER DATABASE Interview SET single_user WITH ROLLBACK IMMEDIATE
DROP DATABASE IF EXISTS Interview; --To start with empty DB

CREATE DATABASE Interview; 

USE Interview;


IF OBJECT_ID(N'dbo.EMPLOYEE', N'U') IS NOT NULL  --Drop and create in case you want to run it individually
   DROP TABLE [dbo].[EMPLOYEE];
ELSE
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
ELSE
	CREATE TABLE DEPARTMENT (
		ID_DEPARTMENT TINYINT,
		[DESCRIPTION] VARCHAR(25)
	)
IF OBJECT_ID(N'dbo.EMPLOYEE_SALARIES', N'U') IS NOT NULL  --Drop and create in case you want to run it individually
   DROP TABLE [dbo].[EMPLOYEE_SALARIES];
ELSE
	CREATE TABLE EMPLOYEE_SALARIES (
		ID_EMPLOYEE INT,
		SALARY INT,
		STARTDATE SMALLDATETIME
	)

IF OBJECT_ID(N'dbo.DUPLICATES', N'U') IS NOT NULL  --Drop and create in case you want to run it individually
   DROP TABLE [dbo].[DUPLICATES];
ELSE
	CREATE TABLE DUPLICATES(
		ID INT,
		[NAME] VARCHAR(25) 
	)