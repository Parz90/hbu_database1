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
		VALUES (33, 2, 1, 1, 'Balmelli', 'Marco', convert(date, '01.01.1990', 104)),
			   (44, 1, 2, 3, 'Bürgin', 'Sandra' , convert(date, '01.05.1989', 104)),
			   (55, 2, 3, 2, 'Emmenegger', 'Reto' , convert(date, '01.10.1994', 104)),
			   (66, 2, 2, 3, 'Keller', 'Georg' , convert(date, '30.11.1996', 104)),
			   (77, 1, 4, 3, 'Müller', 'Karina' , convert(date, '30.08.2005', 104)),
			   (88, 2, 5, 1, 'Groz', 'Thomas' , convert(date, '15.07.2005', 104)),
			   (99, 1, 4, 2, 'Pozzi', 'Isabelle', convert(date, '15.07.2005', 104));

SELECT * FROM Mitglied;

SELECT * FROM Anrede;
SELECT * FROM AboArt;
SELECT * FROM Ort;
SELECT * FROM Mitglied;


-- Gelöschte Zeile wiederherstellen
INSERT INTO Mitglied (ID, AnredeID, OrtID, AboID, Nachname, Vorname, Eintritt)
		VALUES (99, 1, 4, 2, 'Isabelle', 'Pozzi' , convert(date, '15.07.2005', 104));

SELECT * FROM Mitglied;

-- Test Query um Check Constraints zu testen

INSERT INTO Ort (PLZ, Ort)
		VALUES (10000, 'Zürich');

INSERT INTO AboArt (Gebuehr)
		VALUES (0.00);