-- DB anwählen
USE Abo;

-- Schritt 1:
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
);


-- Schritt 2:
-- Create Contraints
ALTER TABLE Mitglied
	ADD
	CONSTRAINT FK_Mitglied_Anrede FOREIGN KEY (AnredeID) REFERENCES Anrede(ID),
	CONSTRAINT FK_Mitglied_Ort FOREIGN KEY (OrtID) REFERENCES ORT(ID),
	CONSTRAINT FK_Mitglied_AboArt FOREIGN KEY (AboID) REFERENCES AboArt(ID)


-- Unique constraints, damit eine Tabelle keine doppelte Einträge erhält 

ALTER TABLE Anrede 
	ADD CONSTRAINT U_anrede UNIQUE(Anrede);

ALTER TABLE AboArt 
	ADD CONSTRAINT U_aboArt UNIQUE(AboArt);

-- Check constraints, um Werte einzuschränken. Z.b. 0 -9999.

ALTER TABLE Ort 
	ADD CONSTRAINT C_plz CHECK(PLZ BETWEEN 1000 and 9999);

ALTER TABLE AboArt
	ADD CONSTRAINT C_gebuehr CHECK(Gebuehr > 0.00);