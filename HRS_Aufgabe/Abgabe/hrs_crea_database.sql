CREATE TABLE Zimmereinrichtung (
  ID INTEGER   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
PRIMARY KEY(ID));




CREATE TABLE Zimmerreservation (
  ID INTEGER   NOT NULL ,
  Von DATE    ,
  Bis DATE      ,
PRIMARY KEY(ID));




CREATE TABLE Hoteleinrichtung (
  ID INTEGER   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
PRIMARY KEY(ID));




CREATE TABLE Aufenthaltszweck (
  ID INTEGER   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
PRIMARY KEY(ID));




CREATE TABLE Betten (
  ID INTEGER   NOT NULL ,
  Art VARCHAR(45)      ,
PRIMARY KEY(ID));




CREATE TABLE Zimmer (
  ID INTEGER   NOT NULL ,
  Groesse DECIMAL    ,
  Preis DECIMAL      ,
PRIMARY KEY(ID));




CREATE TABLE Preisklasse (
  ID INTEGER   NOT NULL ,
  Zimmer_ID INTEGER   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(Zimmer_ID)
    REFERENCES Zimmer(ID));


CREATE INDEX Preisklasse_FKIndex1 ON Preisklasse (Zimmer_ID);


CREATE INDEX IFK_Rel_08 ON Preisklasse (Zimmer_ID);


CREATE TABLE Gast (
  ID INTEGER   NOT NULL ,
  Zimmerreservation_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  Vorname VARCHAR(45)    ,
  Tel VARCHAR(45)    ,
  Mobile VARCHAR(45)    ,
  Email VARCHAR(45)    ,
  Adresse VARCHAR(45)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(Zimmerreservation_ID)
    REFERENCES Zimmerreservation(ID));


CREATE INDEX Gast_FKIndex1 ON Gast (Zimmerreservation_ID);


CREATE INDEX IFK_Rel_16 ON Gast (Zimmerreservation_ID);


CREATE TABLE Zimmer_has_Zimmerreservation (
  Zimmer_ID INTEGER   NOT NULL ,
  Zimmerreservation_ID INTEGER   NOT NULL   ,
PRIMARY KEY(Zimmer_ID, Zimmerreservation_ID)    ,
  FOREIGN KEY(Zimmer_ID)
    REFERENCES Zimmer(ID),
  FOREIGN KEY(Zimmerreservation_ID)
    REFERENCES Zimmerreservation(ID));


CREATE INDEX Zimmer_has_Zimmerreservation_FKIndex1 ON Zimmer_has_Zimmerreservation (Zimmer_ID);
CREATE INDEX Zimmer_has_Zimmerreservation_FKIndex2 ON Zimmer_has_Zimmerreservation (Zimmerreservation_ID);


CREATE INDEX IFK_Rel_14 ON Zimmer_has_Zimmerreservation (Zimmer_ID);
CREATE INDEX IFK_Rel_15 ON Zimmer_has_Zimmerreservation (Zimmerreservation_ID);


CREATE TABLE Zimmer_has_Zimmereinrichtung (
  Zimmer_ID INTEGER   NOT NULL ,
  Zimmereinrichtung_ID INTEGER   NOT NULL   ,
PRIMARY KEY(Zimmer_ID, Zimmereinrichtung_ID)    ,
  FOREIGN KEY(Zimmer_ID)
    REFERENCES Zimmer(ID),
  FOREIGN KEY(Zimmereinrichtung_ID)
    REFERENCES Zimmereinrichtung(ID));


CREATE INDEX Zimmer_has_Zimmereinrichtung_FKIndex1 ON Zimmer_has_Zimmereinrichtung (Zimmer_ID);
CREATE INDEX Zimmer_has_Zimmereinrichtung_FKIndex2 ON Zimmer_has_Zimmereinrichtung (Zimmereinrichtung_ID);


CREATE INDEX IFK_Rel_12 ON Zimmer_has_Zimmereinrichtung (Zimmer_ID);
CREATE INDEX IFK_Rel_13 ON Zimmer_has_Zimmereinrichtung (Zimmereinrichtung_ID);


CREATE TABLE Hotel (
  ID INTEGER   NOT NULL ,
  Gast_ID INTEGER   NOT NULL ,
  Zimmer_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  Telefon VARCHAR(45)    ,
  Adresse VARCHAR(45)      ,
PRIMARY KEY(ID)    ,
  FOREIGN KEY(Zimmer_ID)
    REFERENCES Zimmer(ID),
  FOREIGN KEY(Gast_ID)
    REFERENCES Gast(ID));


CREATE INDEX Hotel_FKIndex1 ON Hotel (Zimmer_ID);
CREATE INDEX Hotel_FKIndex2 ON Hotel (Gast_ID);


