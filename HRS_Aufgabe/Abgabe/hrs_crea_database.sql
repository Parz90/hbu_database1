/********************************************************************************************************************************************************/
-- hrs_crea_database.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 3.3
-- 
-- Change log
-- 30/12/2016   Script erstellt

/********************************************************************************************************************************************************/
/*****Datenbank HRS erstellen*****/
USE [master]
GO

/****** Object:  Database [HRS]    Script Date: 30.12.2016 14:15:40 ******/
CREATE DATABASE [HRS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HRS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HRS.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HRS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\HRS_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [HRS] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HRS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [HRS] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [HRS] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [HRS] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [HRS] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [HRS] SET ARITHABORT OFF 
GO

ALTER DATABASE [HRS] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [HRS] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [HRS] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [HRS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [HRS] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [HRS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [HRS] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [HRS] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [HRS] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [HRS] SET  DISABLE_BROKER 
GO

ALTER DATABASE [HRS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [HRS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [HRS] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [HRS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [HRS] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [HRS] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [HRS] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [HRS] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [HRS] SET  MULTI_USER 
GO

ALTER DATABASE [HRS] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [HRS] SET DB_CHAINING OFF 
GO

ALTER DATABASE [HRS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [HRS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [HRS] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [HRS] SET  READ_WRITE 
GO



/********************************************************************************************************************************************************/
/*****Tabellen zu HRS erstellen*****/
USE HRS

CREATE TABLE Zimmereinrichtung (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
CONSTRAINT PK_Zimmereinrichtung PRIMARY KEY(ID));




CREATE TABLE Zimmerreservation (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Von DATE    ,
  Bis DATE      ,
CONSTRAINT PK_Zimmerreservation PRIMARY KEY(ID));




CREATE TABLE Hoteleinrichtung (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
CONSTRAINT PK_Hoteleinrichtung PRIMARY KEY(ID));




CREATE TABLE Aufenthaltszweck (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
CONSTRAINT PK_Aufenthaltszweck PRIMARY KEY(ID));




CREATE TABLE Betten (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Art VARCHAR(45)      ,
CONSTRAINT PK_Betten PRIMARY KEY(ID));




CREATE TABLE Zimmer (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Groesse DECIMAL(7,2)    ,
  Preis DECIMAL(7,2)      ,
CONSTRAINT PK_Zimmer PRIMARY KEY(ID));




CREATE TABLE Preisklasse (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Zimmer_ID INTEGER   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
CONSTRAINT PK_Preisklasse PRIMARY KEY(ID));




CREATE TABLE Gast (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Zimmerreservation_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  Vorname VARCHAR(45)    ,
  Tel VARCHAR(45)    ,
  Mobile VARCHAR(45)    ,
  Email VARCHAR(45)    ,
  Adresse VARCHAR(45)      ,
CONSTRAINT PK_Gast PRIMARY KEY(ID));




CREATE TABLE Zimmer_has_Zimmerreservation (
  Zimmer_ID INTEGER   NOT NULL ,
  Zimmerreservation_ID INTEGER   NOT NULL   ,
CONSTRAINT PK_Zimmer_has_Zimmerreservation PRIMARY KEY(Zimmer_ID, Zimmerreservation_ID));




CREATE TABLE Zimmer_has_Zimmereinrichtung (
  Zimmer_ID INTEGER   NOT NULL ,
  Zimmereinrichtung_ID INTEGER   NOT NULL   ,
CONSTRAINT PK_Zimmer_has_Zimmereinrichtung PRIMARY KEY(Zimmer_ID, Zimmereinrichtung_ID));




CREATE TABLE Hotel (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Gast_ID INTEGER   NOT NULL ,
  Zimmer_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  Telefon VARCHAR(45)    ,
  Adresse VARCHAR(45)      ,
CONSTRAINT PK_Hotel PRIMARY KEY(ID));




CREATE TABLE Betten_has_Zimmer (
  Betten_ID INTEGER   NOT NULL ,
  Zimmer_ID INTEGER   NOT NULL   ,
CONSTRAINT PK_Betten_has_Zimmer PRIMARY KEY(Betten_ID, Zimmer_ID));




CREATE TABLE Hotel_has_Hoteleinrichtung (
  Hotel_ID INTEGER   NOT NULL ,
  Hoteleinrichtung_ID INTEGER   NOT NULL   ,
CONSTRAINT PK_Hotel_has_Hoteleinrichtung PRIMARY KEY(Hotel_ID, Hoteleinrichtung_ID));


CREATE TABLE Hotel_has_Aufenthaltszweck (
  Hotel_ID INTEGER   NOT NULL ,
  Aufenthaltszweck_ID INTEGER   NOT NULL   ,
CONSTRAINT PK_Hotel_has_Aufenthaltszweck PRIMARY KEY(Hotel_ID, Aufenthaltszweck_ID));



CREATE TABLE Ortschaft (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Hotel_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  PLZ INTEGER      ,
CONSTRAINT PK_Ortschaft PRIMARY KEY(ID));




CREATE TABLE Verkehrsverein (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Ortschaft_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  Telefon VARCHAR(45)      ,
CONSTRAINT PK_Verkehrsverein PRIMARY KEY(ID));




CREATE TABLE Hotelkategorie (
  ID INTEGER IDENTITY(1,1)   NOT NULL ,
  Hotel_ID INTEGER   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
CONSTRAINT PK_Hotelkategorie PRIMARY KEY(ID));




-- Create Contraints
ALTER TABLE Preisklasse
	ADD
	CONSTRAINT FK_Preisklasse_Zimmer FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer(ID)

ALTER TABLE Gast
	ADD
	CONSTRAINT FK_Gast_Zimmerreservation FOREIGN KEY (Zimmerreservation_ID) REFERENCES Zimmerreservation(ID)

ALTER TABLE Zimmer_has_Zimmerreservation
	ADD
	CONSTRAINT FK_Zimmer_has_Zimmerreservation_Zimmer FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer(ID),
	CONSTRAINT FK_Zimmer_has_Zimmerreservation_Zimmerreservation FOREIGN KEY (Zimmerreservation_ID) REFERENCES Zimmerreservation(ID)

ALTER TABLE Zimmer_has_Zimmereinrichtung
	ADD
	CONSTRAINT FK_Zimmer_has_Zimmereinrichtung_Zimmer FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer(ID),
	CONSTRAINT FK_Zimmer_has_Zimmereinrichtung_Zimmereinrichtung FOREIGN KEY (Zimmereinrichtung_ID) REFERENCES Zimmereinrichtung(ID)

ALTER TABLE Hotel
	ADD
	CONSTRAINT FK_Hotel_Zimmer FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer(ID),
	CONSTRAINT FK_Hotel_Gast FOREIGN KEY (Gast_ID) REFERENCES Gast(ID)	

ALTER TABLE Betten_has_Zimmer
	ADD
	CONSTRAINT FK_Betten_has_Zimmer_Zimmer FOREIGN KEY (Zimmer_ID) REFERENCES Zimmer(ID),
	CONSTRAINT FK_Betten_has_Zimmer_Betten FOREIGN KEY (Betten_ID) REFERENCES Betten(ID)	

ALTER TABLE Hotel_has_Hoteleinrichtung
	ADD
	CONSTRAINT FK_Hotel_has_Hoteleinrichtung_Hotel FOREIGN KEY (Hotel_ID) REFERENCES Hotel(ID),
	CONSTRAINT FK_Hotel_has_Hoteleinrichtung_Hoteleinrichtung FOREIGN KEY (Hoteleinrichtung_ID) REFERENCES Hoteleinrichtung(ID)	

ALTER TABLE Hotel_has_Aufenthaltszweck
	ADD
	CONSTRAINT FK_Hotel_has_Aufenthaltszweck_Hotel FOREIGN KEY (Hotel_ID) REFERENCES Hotel(ID),
	CONSTRAINT FK_Hotel_has_Aufenthaltszweck_Aufenthaltszweck FOREIGN KEY (Aufenthaltszweck_ID) REFERENCES Aufenthaltszweck(ID)	

ALTER TABLE Ortschaft
	ADD
	CONSTRAINT FK_Ortschaft_Hotel FOREIGN KEY (Hotel_ID) REFERENCES Hotel(ID)	

ALTER TABLE Verkehrsverein
	ADD
	CONSTRAINT FK_Verkehrsverein_Ortschaft FOREIGN KEY (Ortschaft_ID) REFERENCES Ortschaft(ID)	

ALTER TABLE Hotelkategorie
	ADD
	CONSTRAINT FK_Hotelkategorie_Hotel FOREIGN KEY (Hotel_ID) REFERENCES Hotel(ID)	

-- Unique constraints, damit eine Tabelle keine doppelte Einträge erhält 
-- Keine!!!

-- Check constraints, um Werte einzuschränken. Z.b. 0 -9999.
ALTER TABLE Zimmer
	ADD 
	CONSTRAINT C_preis CHECK(Preis > 0.00),
	CONSTRAINT C_groesse CHECK(Groesse > 0.00)


ALTER TABLE Ortschaft 
	ADD CONSTRAINT C_plz CHECK(PLZ BETWEEN 1000 and 9999);



