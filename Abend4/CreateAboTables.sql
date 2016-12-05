-- DB anwählen
USE Abo;

-- Tabelle Anrede erstellen
CREATE TABLE Anrede
(
	ID			int				not null,
	Anrede		varchar(20)		null
);

-- Tabelle Ort erstellen
CREATE TABLE Ort
(
	ID			int				not null,
	PLZ			int				null,
	Ort			varchar(80)		null
);

-- Tabelle AboArt erstellen
CREATE TABLE AboArt
(
	ID			int				not null,
	AboArt		varchar(50)		null,
	Gebuehr		decimal(7,2)	null
);

-- Tabelle Mitglied erstellen
CREATE TABLE Mitglied
(
	ID			int				not null,
	AnredeID	int				null,
	OrtID		int				null,
	AboID		int				null,
	Nachname	varchar(50)		null,
	Vorname		varchar(50)		null,
	Eintritt	date			null
);