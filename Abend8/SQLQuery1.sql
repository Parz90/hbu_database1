USE Abo

-- A1.1
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
ORDER BY Eintritt asc

GO

-- A1.2
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE Eintritt > convert(date, '01.01.2000', 104)

GO

-- A1.3
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE Nachname like 'B%'
ORDER BY Nachname asc, Vorname asc 

GO

-- A1.4
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE ID < 50 and Eintritt < convert(date, '01.01.1994', 104)
ORDER BY Nachname asc, Vorname asc 

GO

-- A1.5
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE Nachname like '%zz%' and Eintritt > convert(date, '01.01.2000', 104)

GO

-- A1.6
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE Eintritt > convert(date, '01.01.1994', 103) and Eintritt < convert(date, '01.01.1997', 104)

GO

-- A1.7
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE Nachname like '%e%' or Vorname like '%a%'

GO

-- A2.1
SELECT Nachname, Vorname, AboArt.Gebuehr, Anrede.Anrede
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
WHERE AboArt.Gebuehr <= 500 and Anrede.Anrede = 'Frau'
ORDER BY Nachname asc, Vorname asc 

GO

-- A2.1
SELECT Anrede.Anrede, Nachname, Vorname, AboArt.Gebuehr
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
WHERE AboArt.Gebuehr <= 500 and Anrede.Anrede = 'Frau'
ORDER BY Nachname asc, Vorname asc 

GO

-- A2.2
SELECT Anrede.Anrede, Nachname, Vorname, Ort.Ort, AboArt.AboArt
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE Ort.Ort = 'Bern' and Anrede.Anrede = 'Herr' and AboArt = 'Student'
ORDER BY Nachname asc, Vorname asc 

GO

-- A2.3
SELECT Anrede.Anrede, Nachname, Vorname, Ort.Ort, AboArt.AboArt
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE (Ort.Ort = 'Bern' or Ort.Ort = 'Zürich') and Anrede.Anrede = 'Herr'
ORDER BY Nachname asc, Vorname asc 

GO

-- A2.4
SELECT Anrede.Anrede, Nachname, Vorname, Ort.Ort, AboArt.AboArt
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE Ort.Ort != 'Bern' and Anrede.Anrede = 'Herr' and AboArt.AboArt != 'Student'
ORDER BY Nachname asc, Vorname asc 

GO

-- A2.5
SELECT Anrede.Anrede, Nachname, Vorname, Eintritt, Ort.Ort, AboArt.AboArt
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE Eintritt > convert(date, '01.01.2005', 104) and Anrede.Anrede = 'Herr'
ORDER BY Nachname asc, Vorname asc 

GO

-- A2.6
SELECT Anrede.Anrede, Nachname, Vorname, Eintritt, Ort.Ort, AboArt.AboArt
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
INNER JOIN Ort
ON Mitglied.OrtID = Ort.ID
WHERE Ort.Ort = 'Zürich' and Anrede.Anrede = 'Herr' and (AboArt.AboArt = 'Student' or AboArt.AboArt = 'Jahresabo')
ORDER BY Nachname asc, Vorname asc 

GO

-- https://msdn.microsoft.com/en-us/library/mt775029.aspx
-- A3.1
SELECT CONCAT(Nachname, ', ', Vorname) AS Name
FROM Mitglied

GO

-- A3.2
SELECT CONCAT(UPPER(Nachname), ', ', UPPER(Vorname)) AS Name
FROM Mitglied

GO

-- A3.3
SELECT Nachname, Vorname
FROM Mitglied
ORDER BY LEN(Nachname) desc

GO

-- A3.4
SELECT Nachname, Vorname, CONCAT(SUBSTRING(Nachname, 1, 1), SUBSTRING(Vorname, 1, 1)) AS Kürzel
FROM Mitglied
ORDER BY Kürzel asc

GO

-- A3.5
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
ORDER BY Eintritt desc

GO

-- A3.6
SELECT Nachname, Vorname, Eintritt
FROM Mitglied
WHERE Year(Mitglied.Eintritt) = 2005

GO

-- https://msdn.microsoft.com/en-us/library/ms173454.aspx
-- A4.1
SELECT MIN(AboArt.Gebuehr) AS MinAbo, MAX(AboArt.Gebuehr) AS MaxAbo, AVG(AboArt.Gebuehr) AS AvgAbo
FROM Mitglied
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID

GO

-- A4.2
SELECT COUNT(*) AS AnzahlFrauen
FROM Mitglied
INNER JOIN Anrede
ON Mitglied.AnredeID = Anrede.ID
WHERE Anrede.Anrede = 'Frau'

GO

-- A4.3
SELECT MIN(AboArt.Gebuehr) AS MinAbo, MAX(AboArt.Gebuehr) AS MaxAbo, AVG(AboArt.Gebuehr) AS AvgAbo
FROM Mitglied
INNER JOIN AboArt
ON Mitglied.AboID = AboArt.ID
GROUP BY AboArt

GO
