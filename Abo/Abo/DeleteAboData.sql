
SELECT * FROM Mitglied;

DELETE Mitglied 
	WHERE Vorname = 'Pozzi'
	and ID = 99;

SELECT * FROM Mitglied;

DELETE AboArt 
	WHERE ID = 5;

SELECT * FROM AboArt;
