/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.2.0                     */
/* Target DBMS:           MS SQL Server 2008                              */
/* Project file:          HRS.dez                                         */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2017-02-07 13:43                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop views                                                             */
/* ---------------------------------------------------------------------- */

DROP VIEW [HOTELFORM_V]
GO


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE [HOTEL] DROP CONSTRAINT [KATEGORIE_HOTEL]
GO


ALTER TABLE [HOTEL] DROP CONSTRAINT [HOTELFORM_HOTEL]
GO


ALTER TABLE [HOTEL] DROP CONSTRAINT [ORT_HOTEL]
GO


ALTER TABLE [HOTEL] DROP CONSTRAINT [VERKEHRSVEREIN_HOTEL]
GO


ALTER TABLE [ZIMMER] DROP CONSTRAINT [PREISKLASSEN_ZIMMER]
GO


ALTER TABLE [ZIMMER] DROP CONSTRAINT [HOTEL_ZIMMER]
GO


ALTER TABLE [GAST] DROP CONSTRAINT [ORT_GAST]
GO


ALTER TABLE [RESERVATION] DROP CONSTRAINT [GAST_RESERVATION]
GO


ALTER TABLE [HZ_EINRICHTUNG] DROP CONSTRAINT [ZIMMER_HZ_EINRICHTUNG]
GO


ALTER TABLE [HZ_EINRICHTUNG] DROP CONSTRAINT [ZIMMER_EINRICHTUNG_HZ_EINRICHTUNG]
GO


ALTER TABLE [HE_EINRICHTUNG] DROP CONSTRAINT [HOTEL_HE_EINRICHTUNG]
GO


ALTER TABLE [HE_EINRICHTUNG] DROP CONSTRAINT [HOTEL_EINRICHTUNG_HE_EINRICHTUNG]
GO


ALTER TABLE [ZIMMERRESVERATION] DROP CONSTRAINT [RESERVATION_ZIMMERRESVERATION]
GO


ALTER TABLE [ZIMMERRESVERATION] DROP CONSTRAINT [ZIMMER_ZIMMERRESVERATION]
GO


ALTER TABLE [VERKEHRSVEREIN_ORT] DROP CONSTRAINT [VERKEHRSVEREIN_VERKEHRSVEREIN_ORT]
GO


ALTER TABLE [VERKEHRSVEREIN_ORT] DROP CONSTRAINT [ORT_VERKEHRSVEREIN_ORT]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "ZIMMERRESVERATION"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ZIMMERRESVERATION] DROP CONSTRAINT [PK_ZIMMERRESVERATION]
GO


/* Drop table */

DROP TABLE [ZIMMERRESVERATION]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "HE_EINRICHTUNG"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HE_EINRICHTUNG] DROP CONSTRAINT [DEF_HE_EINRICHTUNG_HE_ANZAHL]
GO


ALTER TABLE [HE_EINRICHTUNG] DROP CONSTRAINT [PK_HE_EINRICHTUNG]
GO


/* Drop table */

DROP TABLE [HE_EINRICHTUNG]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "HZ_EINRICHTUNG"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HZ_EINRICHTUNG] DROP CONSTRAINT [DEF_HZ_EINRICHTUNG_ZE_ANZAHL]
GO


ALTER TABLE [HZ_EINRICHTUNG] DROP CONSTRAINT [PK_HZ_EINRICHTUNG]
GO


/* Drop table */

DROP TABLE [HZ_EINRICHTUNG]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "RESERVATION"                                               */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [RESERVATION] DROP CONSTRAINT [DEF_RESERVATION_RE_VON]
GO


ALTER TABLE [RESERVATION] DROP CONSTRAINT [DEF_RESERVATION_RE_DATUM]
GO


ALTER TABLE [RESERVATION] DROP CONSTRAINT [PK_RESERVATION]
GO


ALTER TABLE [RESERVATION] DROP CONSTRAINT [CC_RESERVATION_RE_VON]
GO


/* Drop table */

DROP TABLE [RESERVATION]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "GAST"                                                      */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [GAST] DROP CONSTRAINT [PK_GAST]
GO


ALTER TABLE [GAST] DROP CONSTRAINT [TUC_GAST_EMAIL]
GO


/* Drop table */

DROP TABLE [GAST]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "ZIMMER"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ZIMMER] DROP CONSTRAINT [DEF_ZIMMER_ZI_BETTEN]
GO


ALTER TABLE [ZIMMER] DROP CONSTRAINT [PK_ZIMMER]
GO


ALTER TABLE [ZIMMER] DROP CONSTRAINT [CC_ZIMMER_ZI_PREIS]
GO


/* Drop table */

DROP TABLE [ZIMMER]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "HOTEL"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HOTEL] DROP CONSTRAINT [PK_HOTEL]
GO


/* Drop table */

DROP TABLE [HOTEL]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "VERKEHRSVEREIN_ORT"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [VERKEHRSVEREIN_ORT] DROP CONSTRAINT [PK_VERKEHRSVEREIN_ORT]
GO


/* Drop table */

DROP TABLE [VERKEHRSVEREIN_ORT]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "VERKEHRSVEREIN"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [VERKEHRSVEREIN] DROP CONSTRAINT [PK_VERKEHRSVEREIN]
GO


/* Drop table */

DROP TABLE [VERKEHRSVEREIN]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "ORT"                                                       */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ORT] DROP CONSTRAINT [PK_ORT]
GO


ALTER TABLE [ORT] DROP CONSTRAINT [TUC_ORT_PLZ_BEZ]
GO


/* Drop table */

DROP TABLE [ORT]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "HOTEL_EINRICHTUNG"                                         */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HOTEL_EINRICHTUNG] DROP CONSTRAINT [PK_HOTEL_EINRICHTUNG]
GO


ALTER TABLE [HOTEL_EINRICHTUNG] DROP CONSTRAINT [TUC_HOTEL_EINRICHTUNG_BEZ]
GO


/* Drop table */

DROP TABLE [HOTEL_EINRICHTUNG]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "KATEGORIE"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [KATEGORIE] DROP CONSTRAINT [PK_KATEGORIE]
GO


/* Drop table */

DROP TABLE [KATEGORIE]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "PREISKLASSEN"                                              */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [PREISKLASSEN] DROP CONSTRAINT [PK_PREISKLASSEN]
GO


ALTER TABLE [PREISKLASSEN] DROP CONSTRAINT [TUC_PREISKLASSEN_BEZ]
GO


/* Drop table */

DROP TABLE [PREISKLASSEN]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "ZIMMER_EINRICHTUNG"                                        */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [ZIMMER_EINRICHTUNG] DROP CONSTRAINT [PK_ZIMMER_EINRICHTUNG]
GO


ALTER TABLE [ZIMMER_EINRICHTUNG] DROP CONSTRAINT [UC_ZIMMER_EINRICHTUNG_BEZ]
GO


/* Drop table */

DROP TABLE [ZIMMER_EINRICHTUNG]
GO


/* ---------------------------------------------------------------------- */
/* Drop table "HOTELFORM"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE [HOTELFORM] DROP CONSTRAINT [PK_HOTELFORM]
GO


ALTER TABLE [HOTELFORM] DROP CONSTRAINT [TUC_HOTELFORM_BEZ]
GO


/* Drop table */

DROP TABLE [HOTELFORM]
GO

