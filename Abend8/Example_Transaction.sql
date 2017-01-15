USE Abo

BEGIN TRANSACTION
UPDATE Mitglied
SET Vorname = 'Hugo'
WHERE Vorname = 'Marco'

-- Test wenn Transaktion läuft und ein Select Befehl ausgeführt wird.
SELECT * FROM Mitglied