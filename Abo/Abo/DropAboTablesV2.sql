-- DropAvoTables.sql
-- 
-- Author		: Parthipan Nagulanandan
-- Projekt		: HBU
-- Version		: 1.0
-- 
-- Change log
-- 09/12/2016   Löschscript erstellt

USE Abo;
-- Schritt 1:
-- Constraints löschen
ALTER TABLE Mitglied
	DROP 
	CONSTRAINT FK_Mitglied_Anrede,
	CONSTRAINT FK_Mitglied_Ort,
	CONSTRAINT FK_Mitglied_AboArt

-- Schritt 2: 
-- Tabelle löschen
DROP TABLE Anrede;
-- Tabelle Ort löschen
DROP TABLE Ort;
-- Tabelle AboArt löschen
DROP TABLE AboArt;
-- Tabelle Mitglied löschen
DROP TABLE Mitglied;
