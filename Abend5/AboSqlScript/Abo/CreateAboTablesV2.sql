-- CreateAboTables.sql
--
-- Autor		: Lukas Müller
-- Projekt		: HBU
-- Version		: 1.0
-- 
-- Change log
-- 09/12/2016	LUK	Erstellt
-- 

-- DB anwählen
use Abo;

-- Tabellen erstellen (Step 1)

-- Tabelle Anrede erstellen
create table Anrede
(
	ID		int		identity(1,1)	not null,
	Anrede	varchar(20)				null
	CONSTRAINT PK_Anrede PRIMARY KEY (ID) 
);

-- Tabelle Ort erstellen
create table Ort
(
	ID		int	identity(1,1)	not null,
	PLZ		int					null,
	Ort		varchar(80)			null
	CONSTRAINT PK_Ort PRIMARY KEY (ID) 
);

-- Tabelle AboArt erstellen
create table AboArt
(
	ID		int		identity(1,1)	not null,
	AboArt	varchar(50)				null,
	Gebuehr	decimal(7,2)			null
	CONSTRAINT PK_AboArt PRIMARY KEY (ID) 
);

-- Tabelle Mitglied erstellen
create table Mitglied
(
	ID			int			not null,
	AnredeID	int			null,
	OrtID		int			null,
	AboID		int			null,
	Nachname	varchar(50) null,
	Vorname		varchar(50)	null,
	Eintritt	Date		null
	CONSTRAINT PK_Mitglied PRIMARY KEY (ID) 
);

-- Create Constraints erstellen (Step 2)

Alter Table Mitglied
	add CONSTRAINT FK_Mitglied_Anrede FOREIGN KEY(AnredeID)
		REFERENCES Anrede(ID),
	CONSTRAINT FK_Mitglied_Ort FOREIGN KEY(OrtID)
		REFERENCES Ort(ID),
	CONSTRAINT FK_Mitglied_AboArt FOREIGN KEY(AboID)
		REFERENCES AboArt(ID)