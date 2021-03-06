-- Projekt      : Hotelreservationssystem HRS
--
-- Autor        : Lukas Müller
-- Erstellung   : 14/11/2011
--
-- Beschreibung : Benutererstellung
-- Historie     :
--

USE [master]
CREATE LOGIN [HRSAdmin] WITH PASSWORD=N'admin', DEFAULT_DATABASE=[HRS], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
USE [HRS]
CREATE USER [HRSAdmin] FOR LOGIN [HRSAdmin]
USE [HRS]
ALTER USER [HRSAdmin] WITH DEFAULT_SCHEMA=[db_owner]
GO

USE [master]
CREATE LOGIN [HRSUser] WITH PASSWORD=N'user', DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
USE [HRS]
CREATE USER [HRSUser] FOR LOGIN [HRSUser]
EXEC sp_addrolemember N'db_datareader', N'HRSUser'
EXEC sp_addrolemember N'db_datawriter', N'HRSUser'
GO