CREATE INDEX IFK_Rel_07 ON Hotel (Zimmer_ID);
CREATE INDEX IFK_Rel_17 ON Hotel (Gast_ID);


CREATE TABLE Betten_has_Zimmer (
  Betten_ID INTEGER   NOT NULL ,
  Zimmer_ID INTEGER   NOT NULL   ,
PRIMARY KEY(Betten_ID, Zimmer_ID)    ,
  FOREIGN KEY(Betten_ID)
    REFERENCES Betten(ID),
  FOREIGN KEY(Zimmer_ID)
    REFERENCES Zimmer(ID));


CREATE INDEX Betten_has_Zimmer_FKIndex1 ON Betten_has_Zimmer (Betten_ID);
CREATE INDEX Betten_has_Zimmer_FKIndex2 ON Betten_has_Zimmer (Zimmer_ID);


CREATE INDEX IFK_Rel_10 ON Betten_has_Zimmer (Betten_ID);
CREATE INDEX IFK_Rel_11 ON Betten_has_Zimmer (Zimmer_ID);


CREATE TABLE Hotel_has_Hoteleinrichtung (
  Hotel_ID INTEGER   NOT NULL ,
  Hoteleinrichtung_ID INTEGER   NOT NULL   ,
PRIMARY KEY(Hotel_ID, Hoteleinrichtung_ID)    ,
  FOREIGN KEY(Hotel_ID)
    REFERENCES Hotel(ID),
  FOREIGN KEY(Hoteleinrichtung_ID)
    REFERENCES Hoteleinrichtung(ID));


CREATE INDEX Hotel_has_Hoteleinrichtung_FKIndex1 ON Hotel_has_Hoteleinrichtung (Hotel_ID);
CREATE INDEX Hotel_has_Hoteleinrichtung_FKIndex2 ON Hotel_has_Hoteleinrichtung (Hoteleinrichtung_ID);


CREATE INDEX IFK_Rel_03 ON Hotel_has_Hoteleinrichtung (Hotel_ID);
CREATE INDEX IFK_Rel_04 ON Hotel_has_Hoteleinrichtung (Hoteleinrichtung_ID);


CREATE TABLE Hotel_has_Aufenthaltszweck (
  Hotel_ID INTEGER   NOT NULL ,
  Aufenthaltszweck_ID INTEGER   NOT NULL   ,
PRIMARY KEY(Hotel_ID, Aufenthaltszweck_ID)    ,
  FOREIGN KEY(Hotel_ID)
    REFERENCES Hotel(ID),
  FOREIGN KEY(Aufenthaltszweck_ID)
    REFERENCES Aufenthaltszweck(ID));


CREATE INDEX Hotel_has_Aufenthaltszweck_FKIndex1 ON Hotel_has_Aufenthaltszweck (Hotel_ID);
CREATE INDEX Hotel_has_Aufenthaltszweck_FKIndex2 ON Hotel_has_Aufenthaltszweck (Aufenthaltszweck_ID);


CREATE INDEX IFK_Rel_05 ON Hotel_has_Aufenthaltszweck (Hotel_ID);
CREATE INDEX IFK_Rel_06 ON Hotel_has_Aufenthaltszweck (Aufenthaltszweck_ID);


CREATE TABLE Ortschaft (
  ID INTEGER   NOT NULL ,
  Hotel_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  PLZ INTEGER      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(Hotel_ID)
    REFERENCES Hotel(ID));


CREATE INDEX Ortschaft_FKIndex1 ON Ortschaft (Hotel_ID);


CREATE INDEX IFK_Rel_01 ON Ortschaft (Hotel_ID);


CREATE TABLE Verkehrsverein (
  ID INTEGER   NOT NULL ,
  Ortschaft_ID INTEGER   NOT NULL ,
  Name VARCHAR(45)    ,
  Telefon VARCHAR(45)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(Ortschaft_ID)
    REFERENCES Ortschaft(ID));


CREATE INDEX Verkehrsverein_FKIndex1 ON Verkehrsverein (Ortschaft_ID);


CREATE INDEX IFK_Rel_02 ON Verkehrsverein (Ortschaft_ID);


CREATE TABLE Hotelkategorie (
  ID INTEGER   NOT NULL ,
  Hotel_ID INTEGER   NOT NULL ,
  Bezeichnung VARCHAR(45)      ,
PRIMARY KEY(ID)  ,
  FOREIGN KEY(Hotel_ID)
    REFERENCES Hotel(ID));


CREATE INDEX Hotelkategorie_FKIndex1 ON Hotelkategorie (Hotel_ID);


CREATE INDEX IFK_Rel_09 ON Hotelkategorie (Hotel_ID);



