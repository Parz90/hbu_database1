/********************************************************************************************************************************************************/
-- hrs_drop_database.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 3.3
-- 
-- Change log
-- 30/12/2016   Script erstellt

/********************************************************************************************************************************************************/
/*****Tabellen zu HRS loeschen (eigentlich genügt es Datenbank löschen)*****/
USE HRS

-- Create Contraints
ALTER TABLE Preisklasse
	DROP
	CONSTRAINT FK_Preisklasse_Zimmer

ALTER TABLE Gast
	DROP
	CONSTRAINT FK_Gast_Zimmerreservation

ALTER TABLE Zimmer_has_Zimmerreservation
	DROP
	CONSTRAINT FK_Zimmer_has_Zimmerreservation_Zimmer,
	CONSTRAINT FK_Zimmer_has_Zimmerreservation_Zimmerreservation

ALTER TABLE Zimmer_has_Zimmereinrichtung
	DROP
	CONSTRAINT FK_Zimmer_has_Zimmereinrichtung_Zimmer,
	CONSTRAINT FK_Zimmer_has_Zimmereinrichtung_Zimmereinrichtung

ALTER TABLE Hotel
	DROP
	CONSTRAINT FK_Hotel_Zimmer,
	CONSTRAINT FK_Hotel_Gast	

ALTER TABLE Betten_has_Zimmer
	DROP
	CONSTRAINT FK_Betten_has_Zimmer_Zimmer,
	CONSTRAINT FK_Betten_has_Zimmer_Betten	

ALTER TABLE Hotel_has_Hoteleinrichtung
	DROP
	CONSTRAINT FK_Hotel_has_Hoteleinrichtung_Hotel,
	CONSTRAINT FK_Hotel_has_Hoteleinrichtung_Hoteleinrichtung

ALTER TABLE Hotel_has_Aufenthaltszweck
	DROP
	CONSTRAINT FK_Hotel_has_Aufenthaltszweck_Hotel,
	CONSTRAINT FK_Hotel_has_Aufenthaltszweck_Aufenthaltszweck

ALTER TABLE Ortschaft
	DROP
	CONSTRAINT FK_Ortschaft_Hotel

ALTER TABLE Verkehrsverein
	DROP
	CONSTRAINT FK_Verkehrsverein_Ortschaft

ALTER TABLE Hotelkategorie
	DROP
	CONSTRAINT FK_Hotelkategorie_Hotel

-- Unique constraints, damit eine Tabelle keine doppelte Einträge erhält 
-- Keine!!!

-- Check constraints, um Werte einzuschränken. Z.b. 0 -9999.
ALTER TABLE Zimmer
	DROP
	CONSTRAINT C_preis,
	CONSTRAINT C_groesse


ALTER TABLE Ortschaft 
	DROP 
	CONSTRAINT C_plz;





DROP TABLE Hotelkategorie;

DROP TABLE Verkehrsverein;

DROP TABLE Ortschaft;

DROP TABLE Hotel_has_Aufenthaltszweck;

DROP TABLE Hotel_has_Hoteleinrichtung;

DROP TABLE Betten_has_Zimmer;

DROP TABLE Hotel;

DROP TABLE Zimmer_has_Zimmereinrichtung;

DROP TABLE Zimmer_has_Zimmerreservation;

DROP TABLE Gast;

DROP TABLE Preisklasse;

DROP TABLE Zimmer;

DROP TABLE Betten;

DROP TABLE Aufenthaltszweck;

DROP TABLE Hoteleinrichtung;

DROP TABLE Zimmerreservation;

DROP TABLE Zimmereinrichtung;


/********************************************************************************************************************************************************/
/*****Datenbank HRS loeschen*****/
USE [master]
GO

/****** Object:  Database [HRS]    Script Date: 30.12.2016 14:15:47 ******/
DROP DATABASE [HRS]
GO