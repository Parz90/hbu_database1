-- DB anwählen
USE Abo;

-- Tabelle Anrede erstellen
CREATE TABLE Anrede
(
	ID			int	identity(1,1)			not null,
	Anrede		varchar(20)					null,
	CONSTRAINT PK_Anrede PRIMARY KEY (ID)
);

-- Tabelle Ort erstellen
CREATE TABLE Ort
(
	ID			int	identity(1,1)			not null,
	PLZ			int							null,
	Ort			varchar(80)					null,
	CONSTRAINT PK_Ort PRIMARY KEY (ID)
);

-- Tabelle AboArt erstellen
CREATE TABLE AboArt
(
	ID			int	identity(1,1)			not null,
	AboArt		varchar(50)					null,
	Gebuehr		decimal(7,2)				null,
	CONSTRAINT PK_AboArt PRIMARY KEY (ID)
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
	Eintritt	date			null,
	CONSTRAINT PK_Mitglied PRIMARY KEY (ID),
	CONSTRAINT FK_Anrede FOREIGN KEY (AnredeID) REFERENCES Anrede(ID),
	CONSTRAINT FK_Ort FOREIGN KEY (OrtID) REFERENCES ORT(ID),
	CONSTRAINT FK_AboArt FOREIGN KEY (AboID) REFERENCES AboArt(ID)
);

