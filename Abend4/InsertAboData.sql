-- Schritt 1:
-- Tabelle Anrede erstellen
INSERT INTO Anrede (Anrede)
		VALUES ('Frau'),
			   ('Herr');

SELECT * FROM Anrede;
GO

INSERT INTO AboArt (AboArt, Gebuehr)
		VALUES ('Student', 500.00),
			   ('Monatsabo', 150.00),
			   ('Jahresabo', 1000.00)

SELECT * FROM AboArt;
GO

INSERT INTO Ort (PLZ, Ort)
		VALUES (8000, 'Zürich'),
			   (8021, 'Zürich'),
			   (8048, 'Zürich'),
			   (3000, 'Bern'),
			   (4000, 'Basel');

SELECT * FROM Ort;
GO

INSERT INTO Mitglied (ID, AnredeID, OrtID, AboID, Nachname, Vorname, Eintritt)
		VALUES (33, 2, 1, 1, 'Balmelli', 'Marco', '01.01.1990'),
			   (44, 1, 2, 3, 'Bürgin', 'Sandra' ,'01.05.1989'),
			   (55, 2, 3, 2, 'Emmenegger', 'Reto' ,'01.10.1994'),
			   (66, 2, 2, 3, 'Keller', 'Georg' ,'30.11.1996'),
			   (77, 1, 4, 3, 'Müller', 'Karina' ,'30.08.2005'),
			   (88, 2, 5, 1, 'Groz', 'Thomas' ,'15.07.2005'),
			   (99, 1, 4, 2, 'Isabelle', 'Pozzi' ,'15.07.2005');

SELECT * FROM Mitglied;

SELECT * FROM Anrede;
SELECT * FROM AboArt;
SELECT * FROM Ort;
SELECT * FROM Mitglied;
