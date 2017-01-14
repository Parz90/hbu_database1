USE Abo

-- https://msdn.microsoft.com/en-us/library/mt775029.aspx
-- Wenn CREATE VIEW ROT ist, Bearbeiten -> IntelliSense -> Lokalen Cache aktualisieren
CREATE VIEW MitarbeiterAnredeView
AS
SELECT Mitglied.ID, Anrede.Anrede, Mitglied.Vorname
FROM Anrede INNER JOIN
	Mitglied ON Anrede.ID = Mitglied.AnredeID

GO

-- A1.1 (OK)
CREATE VIEW MITGLIED_STUDENT_V
AS SELECT Anrede.Anrede, Mitglied.Nachname, Mitglied.Vorname, Ort.Ort 
FROM Mitglied 
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
WHERE AboArt.AboArt = 'Student'

GO

-- A1.2 (OK)
CREATE VIEW MITGLIED_ZUERICH_V
AS SELECT Anrede.Anrede, Mitglied.Nachname, Mitglied.Vorname, AboArt.AboArt, Ort.PLZ, Ort.Ort 
FROM Mitglied 
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE Ort.Ort = 'Zürich'

GO

-- A1.3 (offen)
CREATE VIEW MITGLIED_ABOART_V
AS SELECT AboArt.AboArt, Count(AboArt.AboArt) AS Anzahl
FROM Mitglied 
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
GROUP BY AboArt

GO

-- A1.4 (OK)
CREATE VIEW MITGLIED_PLZ8_V
AS SELECT Anrede.Anrede, Mitglied.Nachname, Mitglied.Vorname, AboArt.AboArt, Ort.PLZ, Ort.Ort 
FROM Mitglied 
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE Ort.PLZ between 8000 and 8999


-- A1.5 (offen)
CREATE VIEW GEBUEHR_SUMME_V
AS SELECT AboArt.AboArt, SUM(AboArt.Gebuehr) AS Summe
FROM Mitglied 
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
GROUP BY AboArt

GO

-- A1.6 (OK)
CREATE VIEW MITGLIEDER_TREUE_V
AS SELECT Anrede.Anrede, Mitglied.Nachname, Mitglied.Vorname,Mitglied.Eintritt, AboArt.AboArt, Ort.PLZ, Ort.Ort 
FROM Mitglied 
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE (Year(getdate()) - Year(Mitglied.Eintritt)) > 20

GO

Select * From MITGLIED_STUDENT_V
Select * From MITGLIED_ZUERICH_V
Select * From MITGLIED_PLZ8_V
Select * From MITGLIEDER_TREUE_V
Select * From MITGLIED_ABOART_V
Select * From GEBUEHR_SUMME_V

DROP VIEW MITGLIED_STUDENT_V
DROP VIEW MITGLIED_ZUERICH_V
DROP VIEW MITGLIED_PLZ8_V
DROP VIEW MITGLIEDER_TREUE_V
DROP VIEW MITGLIED_ABOART_V
DROP VIEW GEBUEHR_SUMME_V