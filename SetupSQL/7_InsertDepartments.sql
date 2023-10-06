USE [Interview]
GO
/****** Object:  StoredProcedure [dbo].[UP_INSERTDEPARTMENTS]    Script Date: 1/14/2023 8:19:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[UP_INSERTDEPARTMENTS]
AS
	TRUNCATE TABLE DEPARTMENT

	INSERT INTO DEPARTMENT VALUES (1, 'HUMAN RESOURCES')
	INSERT INTO DEPARTMENT VALUES (2, 'IT')
	INSERT INTO DEPARTMENT VALUES (3, 'SALES')
	INSERT INTO DEPARTMENT VALUES (4, 'MARKETING')
	INSERT INTO DEPARTMENT VALUES (5, 'PAYROLL')
	INSERT INTO DEPARTMENT VALUES (6, 'QUALITY ASSURANCE')
	INSERT INTO DEPARTMENT VALUES (7, 'RECRUITING')
	INSERT INTO DEPARTMENT VALUES (8, 'CORPORATE')
	INSERT INTO DEPARTMENT VALUES (9, 'FACILITIES')
	INSERT INTO DEPARTMENT VALUES (10, 'SECURITY')


