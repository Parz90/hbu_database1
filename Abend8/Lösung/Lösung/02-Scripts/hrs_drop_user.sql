-- Projekt      : Hotelreservationssystem HRS
--
-- Autor        : Lukas Müller
-- Erstellung   : 14/11/2011
--
-- Beschreibung : Benutzer loeschen
-- Historie     :
--

IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'HRSUser')
DROP LOGIN [HRSUser]
USE [HRS]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'HRSUser')
DROP USER [HRSUser]
GO

IF  EXISTS (SELECT * FROM sys.server_principals WHERE name = N'HRSAdmin')
DROP LOGIN [HRSAdmin]
USE [HRS]
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'HRSAdmin')
DROP USER [HRSAdmin]
GO

