USE Abo

SELECT nachname, vorname, eintritt
FROM Mitglied
ORDER BY Nachname asc, Vorname asc 

SELECT nachname, vorname, eintritt
FROM Mitglied
WHERE Nachname like 'B%'
ORDER BY Nachname asc, Vorname asc 

SELECT nachname, vorname, eintritt
FROM Mitglied
WHERE ID < 50 and Eintritt < CONVERT(date, '01.01.1995', 104)
ORDER BY Nachname desc, Vorname desc 