
UPDATE Mitglied 
	SET Eintritt = convert(date, '01.01.1990', 104)
	WHERE Eintritt = '1990-01-01'
	and ID = 11;

SELECT * FROM Mitglied;