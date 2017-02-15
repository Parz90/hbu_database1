/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.2.0                     */
/* Target DBMS:           MS SQL Server 2008                              */
/* Project file:          HRS.dez                                         */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2017-02-07 13:43                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "HOTELFORM"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HOTELFORM] (
    [HF_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [HF_BEZ] VARCHAR(100),
    CONSTRAINT [PK_HOTELFORM] PRIMARY KEY ([HF_ID]),
    CONSTRAINT [TUC_HOTELFORM_BEZ] UNIQUE ([HF_BEZ])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "ZIMMER_EINRICHTUNG"                                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ZIMMER_EINRICHTUNG] (
    [ZE_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [ZE_BEZ] VARCHAR(100),
    CONSTRAINT [PK_ZIMMER_EINRICHTUNG] PRIMARY KEY ([ZE_ID]),
    CONSTRAINT [UC_ZIMMER_EINRICHTUNG_BEZ] UNIQUE ([ZE_BEZ])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "PREISKLASSEN"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE [PREISKLASSEN] (
    [PK_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [PK_BEZ] VARCHAR(40),
    CONSTRAINT [PK_PREISKLASSEN] PRIMARY KEY ([PK_ID]),
    CONSTRAINT [TUC_PREISKLASSEN_BEZ] UNIQUE ([PK_BEZ])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "KATEGORIE"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE [KATEGORIE] (
    [KA_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [KA_STERNE] INTEGER,
    [KA_BEZ] VARCHAR(40),
    CONSTRAINT [PK_KATEGORIE] PRIMARY KEY ([KA_ID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "HOTEL_EINRICHTUNG"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HOTEL_EINRICHTUNG] (
    [HE_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [HE_BEZ] VARCHAR(40),
    CONSTRAINT [PK_HOTEL_EINRICHTUNG] PRIMARY KEY ([HE_ID]),
    CONSTRAINT [TUC_HOTEL_EINRICHTUNG_BEZ] UNIQUE ([HE_BEZ])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "ORT"                                                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ORT] (
    [ORT_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [ORT_PLZ] VARCHAR(10) NOT NULL,
    [ORT_BEZ] VARCHAR(100) NOT NULL,
    CONSTRAINT [PK_ORT] PRIMARY KEY ([ORT_ID]),
    CONSTRAINT [TUC_ORT_PLZ_BEZ] UNIQUE ([ORT_PLZ], [ORT_BEZ])
)
GO


CREATE NONCLUSTERED INDEX [IDX_ORT_1] ON [ORT] ([ORT_PLZ],[ORT_BEZ])
GO


CREATE NONCLUSTERED INDEX [IDX_ORT_2] ON [ORT] ([ORT_BEZ])
GO


/* ---------------------------------------------------------------------- */
/* Add table "VERKEHRSVEREIN"                                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [VERKEHRSVEREIN] (
    [VV_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [VV_BEZEICHNUNG] VARCHAR(40) NOT NULL,
    [VV_TELNR] VARCHAR(40) NOT NULL,
    CONSTRAINT [PK_VERKEHRSVEREIN] PRIMARY KEY ([VV_ID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "VERKEHRSVEREIN_ORT"                                         */
/* ---------------------------------------------------------------------- */

CREATE TABLE [VERKEHRSVEREIN_ORT] (
    [VV_ID] INTEGER NOT NULL,
    [ORT_ID] INTEGER NOT NULL,
    CONSTRAINT [PK_VERKEHRSVEREIN_ORT] PRIMARY KEY ([VV_ID], [ORT_ID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "HOTEL"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HOTEL] (
    [HO_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [KA_ID] INTEGER NOT NULL,
    [HF_ID] INTEGER NOT NULL,
    [ORT_ID] INTEGER NOT NULL,
    [VV_ID] INTEGER NOT NULL,
    [HO_NAME] VARCHAR(100),
    [HO_TELEFON] VARCHAR(25),
    [HO_ADRESSE] VARCHAR(100),
    CONSTRAINT [PK_HOTEL] PRIMARY KEY ([HO_ID])
)
GO


CREATE NONCLUSTERED INDEX [IDX_HOTEL_NAME] ON [HOTEL] ([ORT_ID],[HO_NAME])
GO


/* ---------------------------------------------------------------------- */
/* Add table "ZIMMER"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ZIMMER] (
    [HO_ID] INTEGER NOT NULL,
    [ZI_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [PK_ID] INTEGER NOT NULL,
    [ZI_BEZEICHNUNG] VARCHAR(40),
    [ZI_PREIS] NUMERIC(5,2) NOT NULL,
    [ZI_GROESSE] INTEGER,
    [ZI_BETTEN] INTEGER CONSTRAINT [DEF_ZIMMER_ZI_BETTEN] DEFAULT 1,
    CONSTRAINT [PK_ZIMMER] PRIMARY KEY ([HO_ID], [ZI_ID])
)
GO


ALTER TABLE [ZIMMER] ADD CONSTRAINT [CC_ZIMMER_ZI_PREIS] 
    CHECK (ZI_PREIS >0.00)
GO


/* ---------------------------------------------------------------------- */
/* Add table "GAST"                                                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE [GAST] (
    [GA_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [GA_VORNAME] VARCHAR(50),
    [GA_NAME] VARCHAR(50),
    [GA_TELNR] VARCHAR(25),
    [GA_MOBILE] VARCHAR(25),
    [GA_ADRESSE] VARCHAR(100),
    [GA_EMAIL] VARCHAR(100),
    [ORT_ID] INTEGER NOT NULL,
    CONSTRAINT [PK_GAST] PRIMARY KEY ([GA_ID]),
    CONSTRAINT [TUC_GAST_EMAIL] UNIQUE ([GA_EMAIL])
)
GO


CREATE NONCLUSTERED INDEX [IDX_GAST_NAME] ON [GAST] ([GA_VORNAME],[GA_NAME])
GO


/* ---------------------------------------------------------------------- */
/* Add table "RESERVATION"                                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE [RESERVATION] (
    [RE_ID] INTEGER IDENTITY(0,1) NOT NULL,
    [GA_ID] INTEGER NOT NULL,
    [RE_VON] DATE CONSTRAINT [DEF_RESERVATION_RE_VON] DEFAULT getdate() NOT NULL,
    [RE_BIS] DATE NOT NULL,
    [RE_DATUM] DATE CONSTRAINT [DEF_RESERVATION_RE_DATUM] DEFAULT getdate(),
    CONSTRAINT [PK_RESERVATION] PRIMARY KEY ([RE_ID])
)
GO


ALTER TABLE [RESERVATION] ADD CONSTRAINT [CC_RESERVATION_RE_VON] 
    CHECK (RE_VON <= RE_BIS and RE_VON >= getdate())
GO


/* ---------------------------------------------------------------------- */
/* Add table "HZ_EINRICHTUNG"                                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HZ_EINRICHTUNG] (
    [ZI_ID] INTEGER NOT NULL,
    [HO_ID] INTEGER NOT NULL,
    [ZE_ID] INTEGER NOT NULL,
    [ZE_ANZAHL] INTEGER CONSTRAINT [DEF_HZ_EINRICHTUNG_ZE_ANZAHL] DEFAULT 1,
    CONSTRAINT [PK_HZ_EINRICHTUNG] PRIMARY KEY ([ZI_ID], [HO_ID], [ZE_ID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "HE_EINRICHTUNG"                                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE [HE_EINRICHTUNG] (
    [HO_ID] INTEGER NOT NULL,
    [HE_ID] INTEGER NOT NULL,
    [HE_ANZAHL] INTEGER CONSTRAINT [DEF_HE_EINRICHTUNG_HE_ANZAHL] DEFAULT 1,
    CONSTRAINT [PK_HE_EINRICHTUNG] PRIMARY KEY ([HO_ID], [HE_ID])
)
GO


/* ---------------------------------------------------------------------- */
/* Add table "ZIMMERRESVERATION"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE [ZIMMERRESVERATION] (
    [ZR_ID] INTEGER NOT NULL,
    [RE_ID] INTEGER NOT NULL,
    [HO_ID] INTEGER NOT NULL,
    [ZI_ID] INTEGER NOT NULL,
    CONSTRAINT [PK_ZIMMERRESVERATION] PRIMARY KEY ([ZR_ID])
)
GO


/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE [HOTEL] ADD CONSTRAINT [KATEGORIE_HOTEL] 
    FOREIGN KEY ([KA_ID]) REFERENCES [KATEGORIE] ([KA_ID])
GO


ALTER TABLE [HOTEL] ADD CONSTRAINT [HOTELFORM_HOTEL] 
    FOREIGN KEY ([HF_ID]) REFERENCES [HOTELFORM] ([HF_ID])
GO


ALTER TABLE [HOTEL] ADD CONSTRAINT [ORT_HOTEL] 
    FOREIGN KEY ([ORT_ID]) REFERENCES [ORT] ([ORT_ID])
GO


ALTER TABLE [HOTEL] ADD CONSTRAINT [VERKEHRSVEREIN_HOTEL] 
    FOREIGN KEY ([VV_ID]) REFERENCES [VERKEHRSVEREIN] ([VV_ID])
GO


ALTER TABLE [ZIMMER] ADD CONSTRAINT [PREISKLASSEN_ZIMMER] 
    FOREIGN KEY ([PK_ID]) REFERENCES [PREISKLASSEN] ([PK_ID])
GO


ALTER TABLE [ZIMMER] ADD CONSTRAINT [HOTEL_ZIMMER] 
    FOREIGN KEY ([HO_ID]) REFERENCES [HOTEL] ([HO_ID])
GO


ALTER TABLE [GAST] ADD CONSTRAINT [ORT_GAST] 
    FOREIGN KEY ([ORT_ID]) REFERENCES [ORT] ([ORT_ID])
GO


ALTER TABLE [RESERVATION] ADD CONSTRAINT [GAST_RESERVATION] 
    FOREIGN KEY ([GA_ID]) REFERENCES [GAST] ([GA_ID])
GO


ALTER TABLE [HZ_EINRICHTUNG] ADD CONSTRAINT [ZIMMER_HZ_EINRICHTUNG] 
    FOREIGN KEY ([ZI_ID], [HO_ID]) REFERENCES [ZIMMER] ([ZI_ID],[HO_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO


ALTER TABLE [HZ_EINRICHTUNG] ADD CONSTRAINT [ZIMMER_EINRICHTUNG_HZ_EINRICHTUNG] 
    FOREIGN KEY ([ZE_ID]) REFERENCES [ZIMMER_EINRICHTUNG] ([ZE_ID])
GO


ALTER TABLE [HE_EINRICHTUNG] ADD CONSTRAINT [HOTEL_HE_EINRICHTUNG] 
    FOREIGN KEY ([HO_ID]) REFERENCES [HOTEL] ([HO_ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO


ALTER TABLE [HE_EINRICHTUNG] ADD CONSTRAINT [HOTEL_EINRICHTUNG_HE_EINRICHTUNG] 
    FOREIGN KEY ([HE_ID]) REFERENCES [HOTEL_EINRICHTUNG] ([HE_ID])
GO


ALTER TABLE [ZIMMERRESVERATION] ADD CONSTRAINT [RESERVATION_ZIMMERRESVERATION] 
    FOREIGN KEY ([RE_ID]) REFERENCES [RESERVATION] ([RE_ID])
GO


ALTER TABLE [ZIMMERRESVERATION] ADD CONSTRAINT [ZIMMER_ZIMMERRESVERATION] 
    FOREIGN KEY ([HO_ID], [ZI_ID]) REFERENCES [ZIMMER] ([HO_ID],[ZI_ID])
GO


ALTER TABLE [VERKEHRSVEREIN_ORT] ADD CONSTRAINT [VERKEHRSVEREIN_VERKEHRSVEREIN_ORT] 
    FOREIGN KEY ([VV_ID]) REFERENCES [VERKEHRSVEREIN] ([VV_ID])
GO


ALTER TABLE [VERKEHRSVEREIN_ORT] ADD CONSTRAINT [ORT_VERKEHRSVEREIN_ORT] 
    FOREIGN KEY ([ORT_ID]) REFERENCES [ORT] ([ORT_ID])
GO


/* ---------------------------------------------------------------------- */
/* Views                                                                  */
/* ---------------------------------------------------------------------- */

CREATE VIEW [HOTELFORM_V] AS
SELECT H.HO_ID, H1.HF_BEZ
FROM HOTEL AS H, HOTELFORM AS H1
WHERE H.HF_ID=H1.HF_ID
GO

