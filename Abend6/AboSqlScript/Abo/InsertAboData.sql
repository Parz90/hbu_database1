-- InsertAboData.sql
--
-- Autor		: Lukas M�ller
-- Projekt		: HBU
-- Version		: 1.0
-- 
-- Change log
-- 09/12/2016	LUK	Erstellt
-- 

use Abo;
go

insert into Anrede (Anrede)
		values	('Frau'),
				('Herr');
go

insert into AboArt(AboArt, Gebuehr)
		values	('Student', 500.0),
				('Monatsabo', 150.0),
				('Jahresabo', 1000.0);
go

insert into Ort(PLZ, Ort)
	values	(8000, 'Z�rich'),
			(8021, 'Z�rich'),
			(8048, 'Z�rich'),
			(3000, 'Bern'),
			(4000, 'Basel');
go
print 'Mitglieder werden eingef�gt...';
go

insert into Mitglied(	ID, 
						AnredeID, 
						AboID, 
						OrtID, 
						Nachname, 
						Vorname, 
						Eintritt)
				values (33,
						(select id from Anrede where Anrede = 'Herr'),
						(select id from AboArt where AboArt = 'Student'),
						(select id from Ort where PLZ = '8000'),
						'Balmelli',
						'Marco',
						convert(date, '01.01.1990', 104)),

						(44,
						(select id from Anrede where Anrede = 'Frau'),
						(select id from AboArt where AboArt = 'Jahresabo'),
						(select id from Ort where PLZ = '8021'),
						'B�rgin',
						'Sandra',
						convert(date, '01.05.1989', 104)),

						(55,
						(select id from Anrede where Anrede = 'Herr'),
						(select id from AboArt where AboArt = 'Monatsabo'),
						(select id from Ort where PLZ = '8048'),
						'Emmenegger',
						'Reto',
						convert(date, '01.10.1994', 104)),

						(66,
						(select id from Anrede where Anrede = 'Herr'),
						(select id from AboArt where AboArt = 'Jahresabo'),
						(select id from Ort where PLZ = '8021'),
						'Keller',
						'Georg',
						convert(date, '30.11.1996', 104)),	
											
						(77,
						(select id from Anrede where Anrede = 'Frau'),
						(select id from AboArt where AboArt = 'Jahresabo'),
						(select id from Ort where PLZ = '3000'),
						'M�ller',
						'Karina',
						convert(date, '30.08.2005', 104)),

						(88,
						(select id from Anrede where Anrede = 'Herr'),
						(select id from AboArt where AboArt = 'Student'),
						(select id from Ort where PLZ = '4000'),
						'Groz',
						'Thomas',
						convert(date, '15.07.2005', 104)),

						(99,
						(select id from Anrede where Anrede = 'Frau'),
						(select id from AboArt where AboArt = 'Monatsabo'),
						(select id from Ort where PLZ = '3000'),
						'Pozzi',
						'Isabelle',
						convert(date, '15.07.2005', 104));

print 'Daten wurden eingef�gt'


