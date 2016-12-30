/********************************************************************************************************************************************************/
-- Select.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 3.3
-- 
-- Change log
-- 30/12/2016   Script erstellt

/********************************************************************************************************************************************************/
USE HRS

SELECT * FROM Aufenthaltszweck;

SELECT * FROM Betten;

SELECT * FROM Betten_has_Zimmer;

SELECT * FROM Gast;

SELECT * FROM Hotel;

SELECT * FROM Hotel_has_Aufenthaltszweck;

SELECT * FROM Hotel_has_Hoteleinrichtung;

SELECT * FROM Hoteleinrichtung;

SELECT * FROM Hotelkategorie;

SELECT * FROM Ortschaft;

SELECT * FROM Preisklasse;

SELECT * FROM Verkehrsverein;

SELECT * FROM Zimmer;

SELECT * FROM Zimmer_has_Zimmereinrichtung;

SELECT * FROM Zimmer_has_Zimmerreservation;

SELECT * FROM Zimmereinrichtung;

SELECT * FROM Zimmerreservation;

-- Join als Testzweck
SELECT Hotel.ID, Hotel.Name, Gast.Name, Gast.Vorname, Zimmer.Groesse, Zimmer.Preis FROM Hotel
INNER JOIN Gast
ON Hotel.Gast_ID = Gast.ID
INNER JOIN Zimmer
ON Hotel.Zimmer_ID = Zimmer.ID
ORDER BY Hotel.ID asc