﻿USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [HBUAdmin]    Script Date: 20.12.2016 21:04:31 ******/
CREATE LOGIN [HBUAdmin] WITH PASSWORD=N'lhJC+J»r«"tT¸47×§TbT¯µYF6å', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[Deutsch], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER LOGIN [HBUAdmin] DISABLE
GO


