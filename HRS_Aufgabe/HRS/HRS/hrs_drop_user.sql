/********************************************************************************************************************************************************/
-- hrs_drop_user.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 3.3
-- 
-- Change log
-- 30/12/2016   Script erstellt

/********************************************************************************************************************************************************/
/****** Anmeldung SQL loeschen HRSAdmin ******/
USE [master]
GO

DROP LOGIN [HRSAdmin]
GO

/****** User loeschen HRSAdmin ******/
USE [HRS]
GO

DROP USER [HRSAdmin]
GO


/********************************************************************************************************************************************************/
/****** Anmeldung SQL loeschen HRSUser ******/
USE [master]
GO

DROP LOGIN [HRSUser]
GO

/****** User loeschen HRSUser ******/
USE [HRS]
GO

DROP USER [HRSUser]
GO


