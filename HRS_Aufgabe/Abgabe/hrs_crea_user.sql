/********************************************************************************************************************************************************/
-- hrs_crea_user.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 3.3
-- 
-- Change log
-- 30/12/2016   Script erstellt

/********************************************************************************************************************************************************/
/****** Anmeldung SQL erstellen HRSAdmin ******/
USE [master]
GO

CREATE LOGIN [HRSAdmin] WITH PASSWORD=N'HRSAdmin', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER LOGIN [HRSAdmin] DISABLE
GO

/****** User erstellen HRSAdmin ******/
USE [HRS]
GO

CREATE USER [HRSAdmin] FOR LOGIN [HRSAdmin] WITH DEFAULT_SCHEMA=[dbo]
GO


/********************************************************************************************************************************************************/
/****** Anmeldung SQL erstellen HRSUser ******/
USE [master]
GO

CREATE LOGIN [HRSUser] WITH PASSWORD=N'HRSUser', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER LOGIN [HRSUser] ENABLE
GO

/****** User erstellen HRSUser ******/
USE [HRS]
GO

CREATE USER [HRSUser] FOR LOGIN [HRSUser] WITH DEFAULT_SCHEMA=[dbo]
GO