/********************************************************************************************************************************************************/
-- hrs_ins_data.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 3.3
-- 
-- Change log
-- 30/12/2016   Script erstellt

/********************************************************************************************************************************************************/
/*****Werte in Tabellen einfügen (HRS)*****/
USE HRS

-- Tabelle Inhalte erstellen(je zwei)
INSERT INTO Zimmereinrichtung (Bezeichnung)
		VALUES ('Minibar'),
			   ('Balkon');

SELECT * FROM Zimmereinrichtung;
GO

INSERT INTO Zimmerreservation (Von, Bis)
		VALUES (convert(date, '02.01.2017', 104), convert(date, '06.01.2017', 104)),
			   (convert(date, '09.01.2017', 104), convert(date, '13.01.2017', 104));

SELECT * FROM Zimmerreservation;
GO

INSERT INTO Hoteleinrichtung (Bezeichnung)
		VALUES ('Sauna'),
			   ('Fitnessraum');

SELECT * FROM Hoteleinrichtung;
GO

INSERT INTO Aufenthaltszweck (Bezeichnung)
		VALUES ('Wellnesshotel'),
			   ('Seminarhotel');

SELECT * FROM Aufenthaltszweck;
GO

INSERT INTO Betten (Art)
		VALUES ('Einzelbett'),
			   ('Doppelbett');

SELECT * FROM Betten;
GO

INSERT INTO Zimmer (Groesse, Preis)
		VALUES (75.6, 360.00),
			   (22.4, 99.00);

SELECT * FROM Zimmer;
GO

INSERT INTO Preisklasse (Zimmer_ID, Bezeichnung)
		VALUES (1, 'Suite'),
			   (2, 'EZ');

SELECT * FROM Preisklasse;
GO

INSERT INTO Gast (Zimmerreservation_ID, Name, Vorname, Tel, Mobile, Email, Adresse)
		VALUES (1, 'Nagulanandan', 'Parthipan', '055/534 77 88', '079/999 55 66', 'p.nagulanandan@hotmail.com', 'Bachtelstrasse 10'),
			   (2, 'Mueller', 'Thomas', '055/555 12 34', '079/000 56 78', 't.mueller@hotmail.com', 'Zuerichstrasse 99');

SELECT * FROM Gast;
GO

INSERT INTO Hotel (Gast_ID, Zimmer_ID, Name, Telefon, Adresse)
		VALUES (1, 1, 'Hotel Resort Skyview', '041/456 67 12', 'Bahnhofstrasse 455'),
			   (2, 2, 'Hotel Resort Alpenblick', '041/888 11 12', 'Talweg 23');

SELECT * FROM Hotel;
GO

INSERT INTO Ortschaft (Hotel_ID, Name, PLZ)
		VALUES (1, 'Zuerich', 8000),
			   (2, 'Wald', 8636);

SELECT * FROM Ortschaft;
GO

INSERT INTO Verkehrsverein (Ortschaft_ID, Name, Telefon)
		VALUES (1, 'Zueri Tourismus', '058/444 55 66'),
			   (1, 'Wald Tourismus', '058/111 33 33');

SELECT * FROM Verkehrsverein;
GO

INSERT INTO Hotelkategorie (Hotel_ID, Bezeichnung)
		VALUES (1, 'Luxus'),
			   (2, 'Standard');

SELECT * FROM Hotelkategorie;
GO

INSERT INTO Zimmer_has_Zimmerreservation (Zimmer_ID, Zimmerreservation_ID)
		VALUES (1, 1),
			   (2, 2);

SELECT * FROM Zimmer_has_Zimmerreservation;
GO

INSERT INTO Zimmer_has_Zimmereinrichtung (Zimmer_ID, Zimmereinrichtung_ID)
		VALUES (1, 1),
			   (2, 2);

SELECT * FROM Zimmer_has_Zimmereinrichtung;
GO

INSERT INTO Hotel_has_Hoteleinrichtung (Hotel_ID, Hoteleinrichtung_ID)
		VALUES (1, 1),
			   (2, 2);

SELECT * FROM Hotel_has_Hoteleinrichtung;
GO

INSERT INTO Hotel_has_Aufenthaltszweck (Hotel_ID, Aufenthaltszweck_ID)
		VALUES (1, 1),
			   (2, 2);

SELECT * FROM Hotel_has_Aufenthaltszweck;
GO

INSERT INTO Betten_has_Zimmer (Betten_ID, Zimmer_ID)
		VALUES (1, 1),
			   (2, 2);

SELECT * FROM Betten_has_Zimmer;
GO