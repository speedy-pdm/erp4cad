-- --------------------------------------------------------
-- Host:                         
-- Server-Version:               11.6.2-MariaDB - mariadb.org binary distribution
-- Server-Betriebssystem:        Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank-Struktur für sso_dev
CREATE DATABASE IF NOT EXISTS `sso_dev` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `sso_dev`;

-- Exportiere Struktur von Tabelle sso_dev.hlpdocstructure
DROP TABLE IF EXISTS `hlpdocstructure`;
CREATE TABLE IF NOT EXISTS `hlpdocstructure` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `TABLEIDPARENT` int(11) DEFAULT NULL COMMENT 'ID Mutter',
  `DESCRIPTION01` varchar(256) DEFAULT NULL COMMENT 'Beschreibung',
  `PATHNAMEORG` varchar(256) DEFAULT NULL COMMENT 'Pfadname original',
  `FILENAMEORG` varchar(256) DEFAULT NULL COMMENT 'Filename original',
  `FILEEXTENSION` varchar(56) DEFAULT NULL COMMENT 'Dateiendung',
  `FILEDATEORG` datetime DEFAULT NULL,
  `OBJECTIDNEW` int(11) DEFAULT NULL COMMENT 'Neue ObjektID (Dokumenttyp, Ordnertyp, ...)',
  `OBJECTVERSION` varchar(56) DEFAULT NULL COMMENT 'Version Artikel aus Fremdsystem',
  `OBJECTVERSIONCAD` varchar(56) DEFAULT NULL COMMENT 'Zuletzt gespeichert mit welcher Programmversion',
  `CHANGEREFERENCE` bit(1) DEFAULT NULL COMMENT 'Tausch der CAD Referenz notwendig?',
  `HOSTNAME` varchar(56) DEFAULT NULL,
  `NEEDSMIGRATION` bit(1) DEFAULT b'1',
  `MIGRATESTATUS` int(11) DEFAULT 0,
  `TRANSFERSTATUS` int(11) DEFAULT NULL COMMENT '0=neu;1=erledigt;2=fehler',
  `ERRORMESSAGE` varchar(255) DEFAULT NULL,
  `PROPERTIESJSON` longtext DEFAULT NULL,
  `PATHNAMENEW` varchar(255) DEFAULT NULL,
  `OBJECTDEPENDENCIESOLD` longtext DEFAULT NULL,
  `OBJECTDEPENDENCIESNEW` longtext DEFAULT NULL,
  `OBJECTCONFIGURATIONS` longtext DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_hlpdocstructure_PATHNAMEORG` (`PATHNAMEORG`,`TABLEIDPARENT`,`FILEEXTENSION`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=5140;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.hlpeplansync
DROP TABLE IF EXISTS `hlpeplansync`;
CREATE TABLE IF NOT EXISTS `hlpeplansync` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PARTNR` varchar(255) DEFAULT NULL,
  `ERPNRMIC` varchar(50) DEFAULT '',
  `ERPNRTEC` varchar(50) DEFAULT '',
  `ERPNRSSO` varchar(128) DEFAULT '',
  `DECRIPTION1` text DEFAULT '',
  `TYPENR` varchar(255) DEFAULT '',
  `MANUFACTURER` varchar(30) DEFAULT '',
  `ORDERNR` varchar(255) DEFAULT '',
  `IDENTTYPE` varchar(20) DEFAULT '',
  `IDENTCODE` varchar(128) DEFAULT '',
  `CREATEDBY` varchar(10) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_hlpeplansync_ERPNRMIC` (`ERPNRMIC`),
  KEY `IDX_hlpeplansync_ERPNRSSO` (`ERPNRSSO`),
  KEY `IDX_hlpeplansync_ERPNRTEC` (`ERPNRTEC`),
  KEY `IDX_hlpeplansync_PARTNR` (`PARTNR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=2109;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.spcabasdefault
DROP TABLE IF EXISTS `spcabasdefault`;
CREATE TABLE IF NOT EXISTS `spcabasdefault` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUPNUMBER1` varchar(10) DEFAULT NULL COMMENT 'Auswahlkennzeichen für Dokumenttyp (dttype_name)',
  `GROUPNUMBER2` varchar(10) DEFAULT NULL,
  `COLUMNNAMEABAS` varchar(255) DEFAULT NULL,
  `COLUMNNAMESSO` varchar(255) DEFAULT NULL,
  `VALUEE` varchar(4000) DEFAULT NULL COMMENT 'Bei Eigenbeschaffung',
  `VALUEF` varchar(4000) DEFAULT NULL COMMENT 'Bei Fremdbeschaffung',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_spcabasdefault_GROUPNUMBER` (`GROUPNUMBER1`),
  KEY `IDX_spcabasdefault_GROUPNUMBER2` (`GROUPNUMBER2`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=1638;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstbomproject
DROP TABLE IF EXISTS `sstbomproject`;
CREATE TABLE IF NOT EXISTS `sstbomproject` (
  `BOMTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `BOMPROJECT` varchar(128) DEFAULT NULL COMMENT 'Projektnummer',
  `BOMHEADERID` int(11) NOT NULL COMMENT 'Tableid Parts der Mutter',
  `BOMPOSID` int(11) NOT NULL COMMENT 'Tableid Parts vom Kind',
  `BOMHEADERNO` varchar(128) NOT NULL COMMENT 'Artikelnummer der Mutter',
  `BOMVARIANT` varchar(50) DEFAULT NULL COMMENT 'Variante der Mutter',
  `BOMPOS` int(11) DEFAULT NULL COMMENT 'Positionsnummer der Stückliste',
  `BOMPOSNO` varchar(128) NOT NULL COMMENT 'Artikelnummer vom Kind',
  `BOMPATHTREE` varchar(767) DEFAULT NULL COMMENT 'Artikelnummerpfad komplett ',
  `BOMPATHTREESORT` varchar(767) DEFAULT NULL,
  `BOMPATHMOTHERCHILD` varchar(256) DEFAULT NULL COMMENT 'Artikelnummerpfad die letzten zwei Ebenen',
  `BOMPOSTYPE` varchar(30) DEFAULT NULL COMMENT 'Typ der Position BOM WORK ..',
  `BOMQUANTITY` double DEFAULT 0 COMMENT 'Menge auf der Position',
  `BOMQUANTITYUNIT` varchar(10) DEFAULT NULL COMMENT 'Mengeneinheit',
  `BOMCATEGORY` varchar(128) DEFAULT NULL COMMENT 'noch frei',
  `BOMMANUELL` bit(1) DEFAULT NULL COMMENT 'true wenn manuell angelegt',
  `BOMCOSTCENTRE` varchar(10) DEFAULT NULL,
  `BOMPOSSTATUS` varchar(10) DEFAULT NULL COMMENT 'Bom Status der Position',
  `BOMPOSCADVERSION` varchar(10) DEFAULT NULL,
  `BOMDIM1` double DEFAULT NULL COMMENT 'Laenge',
  `BOMDIM2` double DEFAULT NULL COMMENT 'Breite',
  `BOMDIM3` double DEFAULT NULL COMMENT 'Hoehe',
  `BOMVAR1` varchar(256) DEFAULT NULL COMMENT 'Varchar 1 Stkl. (Bsp. Endbearbeitung)',
  `BOMVAR2` varchar(256) DEFAULT NULL COMMENT 'Varchar 2 Stkl.',
  `BOMVAR3` varchar(256) DEFAULT NULL COMMENT 'Varchar 3 Stkl.',
  `BOMLEVEL` int(11) DEFAULT NULL COMMENT 'Baustufe',
  `BOMPATHTREEBEFORE` varchar(1024) DEFAULT NULL COMMENT 'Artikelnummerpfad komplett vor dem letzten update',
  `BOMCOMMENT` varchar(1024) DEFAULT NULL,
  `BOMCUSTOMC01` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC02` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC03` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC04` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC05` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC06` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC07` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC08` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC09` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC10` varchar(256) DEFAULT NULL,
  `BOMCUSTOMN01` double DEFAULT NULL,
  `BOMCUSTOMN02` double DEFAULT NULL,
  `BOMCUSTOMN03` double DEFAULT NULL,
  `BOMCUSTOMN04` double DEFAULT NULL,
  `BOMCUSTOMN05` double DEFAULT NULL,
  `BOMCUSTOMD01` datetime DEFAULT NULL,
  `BOMCUSTOMD02` datetime DEFAULT NULL,
  `BOMCUSTOMD03` datetime DEFAULT NULL,
  `BOMCUSTOMD04` datetime DEFAULT NULL,
  `BOMCUSTOMD05` datetime DEFAULT NULL,
  `BOMRTF` text DEFAULT NULL,
  `BOMDISTABLEID` int(11) DEFAULT NULL COMMENT 'Tableid der aktuellen DispoNr',
  `BOMINFO01` varchar(255) DEFAULT NULL COMMENT 'Änderungs Informationen 1',
  `BOMINFO02` varchar(255) DEFAULT NULL COMMENT 'Änderungs Informationen 2',
  `BOMINFO03` varchar(255) DEFAULT NULL COMMENT 'Änderungs Informationen 3',
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `BOMQUANTITYLEVEL` double DEFAULT 0 COMMENT 'Menge pro Level',
  `BOMQUANTITYTOTALPERPART` double DEFAULT 0 COMMENT 'Menge im Projekt',
  `XPATH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BOMTABLEID`),
  KEY `BOMPATHTREE` (`BOMPATHTREE`),
  KEY `IXBOMHAEADRID` (`BOMPROJECT`,`BOMHEADERID`),
  KEY `IXBOMPOSID` (`BOMPROJECT`,`BOMPOSID`),
  KEY `IXBOMPROJECT` (`BOMPROJECT`,`BOMHEADERNO`,`BOMVARIANT`,`BOMPOSNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2120 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=692;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstcashflow
DROP TABLE IF EXISTS `sstcashflow`;
CREATE TABLE IF NOT EXISTS `sstcashflow` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `FOREIGNTABLEID` int(11) DEFAULT NULL,
  `DATEPAYMENT` datetime DEFAULT NULL COMMENT 'Zahlungsdatum',
  `DATEPAYMENTORIGIN` datetime DEFAULT NULL,
  `AMOUNTIN` double DEFAULT 0 COMMENT 'Eingangszahlung',
  `AMOUNTOUT` double DEFAULT 0 COMMENT 'Ausgangszahlung',
  `SUM` double DEFAULT 0 COMMENT 'Summe / Kontostand',
  `INVOICENR` varchar(255) DEFAULT NULL COMMENT 'Rechnungsnummer',
  `ORDERNOINTERN` varchar(255) DEFAULT NULL COMMENT 'Interne AB-Nummer',
  `CUSTOMER` varchar(50) DEFAULT NULL COMMENT 'Kunde',
  `TYP` varchar(255) DEFAULT NULL COMMENT 'Art / Rechnungsart',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'Beschreibung',
  `STATUS` varchar(50) DEFAULT NULL COMMENT 'Status',
  `DATEBOOKING` datetime DEFAULT NULL COMMENT 'Buchungsdatum / ESDATEADDED',
  `DATEORDER` datetime DEFAULT NULL COMMENT 'Datum Vorgang',
  `DATEINVOICE` datetime DEFAULT NULL COMMENT 'Rechnungsdatum',
  `PROJECT` varchar(128) DEFAULT NULL COMMENT 'Projekt (abweichend AB)',
  `CLERK` varchar(50) DEFAULT NULL COMMENT 'Sachbearbeiter',
  `INVOICESUPPLIER` bit(1) DEFAULT NULL COMMENT 'Gegenrechnung (ja/nein)',
  `INVOICESUPPLIERPARENTID` int(11) DEFAULT NULL COMMENT 'Bei Gegenrechnung ID von Parent',
  `SUPPLIERNAME` varchar(50) DEFAULT NULL COMMENT 'Lieferant',
  `BLOCKED` bit(1) DEFAULT NULL COMMENT 'Gesperrt für Überschreiben (Automatische Fixkosten)',
  `COMMENTAR` varchar(255) DEFAULT NULL COMMENT 'Kommentar',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  `PARENTID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstdispartcheckstatus
DROP TABLE IF EXISTS `sstdispartcheckstatus`;
CREATE TABLE IF NOT EXISTS `sstdispartcheckstatus` (
  `DISTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `DISPARTNUMBER` varchar(128) DEFAULT NULL COMMENT 'Artikelnummer',
  `DISPARTVARIANT` varchar(50) DEFAULT NULL COMMENT 'Variante',
  `DISPROJECTNO` varchar(50) DEFAULT NULL COMMENT 'Projektnummer',
  `DISPATHTREE` varchar(767) DEFAULT NULL COMMENT 'Pfad im Projekt',
  `DISORDERNO` varchar(255) DEFAULT NULL COMMENT 'Disponummern',
  `DISERRORSTATUS` varchar(50) DEFAULT NULL COMMENT 'Status Error Fehler SsoEnumPuelStates',
  `DISERRORTEXT` varchar(255) DEFAULT NULL COMMENT 'Error Text (bspw. Tooltipp aus MSG > 100)',
  `DISCONFIRMSTATUS` varchar(50) DEFAULT NULL COMMENT 'Status bestätigt durch Benutzer',
  `DISCONFIRMDATE` datetime DEFAULT NULL COMMENT 'Datum wann Error bestätigt / akzeptiert wurde',
  `DISCONFIRMTEXT` varchar(255) DEFAULT NULL COMMENT 'Text für Bestätigung von User',
  `DISCONFIRMLOG` varchar(255) DEFAULT NULL COMMENT 'Text für Log von Programm',
  `DISVENDOR` varchar(255) DEFAULT NULL COMMENT 'Lieferant aus Dispo',
  `DISPOSORDERVERSION` varchar(11) DEFAULT NULL COMMENT 'bestellte CAD Version von Artikel',
  `DISPOSCADVERSION` varchar(11) DEFAULT NULL COMMENT 'Aktuellste CADVersion von Stücklistenposition',
  `DISORDERQTY` double NOT NULL DEFAULT 0 COMMENT 'bestellte Menge',
  `DISCADQTY` double NOT NULL DEFAULT 0 COMMENT 'letzte Menge aus CAD',
  `DISPATHTREENEW` varchar(767) DEFAULT NULL,
  `DISPATHTREEOLD` varchar(767) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`DISTABLEID`),
  KEY `IDX_sstdispartproof_DISPATHTREE` (`DISPATHTREE`),
  KEY `IX_PARTNUMER` (`DISPARTNUMBER`,`DISPROJECTNO`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=2048 COMMENT='Statusverfolgung für Stücklistenpositionen mit Fehlern';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstdispartproof
DROP TABLE IF EXISTS `sstdispartproof`;
CREATE TABLE IF NOT EXISTS `sstdispartproof` (
  `DISTABELID` int(11) NOT NULL AUTO_INCREMENT,
  `DISPARTNUMBER` varchar(128) DEFAULT '' COMMENT 'Artikelnummer',
  `DISPARTVARIANT` varchar(50) DEFAULT '' COMMENT 'Variante',
  `DISPROJECTNO` varchar(50) DEFAULT '' COMMENT 'Projektnummer',
  `DISPATHTREE` varchar(767) DEFAULT '' COMMENT 'Pfad im Projekt',
  `DISPROJECTQUANTITY` double DEFAULT 0 COMMENT 'Menge im Projekt',
  `DISPOSBRUTTOQUANTITY` double DEFAULT 0 COMMENT 'Menge Brutto auf Position',
  `DISPOSQUANTITY` double DEFAULT 0 COMMENT 'Menge auf der Position',
  `DISPOSTYPE` varchar(50) DEFAULT '' COMMENT 'Phantomteil, Beistellteil, ...',
  `DISORDERTYPE` varchar(10) DEFAULT '',
  `DISORDERNO` varchar(10) DEFAULT '' COMMENT 'Disponummer',
  `DISORDERPOS` int(11) DEFAULT 0 COMMENT 'Dispoposition',
  `DISORDERSTATUS` varchar(10) DEFAULT '' COMMENT 'Status',
  `DISCOMMENT` mediumtext DEFAULT '' COMMENT 'Commentar zur Disposition',
  `DISVENDOR` varchar(128) DEFAULT '' COMMENT 'Lieferant',
  `DISORDERQUANTITY` double DEFAULT 0 COMMENT 'Menge Dispo',
  `DISORDERQUANTITYCUR` double DEFAULT 0 COMMENT 'Aktuelle Menge nach Status',
  `DISORDERQUANTITY01` double DEFAULT 0 COMMENT 'Menge gewünscht',
  `DISORDERQUANTITY02` double DEFAULT 0 COMMENT 'Menge bestellt',
  `DISORDERQUANTITY03` double DEFAULT 0 COMMENT 'Menge bestätigt',
  `DISORDERQUANTITY04` double DEFAULT 0 COMMENT 'Menge geliefert',
  `DISORDERQUANTITY05` double DEFAULT 0 COMMENT 'Menge berechnet',
  `DISORDERPRICE` double DEFAULT 0,
  `DISPORDERDATE` datetime DEFAULT current_timestamp() COMMENT 'Dispodatum',
  `DISPORDERDATECUR` datetime DEFAULT current_timestamp() COMMENT 'Aktuelles Datum nach Status',
  `DISORDERDATE01` datetime DEFAULT NULL COMMENT 'Liefertermin (gewünscht, angefragt)',
  `DISORDERDATE02` datetime DEFAULT NULL COMMENT 'Liefertermin (bestellt)',
  `DISORDERDATE03` datetime DEFAULT NULL COMMENT 'Liefertermin (bestätigt)',
  `DISORDERDATE04` datetime DEFAULT NULL COMMENT 'Liefertermin (geliefert)',
  `DISORDERDATE05` datetime DEFAULT NULL COMMENT 'Rechnungsdatum',
  `DISFOREIGNREFCUR` varchar(50) DEFAULT '' COMMENT 'Aktuelle Ref nach Status',
  `DISFOREIGNREF01` varchar(50) DEFAULT '' COMMENT 'Anfrage Ref',
  `DISFOREIGNREF01POS` varchar(10) DEFAULT '',
  `DISFOREIGNREF02` varchar(50) DEFAULT '' COMMENT 'Bestnr Ref',
  `DISFOREIGNREF02POS` varchar(10) DEFAULT '',
  `DISFOREIGNREF03` varchar(50) DEFAULT '' COMMENT 'Bestät Ref',
  `DISFOREIGNREF03POS` varchar(10) DEFAULT '',
  `DISFOREIGNREF04` varchar(50) DEFAULT '' COMMENT 'Lieferschein Ref',
  `DISFOREIGNREF04POS` varchar(10) DEFAULT '',
  `DISFOREIGNREF05` varchar(50) DEFAULT '' COMMENT 'Rechnug Ref',
  `DISFOREIGNREF05POS` varchar(10) DEFAULT '',
  `DISORDERLASTBOOKINGDATE` datetime DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`DISTABELID`),
  KEY `IDX_sstdispartproof_DISPATHTREE` (`DISPATHTREE`),
  KEY `IX_PARTNUMER` (`DISPARTNUMBER`,`DISPROJECTNO`),
  KEY `IDX_sstdispartproof_DISORDERLASTBOOKINGDATE` (`DISORDERLASTBOOKINGDATE`)
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Nachweisdatei für Parts, Bestellungen, Beriebsaufträge';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstexpbom
DROP TABLE IF EXISTS `sstexpbom`;
CREATE TABLE IF NOT EXISTS `sstexpbom` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `BOMCREATED` datetime NOT NULL,
  `BOMPROCESSED` datetime DEFAULT NULL,
  `BOMASSEMBLY` varchar(255) DEFAULT NULL,
  `BOMDOCNO` varchar(255) DEFAULT NULL,
  `BOMPOS` varchar(255) DEFAULT NULL,
  `BOMQTY` varchar(255) DEFAULT NULL,
  `BOMPROJECT` varchar(255) DEFAULT NULL,
  `BOMMANDANT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstexpitem
DROP TABLE IF EXISTS `sstexpitem`;
CREATE TABLE IF NOT EXISTS `sstexpitem` (
  `ITEMID` int(11) NOT NULL AUTO_INCREMENT,
  `ITEMCREATED` datetime NOT NULL,
  `ITEMPROCESSED` datetime DEFAULT NULL,
  `ITEMSTATUSTRANSFER` int(11) DEFAULT 0,
  `ITEMPARTNO` varchar(255) DEFAULT '0',
  `ITEMDESCRIPTION1` varchar(255) DEFAULT NULL,
  `ITEMDESCRIPTION2` varchar(255) DEFAULT NULL,
  `ITEMDESCRIPTION3` varchar(255) DEFAULT NULL,
  `ITEMPRODUCER` varchar(255) DEFAULT NULL,
  `ITEMVENDOR` varchar(255) DEFAULT NULL,
  `ITEMBEST1` varchar(255) DEFAULT NULL,
  `ITEMBEST2` varchar(255) DEFAULT NULL,
  `ITEMBEST3` varchar(255) DEFAULT NULL,
  `ITEMUNIT` varchar(255) DEFAULT NULL,
  `ITEMWERKSTOFF` varchar(255) DEFAULT NULL,
  `ITEMOBERFLAECHE` varchar(255) DEFAULT NULL,
  `ITEMDIMENSION` varchar(255) DEFAULT NULL,
  `ITEMPROPBOX` varchar(255) DEFAULT NULL,
  `ITEMKOMMENTAR` varchar(255) DEFAULT NULL,
  `ITEMVERSION` varchar(255) DEFAULT NULL,
  `ITEMCADSTATUS` varchar(255) DEFAULT NULL,
  `ITEMPATH` varchar(255) DEFAULT NULL,
  `ITEMWEIGHT` varchar(255) DEFAULT NULL,
  `ITEMNORM` varchar(255) DEFAULT NULL,
  `ITEMERSATZTEIL` varchar(255) DEFAULT NULL,
  `ITEMFKZ` varchar(255) DEFAULT NULL,
  `ITEMFREMDBEARB` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL1` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL2` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL3` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL4` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL5` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL6` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL7` varchar(255) DEFAULT NULL,
  `ITEMERPMERKMAL8` varchar(255) DEFAULT NULL,
  `ITEMRELEASEDBY` varchar(255) DEFAULT NULL,
  `ITEMRELEASEDAT` varchar(255) DEFAULT NULL,
  `ITEMRELEASEDCOMMENT` varchar(255) DEFAULT NULL,
  `ITEMMODIFIEDBY` varchar(255) DEFAULT NULL,
  `ITEMMODIFIEDAT` varchar(255) DEFAULT NULL,
  `ITEMCREATEDBY` varchar(255) DEFAULT NULL,
  `ITEMCREATEDAT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ITEMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstmessages
DROP TABLE IF EXISTS `sstmessages`;
CREATE TABLE IF NOT EXISTS `sstmessages` (
  `MESSAGETABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `MESSAGENR` varchar(50) DEFAULT NULL COMMENT 'Message Nummer',
  `MESSAGEPARENTID` int(11) DEFAULT NULL,
  `MESSAGEDESC` varchar(255) DEFAULT NULL COMMENT 'Message Beschreibung',
  `MESSAGEREFERENCE` varchar(50) DEFAULT NULL COMMENT 'Message Referenz',
  `MESSAGECATEGORY` varchar(255) DEFAULT NULL COMMENT 'Message Kategorie',
  `MESSAGESTATUS` varchar(10) DEFAULT NULL COMMENT 'Message Status',
  `MESSAGEASSIGNMENT` varchar(256) DEFAULT NULL COMMENT 'Message Zuweisung Personen',
  `MESSAGEBILLING` varchar(256) DEFAULT NULL COMMENT 'Message Abrechnungsart',
  `MESSAGETIMEBUDGET` varchar(256) DEFAULT NULL COMMENT 'Message Stundenbudget Abrechenbar',
  `MESSAGETIMEBUDGETINTERN` varchar(255) DEFAULT NULL COMMENT 'Stundenbudget intern',
  `MESSAGEBILLABLE` varchar(256) DEFAULT NULL COMMENT 'Abrechenbar',
  `MESSAGEBILLED` bit(1) DEFAULT NULL COMMENT 'Abgerechnet',
  `MESSAGEORDERPOS` varchar(256) DEFAULT NULL COMMENT 'Auftragsposition',
  `MESSAGEINTERN` varchar(256) DEFAULT NULL COMMENT 'Interne Notiz',
  `MESSAGESTARTDATE` datetime DEFAULT NULL COMMENT 'Start',
  `MESSAGEENDDATE` datetime DEFAULT NULL COMMENT 'Umsetzung bis',
  `MESSAGECUSTOMC01` varchar(50) DEFAULT NULL COMMENT 'ToDoListe Kategorie',
  `MESSAGECUSTOMC02` varchar(50) DEFAULT NULL COMMENT 'ToDoListe VorgangsID',
  `MESSAGECUSTOMC03` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC04` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC05` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC06` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC07` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC08` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC09` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC10` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC11` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC12` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC13` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC14` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC15` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC16` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC17` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC18` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC19` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMC20` varchar(50) DEFAULT NULL,
  `MESSAGECUSTOMD01` datetime DEFAULT NULL COMMENT 'Umsetzung bis',
  `MESSAGECUSTOMD02` datetime DEFAULT NULL,
  `MESSAGECUSTOMD03` datetime DEFAULT NULL,
  `MESSAGECUSTOMD04` datetime DEFAULT NULL,
  `MESSAGECUSTOMD05` datetime DEFAULT NULL,
  `MESSAGECUSTOMN01` double DEFAULT NULL,
  `MESSAGECUSTOMN02` double DEFAULT NULL,
  `MESSAGECUSTOMN03` double DEFAULT NULL,
  `MESSAGECUSTOMN04` double DEFAULT NULL,
  `MESSAGECUSTOMN05` double DEFAULT NULL,
  `MESSAGECUSTOMRTF` longtext DEFAULT NULL COMMENT 'Kommentar',
  `MESSAGETOOLTIP` longtext DEFAULT NULL COMMENT 'Tooltip (Kommentar als Text)',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`MESSAGETABLEID`),
  KEY `MESSAGEIX01` (`MESSAGENR`),
  KEY `MESSAGEIX02` (`MESSAGEREFERENCE`),
  KEY `MESSAGEIX03` (`MESSAGECATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstpaymentterms
DROP TABLE IF EXISTS `sstpaymentterms`;
CREATE TABLE IF NOT EXISTS `sstpaymentterms` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERNO` varchar(50) DEFAULT NULL,
  `PTNAME` varchar(56) DEFAULT '' COMMENT 'Name der Zahlungsbedingung',
  `PTCOMMENT` varchar(255) DEFAULT '' COMMENT 'Zahlungsbedingung zum Drucken',
  `PTPERCENT01` double DEFAULT 0 COMMENT 'Prozent',
  `PTDAYS01` int(11) DEFAULT 0 COMMENT 'bis Tage',
  `PTAMOUNT01` double DEFAULT 0,
  `PTDATE01` datetime DEFAULT NULL,
  `PTPERCENT02` double DEFAULT 0,
  `PTDAYS02` int(11) DEFAULT 0,
  `PTAMOUNT02` double DEFAULT 0,
  `PTDATE02` datetime DEFAULT NULL,
  `PTPERCENT03` double DEFAULT 0,
  `PTDAYS03` int(11) DEFAULT 0,
  `PTAMOUNT03` double DEFAULT 0,
  `PTDATE03` datetime DEFAULT NULL,
  `PTPERCENT04` double DEFAULT 0,
  `PTDAYS04` int(11) DEFAULT 0,
  `PTAMOUNT04` double DEFAULT 0,
  `PTDATE04` datetime DEFAULT NULL,
  `PTDATEMAX` datetime DEFAULT NULL,
  `PTTEXT` varchar(1024) DEFAULT NULL,
  `PTTEXTWITHDAYS` varchar(1024) DEFAULT '' COMMENT 'Pattern zu ersetzen mit Tagesdatum',
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_sstpaymentterms_ORDERNO` (`ORDERNO`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstprocalchdr
DROP TABLE IF EXISTS `sstprocalchdr`;
CREATE TABLE IF NOT EXISTS `sstprocalchdr` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECTNR` varchar(50) DEFAULT '' COMMENT 'Projektnummer Ref',
  `CALCNUMBER` varchar(20) DEFAULT '' COMMENT 'Fortlaufende Nummer der Kalkulationen (ref auf pos)',
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sstprocalchdr_CALCNUMBER` (`CALCNUMBER`),
  KEY `IDX_sstprocalchdr_PROJECTNR` (`PROJECTNR`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Kopfsatz für Projektkalkulation';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstprocalcpos
DROP TABLE IF EXISTS `sstprocalcpos`;
CREATE TABLE IF NOT EXISTS `sstprocalcpos` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `CALCNUMBER` varchar(20) DEFAULT '',
  `PROJECTNR` varchar(50) DEFAULT '' COMMENT 'Projektnummer',
  `HEADERID` int(11) NOT NULL COMMENT 'Tableid Parts der Mutter',
  `POSID` int(11) NOT NULL COMMENT 'Tableid Parts vom Kind',
  `HEADERNO` varchar(128) NOT NULL COMMENT 'Artikelnummer der Mutter',
  `POS` int(11) DEFAULT 0 COMMENT 'Positionsnummer der Stückliste',
  `POSNO` varchar(128) NOT NULL COMMENT 'Artikelnummer vom Kind',
  `PATHTREE` varchar(767) DEFAULT '' COMMENT 'Artikelnummerpfad komplett ',
  `PATHTREEORIGIN` varchar(767) DEFAULT '' COMMENT 'Pathtree vom Projekt',
  `QUANTITY` double DEFAULT 0 COMMENT 'Menge auf der Position',
  `QUANTITYLEVEL` double DEFAULT 0 COMMENT 'Menge auf dem Level ',
  `QUANTITYUNIT` varchar(10) DEFAULT '' COMMENT 'Mengeneinheit',
  `COST01FIXIS` bit(1) DEFAULT b'0' COMMENT 'Kosten 01 sind fix keine Baugruppenauflösung',
  `COST01FIX` double DEFAULT 0 COMMENT 'fixe  Kosten 01',
  `COST01FIXDATE` date DEFAULT NULL,
  `COST01FIXORIGIN` varchar(64) DEFAULT '',
  `COST02FIXIS` bit(1) DEFAULT b'0' COMMENT 'Kosten 02 sind fix keine Baugruppenauflösung',
  `COST02FIX` double DEFAULT 0 COMMENT 'fixe  Kosten 02',
  `COST02FIXDATE` date DEFAULT NULL,
  `COST02FIXORIGIN` varchar(64) DEFAULT NULL,
  `COST01BOM` double DEFAULT 0,
  `COST01BOMDATE` date DEFAULT NULL,
  `COST01BOMORIGIN` varchar(64) DEFAULT '' COMMENT 'woher kommen die Kosten',
  `COST02BOM` double DEFAULT 0,
  `COST02BOMDATE` date DEFAULT NULL,
  `COST02BOMORIGIN` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sstprocalcpos` (`CALCNUMBER`,`HEADERNO`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstprojects
DROP TABLE IF EXISTS `sstprojects`;
CREATE TABLE IF NOT EXISTS `sstprojects` (
  `PROJECTTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECTNR` varchar(50) DEFAULT '' COMMENT 'Projektnummer',
  `PROJECTREFERENCE` varchar(255) DEFAULT '' COMMENT 'Projektnummer Referenz ERP',
  `PROJECTNAME` varchar(128) DEFAULT '' COMMENT 'Projektname',
  `PROJECTDESC` varchar(255) DEFAULT '' COMMENT 'Projektbeschreibung',
  `PROJECTPARTNO` varchar(128) DEFAULT '' COMMENT 'Artikelnummer des Projektes',
  `PROJVARIANT` varchar(50) DEFAULT '' COMMENT 'Variante des Projekts',
  `PROJECTSTATUS` varchar(50) DEFAULT '' COMMENT 'Projektstatus aktuell',
  `PROJECTART` varchar(255) DEFAULT '' COMMENT 'Projektart',
  `PROJECTVISIBILITY` bit(1) DEFAULT b'0' COMMENT 'Projektsichtbarkeit',
  `PROJECTASSIGNMENT` mediumtext DEFAULT '' COMMENT 'Zugewiesene Mitarbeiter Projekt',
  `PROJECTBUDGET` varchar(50) DEFAULT '' COMMENT 'Projektbudget',
  `PROJECTCONTACT` varchar(255) DEFAULT '' COMMENT 'Kontakt beim Kunden',
  `PROJECTTRADEPERSON` varchar(255) DEFAULT '' COMMENT 'Verantwortlicher Kaufmännisch',
  `PROJECTTECHPERSON` varchar(255) DEFAULT '' COMMENT 'Verantwortlicher Technisch',
  `PROJECTCUSTOMER` varchar(255) DEFAULT '' COMMENT 'Kundenname',
  `PROJECTCUSTOMERDESC` varchar(255) DEFAULT '' COMMENT 'Kundenbeschreibung',
  `PROJECTLOCATION` varchar(255) DEFAULT '' COMMENT 'Projektstandort (Bsp: Anlagenstandort)',
  `PROJECTTIMEBUDGET` varchar(255) DEFAULT '' COMMENT 'Zeitbudget Abrechenbar',
  `PROJECTTIMEBUDGETCONTROLL` varchar(255) DEFAULT '' COMMENT 'Zeitbudget Intern',
  `PROJECTWORTH` varchar(255) DEFAULT '' COMMENT 'Wert des Projekts',
  `PROJECTSTARTDATE` datetime DEFAULT NULL COMMENT 'Projektstart',
  `PROJECTENDDATE` datetime DEFAULT NULL COMMENT 'Projektende',
  `PROJECTCUSTOMC01` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC02` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC03` varchar(50) DEFAULT '',
  `PROJECTCUSTOM04` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC05` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC06` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC07` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC08` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC09` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC10` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC11` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC12` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC13` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC14` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC15` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC16` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC17` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC18` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC19` varchar(50) DEFAULT '',
  `PROJECTCUSTOMC20` varchar(50) DEFAULT '',
  `PROJECTCUSTOMD01` datetime DEFAULT NULL COMMENT 'Bereitstellungsdatum',
  `PROJECTCUSTOMD02` datetime DEFAULT NULL,
  `PROJECTCUSTOMD03` datetime DEFAULT NULL,
  `PROJECTCUSTOMD04` datetime DEFAULT NULL,
  `PROJECTCUSTOMD05` datetime DEFAULT NULL,
  `PROJECTCUSTOMN01` double DEFAULT 0,
  `PROJECTCUSTOMN02` double DEFAULT 0,
  `PROJECTCUSTOMN03` double DEFAULT 0,
  `PROJECTCUSTOMN04` double DEFAULT 0,
  `PROJECTCUSTOMN05` double DEFAULT 0,
  `PROJECTGROUP01` varchar(64) DEFAULT '',
  `PROJECTGROUP02` varchar(64) DEFAULT '',
  `PROJECTGROUP03` varchar(64) DEFAULT '',
  `PROJECTGROUP04` varchar(64) DEFAULT '',
  `PROJECTGROUP05` varchar(64) DEFAULT '',
  `PROJECTGROUP06` varchar(64) DEFAULT '',
  `PROJECTGROUP07` varchar(64) DEFAULT '',
  `PROJECTGROUP08` varchar(64) DEFAULT '',
  `PROJECTGROUP09` varchar(64) DEFAULT '',
  `PROJECTGROUP10` varchar(64) DEFAULT '',
  `PROJECTCUSTOMB01` bit(1) DEFAULT b'0',
  `PROJECTCUSTOMB02` bit(1) DEFAULT b'0',
  `PROJECTCUSTOMB03` bit(1) DEFAULT b'0',
  `PROJECTCUSTOMB04` bit(1) DEFAULT b'0',
  `PROJECTCUSTOMB05` bit(1) DEFAULT b'0',
  `PROJECTCUSTOMRTF` mediumtext DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`PROJECTTABLEID`),
  UNIQUE KEY `UK_sstprojects_PROJECTNR` (`PROJECTNR`),
  KEY `PROJECTIX01` (`PROJECTNR`),
  KEY `PROJECTIX02` (`PROJECTREFERENCE`),
  KEY `PROJECTIX03` (`PROJECTNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=3276;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstpuoheader
DROP TABLE IF EXISTS `sstpuoheader`;
CREATE TABLE IF NOT EXISTS `sstpuoheader` (
  `PUOTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERNO` varchar(50) DEFAULT NULL COMMENT 'BestellNr',
  `COMMENT` varchar(128) DEFAULT NULL COMMENT 'Stichwort Bestellung',
  `ORDERTYPE` varchar(20) DEFAULT NULL COMMENT 'BestellTyp (Anfrage,Bestellung)',
  `BUSINESSNO` varchar(50) DEFAULT NULL COMMENT 'Lieferanten-Nummer',
  `BUSCOMPANY` varchar(256) DEFAULT NULL COMMENT 'Lieferant Bezeichnung',
  `BUSADDRESS1` varchar(256) DEFAULT NULL COMMENT 'Adresse 1',
  `BUSADDRESS2` varchar(256) DEFAULT NULL COMMENT 'Adresse 2',
  `BUSADDRESS3` varchar(256) DEFAULT NULL COMMENT 'Adresse 3',
  `BUSADDRESS4` varchar(256) DEFAULT NULL COMMENT 'Adresse 4',
  `BUSADRPOBOX` varchar(256) DEFAULT NULL COMMENT 'Postfach',
  `BUSADRPOBOXZIP` varchar(256) DEFAULT NULL COMMENT 'PLZ Postfach',
  `BUSSTREET` varchar(256) DEFAULT NULL COMMENT 'Strasse',
  `BUSZIP` varchar(256) DEFAULT NULL COMMENT 'PLZ',
  `BUSCOUNTRYCODE` varchar(3) DEFAULT NULL COMMENT 'Länder-Code',
  `BUSCITY` varchar(256) DEFAULT NULL COMMENT 'Ort',
  `BUSCONTACTNAME` varchar(256) DEFAULT NULL COMMENT 'Kontakt-Name',
  `BUSCONTACTTEL` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Telefon',
  `BUSCONTACTMOBILE` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Mobil',
  `BUSCONTACTFAX` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Fax',
  `BUSCONTACTEMAIL` varchar(256) DEFAULT NULL COMMENT 'Kontakt-Email',
  `BUSCLERKNAME` varchar(256) DEFAULT NULL COMMENT 'Sachbearbeiter-Name',
  `BUSCLERKTEL` varchar(50) DEFAULT NULL COMMENT 'Sachbearbeiter-Telefon',
  `BUSCLERKMOBILE` varchar(50) DEFAULT NULL COMMENT 'Sachbearbeiter-Mobil',
  `BUSCLERKFAX` varchar(50) DEFAULT NULL COMMENT 'Sachbearbeiter-Fax',
  `BUSCLERKEMAIL` varchar(256) DEFAULT NULL COMMENT 'Sachbearbeiter-Email',
  `STATUS` varchar(10) DEFAULT NULL COMMENT 'Bestell-Status',
  `ORDEROUTPUT` varchar(10) DEFAULT NULL COMMENT 'Bestellausgang',
  `ORDEROUTPUTDATE` datetime DEFAULT NULL COMMENT 'Bestellausgang',
  `VATKEY` int(11) DEFAULT NULL COMMENT 'Umsatz-Steuerschlüssel Lieferant',
  `REQUESTEDDELIVERYDAY` datetime DEFAULT NULL COMMENT 'Lieferdatum (Bei WE Lieferscheindatum)',
  `REQUESTEDDELIVERYCWEEK` int(11) DEFAULT NULL COMMENT 'Liefer-KW ',
  `CONFIRMATIONDATE` datetime DEFAULT NULL COMMENT 'Liefertermin bestätigt',
  `CONFIRMATIONDATEWEEK` int(11) DEFAULT NULL COMMENT 'Liefer-KW bestätigt',
  `ORDERDATE` datetime DEFAULT NULL COMMENT 'Bestelldatum',
  `DELIVERYNOTEDATE` datetime DEFAULT NULL,
  `DELIVERYNOTENR` varchar(50) DEFAULT NULL,
  `COMMISSION` varchar(256) DEFAULT NULL COMMENT 'Kommission',
  `DISCOUNT` double DEFAULT NULL COMMENT 'Kunden-Rabatt %',
  `ORDERDISCOUNT` double DEFAULT NULL COMMENT 'Auftrags-Rabatt',
  `ORDERDISCRULE` varchar(50) DEFAULT NULL COMMENT 'Auftragsrabatt  Regel (%oder Wert)',
  `ORDERDISCNAME` varchar(50) DEFAULT NULL COMMENT 'Auftragsrabatt Bezeichnung',
  `CHARGEPACKAGE` double DEFAULT NULL COMMENT 'Zuschlag Verpackung (Wert)',
  `CHARGEFORWARD` double DEFAULT NULL COMMENT 'Zuschlag Versand (Wert)',
  `CHARGEMINVALUE` double DEFAULT NULL COMMENT 'Zuschlag Mindermengen (Wert)',
  `CHARGEINSURANCE` double DEFAULT NULL COMMENT 'Zuschlag Versicherung (Wert)',
  `TERMSOFPAYMENT` varchar(50) DEFAULT NULL COMMENT 'Zahlungsbedingungen',
  `TERMSOFDELIVERY` varchar(255) DEFAULT NULL COMMENT 'Frankatur (Incoterms)',
  `MODEOFDELIVERY` varchar(50) DEFAULT NULL COMMENT 'Versandart',
  `FREIGHTFORWARDER` varchar(50) DEFAULT NULL COMMENT 'Spediteur',
  `PARTDELIVERY` varchar(50) DEFAULT NULL COMMENT 'Teillieferung möglich',
  `INTRABUSTYPE` varchar(50) DEFAULT NULL COMMENT 'Intrastat Art des Geschäfts (EU Statistik)',
  `INTRAMODE` varchar(50) DEFAULT NULL COMMENT 'Intrastat Verfahren (EU Statistik)',
  `CURRENCY` varchar(5) DEFAULT NULL COMMENT 'Währung Haus',
  `CURRENCYFOREIGN` varchar(5) DEFAULT NULL COMMENT 'Waehrung Fremd',
  `CURRENCYRATE` double DEFAULT NULL COMMENT 'Währungskurs',
  `CURRENCYRATEUNIT` double DEFAULT NULL COMMENT 'Währungseinheit wenn Kurs z.b. auf 1000 ist',
  `CUSTOMC01` varchar(256) DEFAULT NULL,
  `CUSTOMC02` varchar(256) DEFAULT NULL,
  `CUSTOMC03` varchar(256) DEFAULT NULL,
  `CUSTOMC04` varchar(256) DEFAULT NULL,
  `CUSTOMC05` varchar(256) DEFAULT NULL,
  `CUSTOMC06` varchar(256) DEFAULT NULL,
  `CUSTOMC07` varchar(256) DEFAULT NULL,
  `CUSTOMC08` varchar(256) DEFAULT NULL,
  `CUSTOMC09` varchar(256) DEFAULT NULL,
  `CUSTOMC10` varchar(256) DEFAULT NULL,
  `CUSTOMN01` double DEFAULT NULL,
  `CUSTOMN02` double DEFAULT NULL,
  `CUSTOMN03` double DEFAULT NULL,
  `CUSTOMN04` double DEFAULT NULL,
  `CUSTOMN05` double DEFAULT NULL,
  `CUSTOMD01` datetime DEFAULT NULL,
  `CUSTOMD02` datetime DEFAULT NULL,
  `CUSTOMD03` datetime DEFAULT NULL,
  `CUSTOMD04` datetime DEFAULT NULL,
  `CUSTOMD05` datetime DEFAULT NULL,
  `CUSTOMB01` bit(1) DEFAULT b'0',
  `CUSTOMB02` bit(1) DEFAULT b'0',
  `CUSTOMB03` bit(1) DEFAULT b'0',
  `CUSTOMB04` bit(1) DEFAULT b'0',
  `CUSTOMB05` bit(1) DEFAULT b'0',
  `TXTHEADER` longtext DEFAULT NULL COMMENT 'Text AB/Angebot',
  `TXTFOODER` longtext DEFAULT NULL COMMENT 'Text Lieferschein',
  `BLANKEDORDER` varchar(50) DEFAULT NULL COMMENT 'Rahmenauftrag',
  `BLANKEDVALIDFROM` datetime DEFAULT NULL COMMENT 'Rahmen gültig ab',
  `BLANKEDVALIDTO` datetime DEFAULT NULL COMMENT 'Rahmen gültig bis',
  `ORDERSUM` double DEFAULT NULL COMMENT 'Netto Summe Hauswährung',
  `ORDERSUMFOREIGN` double DEFAULT NULL COMMENT 'Netto Summe Fremwährung',
  `ORDERSUMVAT` double DEFAULT NULL COMMENT 'Summe Steuer Hauswährung',
  `ORDERPAYDAY` datetime DEFAULT NULL COMMENT 'Bezahlen bis',
  `ORDEROUTDATE` datetime DEFAULT NULL,
  `ORDEROUTTYPE` varchar(10) DEFAULT NULL,
  `ORDEROUTUSER` varchar(50) DEFAULT NULL,
  `COMMENTRTF` text DEFAULT NULL COMMENT 'Kommentar mit Formatierung',
  `SELECTEDFILESFORMAIL` text DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`PUOTABLEID`),
  UNIQUE KEY `ORDERNO` (`ORDERNO`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=68385;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstpuoinvoiceheader
DROP TABLE IF EXISTS `sstpuoinvoiceheader`;
CREATE TABLE IF NOT EXISTS `sstpuoinvoiceheader` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `INVOICENO` varchar(50) DEFAULT '' COMMENT 'Rechnungsnr',
  `COMMENT` varchar(128) DEFAULT '' COMMENT 'Stichwort Rechnung',
  `ORDERTYPE` varchar(20) DEFAULT '' COMMENT 'Rechnungseingangstyp',
  `BUSINESSNO` varchar(50) DEFAULT '' COMMENT 'Lieferanten-Nummer',
  `STATUS` varchar(10) DEFAULT '' COMMENT 'Status',
  `VATKEY` int(11) DEFAULT 1 COMMENT 'Umsatz-Steuerschlüssel Lieferant',
  `INVOICEDATE` datetime DEFAULT NULL COMMENT 'Rechnungsdatumdatum',
  `COMMISSION` varchar(256) DEFAULT '' COMMENT 'Kommission',
  `CHARGEPACKAGE` double DEFAULT 0 COMMENT 'Zuschlag Verpackung (Wert)',
  `CHARGEFORWARD` double DEFAULT 0 COMMENT 'Zuschlag Versand (Wert)',
  `CHARGEMINVALUE` double DEFAULT 0 COMMENT 'Zuschlag Mindermengen (Wert)',
  `CHARGEINSURANCE` double DEFAULT 0 COMMENT 'Zuschlag Versicherung (Wert)',
  `TERMSOFPAYMENT` varchar(50) DEFAULT '' COMMENT 'Zahlungsbedingungen',
  `TERMSOFDELIVERY` varchar(255) DEFAULT '' COMMENT 'Frankatur (Incoterms)',
  `CURRENCY` varchar(5) DEFAULT '' COMMENT 'Währung Haus',
  `CURRENCYFOREIGN` varchar(5) DEFAULT '' COMMENT 'Waehrung Fremd',
  `CURRENCYRATE` double DEFAULT 0 COMMENT 'Währungskurs',
  `CURRENCYRATEUNIT` double DEFAULT 0 COMMENT 'Währungseinheit wenn Kurs z.b. auf 1000 ist',
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMC06` varchar(256) DEFAULT '',
  `CUSTOMC07` varchar(256) DEFAULT '',
  `CUSTOMC08` varchar(256) DEFAULT '',
  `CUSTOMC09` varchar(256) DEFAULT '',
  `CUSTOMC10` varchar(256) DEFAULT '',
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMD01` datetime DEFAULT NULL,
  `CUSTOMD02` datetime DEFAULT NULL,
  `CUSTOMD03` datetime DEFAULT NULL,
  `CUSTOMD04` datetime DEFAULT NULL,
  `CUSTOMD05` datetime DEFAULT NULL,
  `CUSTOMB01` bit(1) DEFAULT b'0',
  `CUSTOMB02` bit(1) DEFAULT b'0',
  `CUSTOMB03` bit(1) DEFAULT b'0',
  `CUSTOMB04` bit(1) DEFAULT b'0',
  `CUSTOMB05` bit(1) DEFAULT b'0',
  `INVOICESUM` double DEFAULT 0 COMMENT 'Netto Summe Hauswährung',
  `INVOICESUMFOREIGN` double DEFAULT 0 COMMENT 'Netto Summe Fremdwährung',
  `INVOICESUMVAT` double DEFAULT 0 COMMENT 'Summe Steuer Hauswährung',
  `INVOICEPAYDAY` datetime DEFAULT NULL COMMENT 'Bezahlen bis',
  `INVOICEBOOKINGDATE` datetime DEFAULT NULL COMMENT 'Buchungsdatum Rechnung',
  `INVOICEBOOKINGTYPE` varchar(10) DEFAULT '' COMMENT 'Buchungstyp Rechnung',
  `INVOICEBOOKINGUSER` varchar(50) DEFAULT '' COMMENT 'Buchung Benutzer',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_sstpuoinvoiceheader_INVOICENO` (`INVOICENO`),
  KEY `IDX_sstpuoinvoiceheader` (`STATUS`,`BUSINESSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=68385;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstpuoinvoicepos
DROP TABLE IF EXISTS `sstpuoinvoicepos`;
CREATE TABLE IF NOT EXISTS `sstpuoinvoicepos` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `INVOICENO` varchar(50) DEFAULT '' COMMENT 'Rechnungsnr',
  `INVOICEPOS` int(11) DEFAULT 0 COMMENT 'Positions-Nummer',
  `COMMISSION` varchar(50) DEFAULT '' COMMENT 'Projekt / Referenz',
  `ARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikel-Nummer',
  `VARIANT` varchar(50) DEFAULT '' COMMENT 'Variante',
  `VENDORARTICLENO` varchar(128) DEFAULT '' COMMENT 'Lieferanten-Artikelnummer',
  `POSTYPE` varchar(50) DEFAULT '' COMMENT 'Typ Position',
  `STATUS` varchar(50) DEFAULT '' COMMENT 'Positions-Status',
  `ORDERQTY` double DEFAULT 1 COMMENT 'Bestell-Menge',
  `ARRIVALQTY` double DEFAULT 1 COMMENT 'Wareneingangsmenge',
  `INVOICEQTY` double DEFAULT 1 COMMENT 'Rechnungsmenge',
  `ORDERUNIT` varchar(10) DEFAULT '' COMMENT 'Mengeneinheit',
  `ORDERQTYVPE` double DEFAULT 1 COMMENT 'Anzahl VPEs',
  `QUANTITYVPE` double DEFAULT 1 COMMENT 'Menge von VPE (Bsp. 5 pro VPE)',
  `ORDERPRICE` double DEFAULT 0 COMMENT 'Bestellpreis',
  `ORDERPRICESUM` double DEFAULT 0 COMMENT 'Bestellpreis Summe',
  `INVOICEPRICE` double DEFAULT 0 COMMENT 'Rechnungspreis',
  `INVOICEPRICESUM` double DEFAULT 0 COMMENT 'Rechnungspreis Sume',
  `VATKEY` int(11) DEFAULT NULL COMMENT 'Steuer-Schlüssel Gepa+Artikel',
  `VAT` double DEFAULT 0 COMMENT 'ermittelter Steuersatz Prozent',
  `ACCOUNT` varchar(50) DEFAULT '' COMMENT 'Buchungskonto',
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMC06` varchar(256) DEFAULT '',
  `CUSTOMC07` varchar(256) DEFAULT '',
  `CUSTOMC08` varchar(256) DEFAULT '',
  `CUSTOMC09` varchar(256) DEFAULT '',
  `CUSTOMC10` varchar(256) DEFAULT '',
  `CUSTOMD01` datetime DEFAULT NULL,
  `CUSTOMD02` datetime DEFAULT NULL,
  `CUSTOMD03` datetime DEFAULT NULL,
  `CUSTOMD04` datetime DEFAULT NULL,
  `CUSTOMD05` datetime DEFAULT NULL,
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMB01` bit(1) DEFAULT NULL,
  `CUSTOMB02` bit(1) DEFAULT NULL,
  `CUSTOMB03` bit(1) DEFAULT NULL,
  `CUSTOMB04` bit(1) DEFAULT NULL,
  `CUSTOMB05` bit(1) DEFAULT NULL,
  `POSCOMMENT` text DEFAULT '' COMMENT 'Kommentar für einzelne Position',
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_sstpuoinvoicepos` (`INVOICENO`,`INVOICEPOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=780 COMMENT='Rechnungseingangspositionen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstpuopos
DROP TABLE IF EXISTS `sstpuopos`;
CREATE TABLE IF NOT EXISTS `sstpuopos` (
  `POPTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERNO` varchar(50) DEFAULT '' COMMENT 'Bestell-Nummer',
  `ORDERPOS` int(11) DEFAULT NULL COMMENT 'Positions-Nummer',
  `ORDERNOBEFORE` varchar(50) DEFAULT '',
  `ORDERPOSBEFORE` int(11) DEFAULT NULL,
  `COMMISSION` varchar(50) DEFAULT '' COMMENT 'Projekt / Referenz',
  `ARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikel-Nummer',
  `VARIANT` varchar(50) DEFAULT '' COMMENT 'Variante',
  `POSCADVERSION` varchar(10) DEFAULT '',
  `VENDORARTICLENO` varchar(128) DEFAULT '' COMMENT 'Lieferanten-Artikelnummer',
  `TEXT` text DEFAULT '' COMMENT 'Text Bestellposition',
  `DIM1` double DEFAULT 0 COMMENT 'Länge Stkl.',
  `DIM2` double DEFAULT 0 COMMENT 'Breite Stkl.',
  `DIM3` double DEFAULT 0 COMMENT 'Höhe Stkl.',
  `VAR1` varchar(256) DEFAULT '' COMMENT 'Varchar 1 Stkl. (Bsp. Endbearbeitung)',
  `VAR2` varchar(256) DEFAULT '' COMMENT 'Varchar 2 Stkl.',
  `VAR3` varchar(256) DEFAULT '' COMMENT 'Varchar 3 Stkl.',
  `POSTYPE` varchar(50) DEFAULT '' COMMENT 'Phantomteil, Beistellteil, ..',
  `STATUS` varchar(50) DEFAULT '' COMMENT 'Positions-Status',
  `ORDERQTY` double DEFAULT 1 COMMENT 'Bestell-Menge',
  `ORDERQTYORIGIN` double DEFAULT 1 COMMENT 'Ursprüngliche Menge aus PÜL / Ursprung',
  `ORDERUNIT` varchar(10) DEFAULT '' COMMENT 'Mengeneinheit',
  `ORDERQTYVPE` double DEFAULT 1 COMMENT 'Anzahl VPEs bestellt',
  `QUANTITYVPE` double DEFAULT 1 COMMENT 'Menge von VPE (Bsp. 5 pro VPE)',
  `ORDERQTYMIN` double DEFAULT 1 COMMENT 'Mindestbestellmenge aus Lieferanten-Artikel-Beziehung',
  `SALESPRICE` double DEFAULT 0 COMMENT 'Preis Hauswährung',
  `SALESPRICEFOREIGN` double DEFAULT 0 COMMENT 'Preis Fremdwährung',
  `VATKEY` int(11) DEFAULT NULL COMMENT 'Steuer-Schlüssel Gepa+Artikel',
  `VAT` double DEFAULT 0 COMMENT 'ermittelter Steuersatz Prozent',
  `PRICEORIGIN` double DEFAULT 0 COMMENT 'Preis ohne Rabatt',
  `PRICEORIGINFROM` varchar(10) DEFAULT '' COMMENT 'Preis Ursprung (part, letzter Ek..)',
  `PRICEORIGINFOREIGN` double DEFAULT 0 COMMENT 'Preis ohne Rabatt Fremdwährung',
  `PRICEORIGINDISCOUNT` bit(1) DEFAULT NULL COMMENT 'Preis ist ohne = 0 / mit = 1 Rabatt',
  `REQUESTEDDELIVERYDAY` datetime DEFAULT NULL COMMENT 'Liefertermin gewünscht',
  `REQUESTEDDELIVERYCWEEK` int(11) DEFAULT NULL COMMENT 'Liefer-Kalenderwoche gewünscht',
  `CONFIRMATIONNO` varchar(50) DEFAULT '' COMMENT 'Nr. Auftragsbestätigung',
  `CONFIRMATIONDATE` datetime DEFAULT NULL COMMENT 'Liefertermin bestätigt',
  `CONFIRMATIONDATEWEEK` int(11) DEFAULT NULL COMMENT 'Liefer-Kalenderwoche bestätigt',
  `BLANKETNR` varchar(50) DEFAULT '' COMMENT 'Rahmenauftrag',
  `BLANKETPOS` int(11) DEFAULT NULL COMMENT 'Positions-Nummer Rahmenauftrag',
  `DELIVERYNR` varchar(50) DEFAULT '' COMMENT 'Lieferschein Nummer',
  `DELIVERYQUANTITY` double DEFAULT 0 COMMENT 'gelieferte Menge',
  `DELIVERYDATE` datetime DEFAULT NULL COMMENT 'Liefertermin tatsächlich',
  `DELIVERYDATEWEEK` int(11) DEFAULT NULL COMMENT 'Liefer-Kalenderwoche tatsächlich',
  `DELIVERYNOTEDATE` datetime DEFAULT NULL,
  `DELIVERYQUANTITYLASTBOOKING` double DEFAULT 0 COMMENT 'Letzte Buchungsmenge für Projektkiste',
  `DELIVERYQUANTITYLASTBOOKINGSTORAGE` double DEFAULT 0 COMMENT 'Letzte Buchungsmenge für Haupt-Lager (Splitten)',
  `DELIVERYSTORAGELASTBOOKINGFORSTOCK` varchar(50) DEFAULT '' COMMENT 'Letzter Lagerort für Haupt-Lager (Splitten)',
  `INVOICENO` varchar(50) DEFAULT '' COMMENT 'Rechnungsnummer',
  `INVOICEDATE` varchar(50) DEFAULT '' COMMENT 'Rechnungsdatum',
  `INVOICEDQUANTITY` double DEFAULT 0 COMMENT 'berechnete Menge',
  `PARTPRICEUNIT` double DEFAULT 1 COMMENT 'Preiseinheit Menge (Preis bezieht sich auf diese Menge)',
  `POSSUMPRICE` double DEFAULT 0 COMMENT 'Wert Position',
  `POSSUMPRICEFOREIGN` double DEFAULT 0 COMMENT 'Wert Position Fremdwährung',
  `POSINVSUMPRICE` double DEFAULT 0 COMMENT 'Rechnungswert Position',
  `POSINVSUMPRICEFOREIGN` double DEFAULT 0 COMMENT 'Rechnungswert Position Fremdwährung',
  `POSACCOUNTTEXT` text DEFAULT '',
  `QUALITYTEXT` varchar(1024) DEFAULT '' COMMENT 'Text Qualitätsprüfung',
  `QUALITYREMARKS` varchar(1024) DEFAULT '' COMMENT 'Text Bemerkung Qualitätsprüfung',
  `QUALITYFLAG` bit(1) DEFAULT NULL COMMENT 'Kennzeichen Qualitätsprüfung',
  `VENDISCOUNT` double DEFAULT 0 COMMENT 'Lieferanten-Rabatt',
  `ARTDISCOUNT1` double DEFAULT 0 COMMENT 'Artikel-Rabatt',
  `ARTDISCOUNTRULE1` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt Rechenregel',
  `ARTDISCONTNAME1` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt Bezeichnung',
  `ARTDISCOUNT2` double DEFAULT 0 COMMENT 'Artikel-Rabatt 2',
  `ARTDISCOUNTRULE2` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt 2 Rechenregel',
  `ARTDISCOUNTNAME2` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt 2 Bezeichnung',
  `ARTDISCOUNT3` double DEFAULT 0 COMMENT 'Artikel-Rabatt 3',
  `ARTDISCOUNTRULE3` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt 3 Rechenregel',
  `ARTDISCOUNTNAME3` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt 3 Rechenregel',
  `COUNTRYORIGIN` varchar(50) DEFAULT '' COMMENT 'Ursprungsland',
  `INTRAREGION` varchar(50) DEFAULT '' COMMENT 'Intrastat Region',
  `DISORDERNO` varchar(10) DEFAULT '',
  `STOCKDESCRIPTION` text DEFAULT '' COMMENT 'Lagerorte, von denen der Artikel genommen wurde',
  `DISORDERPOS` int(11) DEFAULT NULL,
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMC06` varchar(256) DEFAULT '',
  `CUSTOMC07` varchar(256) DEFAULT '',
  `CUSTOMC08` varchar(256) DEFAULT '',
  `CUSTOMC09` varchar(256) DEFAULT '',
  `CUSTOMC10` varchar(256) DEFAULT '',
  `CUSTOMD01` datetime DEFAULT NULL,
  `CUSTOMD02` datetime DEFAULT NULL,
  `CUSTOMD03` datetime DEFAULT NULL,
  `CUSTOMD04` datetime DEFAULT NULL,
  `CUSTOMD05` datetime DEFAULT NULL,
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMB01` bit(1) DEFAULT NULL,
  `CUSTOMB02` bit(1) DEFAULT NULL,
  `CUSTOMB03` bit(1) DEFAULT NULL,
  `CUSTOMB04` bit(1) DEFAULT NULL,
  `CUSTOMB05` bit(1) DEFAULT NULL,
  `POSCOMMENT` text DEFAULT '' COMMENT 'Kommentar für einzelne Position',
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`POPTABLEID`),
  KEY `ORDERNO` (`ORDERNO`,`ORDERPOS`,`DELIVERYNR`)
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=780 COMMENT='Bestellpositionen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstpzeresponse
DROP TABLE IF EXISTS `sstpzeresponse`;
CREATE TABLE IF NOT EXISTS `sstpzeresponse` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `BDETYPE` varchar(10) DEFAULT '' COMMENT 'Rückmeldevorgang',
  `FEEDBACKTYPE` varchar(10) DEFAULT '' COMMENT 'Rückmeldetyp',
  `RESPONSESTATION` varchar(20) DEFAULT '' COMMENT 'Rückmeldeterminal Name',
  `RESPONSENOBDE` double DEFAULT 0 COMMENT 'BdeNummer',
  `RESPONSENOPRJ` varchar(50) DEFAULT '' COMMENT 'Projektnummer',
  `RESPONSEWONO` varchar(50) DEFAULT '' COMMENT 'Wo Nummer',
  `STATUS` varchar(10) DEFAULT '' COMMENT 'Status Rückmeldung',
  `COSTCENTERNO` varchar(10) DEFAULT '' COMMENT 'KOstenstelle',
  `DATETIMESTART` datetime DEFAULT NULL COMMENT 'StartZeit',
  `DATETIMEEND` datetime DEFAULT NULL COMMENT 'Endezeit',
  `TIMEUSEDSUMIST` double DEFAULT 0 COMMENT 'gebrauchte Zeit',
  `TIMEUSEDPARTIST` double DEFAULT 0 COMMENT 'Gebrauchte Zeit pro Teil',
  `SHIFTMODELNO` varchar(20) DEFAULT '',
  `BREAKTIME01` double DEFAULT 0 COMMENT 'Pause 1',
  `BREAKTIME02` double DEFAULT 0 COMMENT 'Pause 2',
  `BREAKTIME03` double DEFAULT 0 COMMENT 'PAUSE 3',
  `EMPLOYEENO` varchar(10) DEFAULT '' COMMENT 'Mitarbeiter',
  `INPUTTYPE` varchar(10) DEFAULT NULL COMMENT 'EingabeArt',
  `TIMEPREPSUMIST` double DEFAULT 0 COMMENT 'Rüstzeit Ist',
  `TIMEPREPPARTIST` double DEFAULT 0 COMMENT 'Rüstzeit Ist pro Teil',
  `QUANTITYISTOK` double DEFAULT 0 COMMENT 'Gut-Menge',
  `EMPLOYEEANZAHL` double DEFAULT 0 COMMENT 'Anzahl Mitarbeiter',
  `MACHINEANZAHL` double DEFAULT 0 COMMENT 'Anzahl Maschinen',
  `COMMENT` varchar(2000) DEFAULT '' COMMENT 'Kommentar',
  `INTERRUPTION` varchar(10) DEFAULT '' COMMENT 'Störgrund',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sstpzeresponse_EMPLOYEENO` (`EMPLOYEENO`),
  KEY `IDX_sstpzeresponse_COSTCENTERNO` (`COSTCENTERNO`),
  KEY `IDX_sstpzeresponse_STATUS` (`STATUS`),
  KEY `IDX_sstpzeresponse` (`RESPONSENOBDE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Rückmeldedate PZE/BDE';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstsalesorder
DROP TABLE IF EXISTS `sstsalesorder`;
CREATE TABLE IF NOT EXISTS `sstsalesorder` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERNOBEFORE` varchar(50) DEFAULT '' COMMENT 'Auftrag-Nr. ',
  `ORDERNO` varchar(50) DEFAULT '' COMMENT 'Auftrag-Nr',
  `ORDERTYPE` varchar(50) DEFAULT '' COMMENT 'Auftrags-Art',
  `COMMISSION` varchar(255) DEFAULT '',
  `BUSINESSNO` varchar(50) DEFAULT '' COMMENT 'Kunden-Nummer',
  `LEDGERACCOUNTTYP` varchar(50) DEFAULT '' COMMENT 'Kontokorrent',
  `ORDERTITLE` varchar(255) DEFAULT '',
  `STATUS` varchar(50) DEFAULT '' COMMENT 'Auftrags-Status',
  `ORDERLANQUAGE` varchar(10) DEFAULT NULL COMMENT 'Sprache der Reports',
  `VATKEY` int(11) DEFAULT 0 COMMENT 'Umsatz-Steuer',
  `DELIVERYSTOP` bit(1) DEFAULT b'0' COMMENT 'Lieferstopp',
  `MANUFACTORINGSTOP` bit(1) DEFAULT b'0' COMMENT 'Produktionsstopp',
  `REQUESTEDDELIVERYDAY` datetime DEFAULT NULL COMMENT 'Lieferdatum gewünscht',
  `REQUESTEDDELIVERYCWEEK` int(11) DEFAULT 0 COMMENT 'Liefer-KW gewünscht',
  `PLANEDDELIVERYDAY` datetime DEFAULT NULL COMMENT 'Lieferdatum geplant',
  `PLANEDDELIVERYCWEEK` int(11) DEFAULT 0 COMMENT 'Liefer-KW geplant',
  `CUSORDERDATE` datetime DEFAULT NULL COMMENT 'Kunden-Bestelldatum',
  `CUSORDERNO` varchar(50) DEFAULT '' COMMENT 'Kunden-Bestellnummer',
  `CUSCOMMISSION` varchar(256) DEFAULT '' COMMENT 'Kunden-Kommission',
  `DATEORDERENTRY` datetime DEFAULT NULL COMMENT 'Auftrags-/Konditions-Datum ',
  `SALESORIGIN` varchar(50) DEFAULT '',
  `REFOFFERNO` varchar(50) DEFAULT '' COMMENT 'Angebots-Bezug',
  `REFINVOICENO` varchar(50) DEFAULT '' COMMENT 'Faktura-Bezug',
  `CUSRESPONSIBLE` varchar(50) DEFAULT '' COMMENT 'Kunde- Sachbearbeiter',
  `CUSRESPTEL` varchar(50) DEFAULT '' COMMENT 'Besteller Telefon',
  `CUSRESPMOBILE` varchar(56) DEFAULT NULL,
  `CUSRESPEMAIL` varchar(256) DEFAULT '' COMMENT 'Besteller Email',
  `CUSRESFAX` varchar(50) DEFAULT '' COMMENT 'Besteller Fax',
  `CLERKNAME` varchar(50) DEFAULT '' COMMENT 'Sachbearbeiter intern',
  `CLERKTEL` varchar(50) DEFAULT NULL,
  `CLERKMOBILE` varchar(50) DEFAULT NULL,
  `CLERKMAIL` varchar(255) DEFAULT NULL,
  `CLERKFAX` varchar(50) DEFAULT NULL,
  `CREDITCODE` varchar(50) DEFAULT '' COMMENT 'Kennung Gutschrift (Statistik)',
  `CUSDISCOUNT` double DEFAULT 0 COMMENT 'Kunden-Rabatt %',
  `ORDERDISCOUNT` double DEFAULT 0 COMMENT 'Auftrags-Rabatt',
  `ORDERDISCRULE` varchar(50) DEFAULT '' COMMENT 'Auftragsrabatt  Regel (%oder Wert)',
  `ORDERDISCNAME` varchar(50) DEFAULT '' COMMENT 'Auftragsrabatt Bezeichnung',
  `ORDERDISCOUNTFOREIGN` double DEFAULT 0 COMMENT 'Betrag Auftragsrabatt in Fremdwaehrung',
  `CHARGEPACKAGE` double DEFAULT 0 COMMENT 'Zuschlag Verpackung (Wert)',
  `CHARGEFORWARD` double DEFAULT 0 COMMENT 'Zuschlag Versand (Wert)',
  `CHARGEMINVALUE` double DEFAULT 0 COMMENT 'Zuschlag Mindermengen (Wert)',
  `CHARGEINSURANCE` double DEFAULT 0 COMMENT 'Zuschlag Versicherung (Wert)',
  `TERMSOFPAYMENT` varchar(50) DEFAULT '' COMMENT 'Zahlungsbedingungen',
  `TERMSOFDELIVERY` varchar(50) DEFAULT '' COMMENT 'Frankatur (Incoterms)',
  `MODEOFDELIVERY` varchar(50) DEFAULT '' COMMENT 'Versandart',
  `FREIGHTFORWARDER` varchar(50) DEFAULT '' COMMENT 'Spediteur',
  `DELIVERYTOUR` varchar(50) DEFAULT '' COMMENT 'Liefer-Tour',
  `PARTDELIVERY` varchar(50) DEFAULT '' COMMENT 'Teillieferung möglich',
  `INTRABUSTYPE` varchar(50) DEFAULT '' COMMENT 'Intrastat Art des Geschäfts',
  `INTRAMODE` varchar(50) DEFAULT '' COMMENT 'Intrastat Verfahren',
  `CURRENCYFOREIGN` varchar(5) DEFAULT '',
  `CURRENCY` varchar(5) DEFAULT '' COMMENT 'Haus-Währung',
  `CURRENCYRATE` double DEFAULT 0 COMMENT 'Währungskurs',
  `ORDERSUMCHARGE` double DEFAULT 0 COMMENT 'Auftrags-Zu/Abschlaege',
  `ORDERSUMPOSF` double DEFAULT 0 COMMENT 'Summe Positionen in Fremdwaehrung',
  `ORDERINVSUM` double DEFAULT 0 COMMENT 'Rechnungsbetrag Hauswährung',
  `ORDERINVSUMF` double DEFAULT 0 COMMENT 'Rechnungsbetrag Fremdwährung',
  `CURRENCYRATEUNIT` double DEFAULT 0 COMMENT 'Währungseinheit',
  `ORDERSUM` double DEFAULT 0 COMMENT 'Nettowert Auftrag',
  `ORDERVAT1` double DEFAULT 0 COMMENT 'MwSt-Satz 1',
  `ORDERSUMVAT1` double DEFAULT 0 COMMENT 'MwSt-Satz1 Wert Fremdwährung',
  `ORDERVAT2` double DEFAULT 0 COMMENT 'MwSt-Satz 2',
  `ORDERSUMVAT2` double DEFAULT 0 COMMENT 'Betrag MwSt-Satz 2 Fremdwährung',
  `ORDERSUMFOREIGN` double DEFAULT 0 COMMENT 'Auftragswert Fremdwährung',
  `ORDERPAYDAY` datetime DEFAULT NULL COMMENT 'Zahlungsziel',
  `ORDERPAYED` bit(1) DEFAULT b'0',
  `SALESAGENT1` varchar(50) DEFAULT '' COMMENT 'Vertreter 1',
  `SALESAGENTPROV1` double DEFAULT 0 COMMENT 'Provision 1 %',
  `SALESAGENT2` varchar(50) DEFAULT '' COMMENT 'Vertreter 2',
  `SALESAGENTPROV2` double DEFAULT 0 COMMENT 'Provision 2 %',
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMC06` varchar(256) DEFAULT '',
  `CUSTOMC07` varchar(256) DEFAULT '',
  `CUSTOMC08` varchar(256) DEFAULT '',
  `CUSTOMC09` varchar(256) DEFAULT '',
  `CUSTOMC10` varchar(256) DEFAULT '',
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMB01` bit(1) DEFAULT b'0',
  `CUSTOMB02` bit(1) DEFAULT b'0',
  `CUSTOMB03` bit(1) DEFAULT b'0',
  `CUSTOMB04` bit(1) DEFAULT b'0',
  `CUSTOMB05` bit(1) DEFAULT b'0',
  `TXTHEADER` text DEFAULT '' COMMENT 'Text Angebot',
  `TXTFOODER` text DEFAULT '' COMMENT 'Text Angebot Fuss',
  `MANUFTEXT` text DEFAULT '' COMMENT 'Text Fertigung',
  `PRINTTEXT` text DEFAULT '' COMMENT 'Text für alle externen Dokumente',
  `PICKTEXT` text DEFAULT '' COMMENT 'Text Kommissionierung',
  `BLANKEDORDER` varchar(50) DEFAULT '' COMMENT 'Rahmenauftrag',
  `OFFERVALIDFROM` datetime DEFAULT NULL COMMENT 'Angebot  gültig ab',
  `OFFERVALIDTO` datetime DEFAULT NULL COMMENT 'Angebot gültig bis',
  `DIRECTDELIVERY` bit(1) DEFAULT b'0' COMMENT 'Flag für Streckenbestellung',
  `BOOKINGTYPE` varchar(50) DEFAULT '',
  `BOOKINGUSER` varchar(50) DEFAULT '',
  `BOOKINGDATE` datetime DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  `ESROWVERSIONX` int(11) DEFAULT 0,
  `SELECTEDFILESFORMAIL` text DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `ORDERNO` (`ORDERNO`),
  KEY `IDX_sstsalesorder_BUSINESSNO` (`BUSINESSNO`)
) ENGINE=InnoDB AUTO_INCREMENT=281 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Verkaufsauftrag Kopf';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstsalesorderadress
DROP TABLE IF EXISTS `sstsalesorderadress`;
CREATE TABLE IF NOT EXISTS `sstsalesorderadress` (
  `ADRTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERNUMBER` varchar(20) DEFAULT '',
  `ADRBUSINESSNO` varchar(50) DEFAULT '' COMMENT 'Kunden-/Lieferantennummer',
  `ADRADRTYPE` varchar(50) DEFAULT '' COMMENT 'Adress-Verwendung',
  `ADRBUSCOMPANY` varchar(256) DEFAULT '' COMMENT 'Kunden-/Lieferanten- Bezeichnung',
  `ADRADDRESS1` varchar(256) DEFAULT '' COMMENT 'Adresse 1',
  `ADRADDRESS2` varchar(256) DEFAULT '' COMMENT 'Adresse 2',
  `ADRADDRESS3` varchar(256) DEFAULT '' COMMENT 'Adresse 3',
  `ADRADDRESS4` varchar(256) DEFAULT '' COMMENT 'Adresse 4',
  `ADRADRPOBOX` varchar(256) DEFAULT '' COMMENT 'Postfach',
  `ADRADRPOBOXZIP` varchar(256) DEFAULT '' COMMENT 'PLZ Postfach',
  `ADRSTREET` varchar(256) DEFAULT '' COMMENT 'Strasse',
  `ADRZIP` varchar(256) DEFAULT '' COMMENT 'PLZ',
  `ADRCOUNTRYCODE` varchar(3) DEFAULT '' COMMENT 'Länder-Code',
  `ADRCITY` varchar(256) DEFAULT '' COMMENT 'Ort',
  `ADRGLN` varchar(13) DEFAULT '' COMMENT 'Global Location Number',
  `ADRDUNS` varchar(13) DEFAULT '' COMMENT 'DUNS Number',
  `ADRCUSTOM1` varchar(256) DEFAULT '',
  `ADRCUSTOM2` varchar(256) DEFAULT '',
  `ADRCUSTOM3` varchar(256) DEFAULT '',
  `ADRCUSTOM4` varchar(256) DEFAULT '',
  `ADRCUSTOM5` varchar(256) DEFAULT '',
  `ADRCUSTOM6` varchar(256) DEFAULT '',
  `ADRCUSTOMN01` double DEFAULT 0,
  `ADRCUSTOMN02` double DEFAULT 0,
  `ADRCUSTOMN03` double DEFAULT 0,
  `ADRCUSTOMN04` double DEFAULT 0,
  `ADRCUSTOMN05` double DEFAULT 0,
  `ADRCUSTOMD01` datetime DEFAULT NULL,
  `ADRCUSTOMD02` datetime DEFAULT NULL,
  `ADRCUSTOMD03` datetime DEFAULT NULL,
  `ADRCUSTOMD04` datetime DEFAULT NULL,
  `ADRCUSTOMD05` datetime DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`ADRTABLEID`),
  KEY `IDX_sstsalesorderadress` (`ORDERNUMBER`,`ADRADRTYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstsalesorderpos
DROP TABLE IF EXISTS `sstsalesorderpos`;
CREATE TABLE IF NOT EXISTS `sstsalesorderpos` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERNO` varchar(50) DEFAULT '' COMMENT 'Auftragsnummer',
  `DISPNO` int(11) DEFAULT 0 COMMENT 'Dispo-Los',
  `ORDERPOS` int(11) DEFAULT 0 COMMENT 'Positions-Nummer',
  `ORDERNOBEFORE` varchar(50) DEFAULT '',
  `ORDERPOSBEFORE` int(11) DEFAULT 0,
  `POSTYPE` varchar(50) DEFAULT '',
  `COMMISSION` varchar(255) DEFAULT '',
  `STATUS` varchar(50) DEFAULT '' COMMENT 'Positions-Status',
  `BLANKETPOS` int(11) DEFAULT 0 COMMENT 'Positions-Nummer Rahmenauftrag',
  `ARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikel-Nummer',
  `ARTIKELTEXT` varchar(255) DEFAULT NULL COMMENT 'Partdescription aus Stdparts',
  `VERSION` double DEFAULT 0,
  `VARIANT` varchar(50) DEFAULT '' COMMENT 'Variante',
  `POSTEXT` longtext DEFAULT '',
  `CUSTOMARTICLENO` varchar(50) DEFAULT '' COMMENT 'Kunden-Artikelnummer',
  `CUSTOMERORDERPOS` varchar(10) DEFAULT '' COMMENT 'Kunden-Bestellposition',
  `SALESPRICE` double DEFAULT 0 COMMENT 'Verkaufspreis Hauswährung',
  `SALESPRICEORIGIN` double DEFAULT 0 COMMENT 'Verkaufspreis ohne Rabatte Hauswährung',
  `PARTPRICEUNIT` double DEFAULT 1 COMMENT 'Preiseinheit',
  `SALESPRICEFOREIGN` double DEFAULT 0 COMMENT 'Verkaufspreis Fremdwährung',
  `SALESPRICEORIGINFOREIGN` double DEFAULT 0 COMMENT 'Verkaufspreis ohne Rabatte Fremdwährung',
  `COSTFREEREASON` varchar(50) DEFAULT '' COMMENT 'Grund Gratis (Statistik)',
  `ORDERQUANTITY` double DEFAULT 1 COMMENT 'Bestell-Menge',
  `SALESUNIT` varchar(50) DEFAULT '' COMMENT 'Mengeneinheit Verkauf',
  `SALESUNITFACTOR` double DEFAULT 1 COMMENT 'Verkaufspreis Faktor',
  `ORDERQTYVPE` double DEFAULT 1 COMMENT 'Anzahl VPEs bestellt',
  `QUANTITYVPE` double DEFAULT 1 COMMENT 'Menge von VPE (Bsp. 5 pro VPE)',
  `DISPOSEDQUANTITY` double DEFAULT 0 COMMENT 'disponierte Menge',
  `DELIVERDQUANTITY` double DEFAULT 0 COMMENT 'gelieferte Menge',
  `INVOICEDQUANTITY` double DEFAULT 0 COMMENT 'berechnete Menge',
  `REQUESTEDDELIVERYDAY` datetime DEFAULT NULL COMMENT 'gewünschter Liefertermin',
  `REQUESTEDDELIVERYCWEEK` int(11) DEFAULT 0 COMMENT 'gewünschte Liefer-Kalenderwoche',
  `PLANEDDELIVERYDAY` datetime DEFAULT NULL COMMENT 'geplanter Liefertermin',
  `PLANEDDELIVERYCWEEK` int(11) DEFAULT 0 COMMENT 'geplante Liefer-Kalenderwoche',
  `POSSUM` double DEFAULT 0 COMMENT 'Wert Position',
  `POSSUMFOREIGN` double DEFAULT 0 COMMENT 'Wert Position Fremdwährung',
  `MANUFTEXT` text DEFAULT '' COMMENT 'Text Fertigung',
  `PICKTEXT` text DEFAULT '' COMMENT 'Text Kommissionierung',
  `PRINTTEXT` text DEFAULT '' COMMENT 'Text für alle exteren Dokumente',
  `INTERNTEXT` text DEFAULT '',
  `VATKEY` int(11) DEFAULT 0 COMMENT 'Steuer-Schlüssel Gepa+Artikel',
  `VAT` double DEFAULT NULL COMMENT 'ermittelter Steuersatz Prozent',
  `PREFERENTIAL` bit(1) DEFAULT b'0' COMMENT 'Präferenzberechtigt',
  `COUNTRYORIGIN` varchar(50) DEFAULT '' COMMENT 'Ursprung',
  `INTRAREGION` varchar(50) DEFAULT '' COMMENT 'Intrastat Region',
  `CUSDISCOUNT` double DEFAULT 0 COMMENT 'Kunden-Rabatt',
  `ARTDISCOUNT1` double DEFAULT 0 COMMENT 'Artikel-Rabatt',
  `ARTDISCOUNTRULE1` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt Rechenregel',
  `ARTDISCOUNTNAME1` varchar(50) DEFAULT '' COMMENT 'Artikel-Rabatt Bezeichnung',
  `ARTDISCOUNT2` double DEFAULT 0,
  `ARTDISCOUNTRULE2` varchar(50) DEFAULT '',
  `ARTDISCOUNTNAME2` varchar(50) DEFAULT '',
  `ARTDISCOUNT3` double DEFAULT 0,
  `ARTDISCOUNTRULE3` varchar(50) DEFAULT '',
  `ARTDISCOUNTNAME3` varchar(50) DEFAULT '',
  `POSDISCOUNTSUMFOREIGN` double DEFAULT 0 COMMENT 'Wert Positionsrabatte in Fremdwährung',
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMC06` varchar(256) DEFAULT '',
  `CUSTOMC07` varchar(256) DEFAULT '',
  `CUSTOMC08` varchar(256) DEFAULT '',
  `CUSTOMC09` varchar(256) DEFAULT '',
  `CUSTOMC10` varchar(256) DEFAULT '',
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMB01` bit(1) DEFAULT b'0',
  `CUSTOMB02` bit(1) DEFAULT b'0',
  `CUSTOMB03` bit(1) DEFAULT b'0',
  `CUSTOMB04` bit(1) DEFAULT b'0',
  `CUSTOMB05` bit(1) DEFAULT b'0',
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  `ESROWVERSION` int(11) DEFAULT 0,
  `POSTEXTPLAIN` longtext DEFAULT '',
  `PRICEORIGINFROM` varchar(10) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `UK_sstsalesorderpos` (`ORDERNO`,`ORDERPOS`)
) ENGINE=InnoDB AUTO_INCREMENT=685 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Verkaufsauftrag Positionen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstsalesschedule
DROP TABLE IF EXISTS `sstsalesschedule`;
CREATE TABLE IF NOT EXISTS `sstsalesschedule` (
  `SSHTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ORDERNO` varchar(50) DEFAULT NULL COMMENT 'Auftragsnummer',
  `ORDERPOS` smallint(6) DEFAULT NULL COMMENT 'Positions-Nummer',
  `DISPNO` smallint(6) DEFAULT NULL COMMENT 'Los-Nummer',
  `PLANEDDELIVERYDAY` datetime DEFAULT NULL COMMENT 'geplanter Liefertermin',
  `PLANEDDELIVERYCWEEK` int(11) DEFAULT NULL COMMENT 'geplante Liefer-Kalenderwoche',
  `STOCKQTY` double DEFAULT NULL COMMENT 'Menge Lagerreservierung',
  `DEMANDDAY` datetime DEFAULT NULL COMMENT 'Berdarfstermin',
  `DEMANDWEEK` int(11) DEFAULT NULL COMMENT 'Berdarfsermin KW',
  `SDEMANDQTY` double DEFAULT NULL COMMENT 'Menge Bedarf',
  `PICKINGNO` int(11) DEFAULT NULL COMMENT 'Kommissionierungs-Nummer',
  `DELIVERYQTY` double DEFAULT NULL COMMENT 'Liefermenge',
  `DELIVERYNO` int(11) DEFAULT NULL COMMENT 'Lieferschein-Nummer',
  `DELIVERYDAY` datetime DEFAULT NULL COMMENT 'Liefertag',
  `INVOICEQTY` double DEFAULT NULL COMMENT 'Rechnungs-Menge',
  `INVOICEPRICE` double DEFAULT NULL COMMENT 'Rechnungs-Preis',
  `INVOICEPRICEFOREIGN` double DEFAULT NULL COMMENT 'Rechnungs-Preis Fremdwährung',
  `INVOICENO` int(11) DEFAULT NULL COMMENT 'Rechnungs-Nummer',
  `CUSTOMC01` varchar(256) DEFAULT NULL,
  `CUSTOMC02` varchar(256) DEFAULT NULL,
  `CUSTOMC03` varchar(256) DEFAULT NULL,
  `CUSTOMC04` varchar(256) DEFAULT NULL,
  `CUSTOMC05` varchar(256) DEFAULT NULL,
  `CUSTOMC06` varchar(256) DEFAULT NULL,
  `CUSTOMC07` varchar(256) DEFAULT NULL,
  `CUSTOMC08` varchar(256) DEFAULT NULL,
  `CUSTOMC09` varchar(256) DEFAULT NULL,
  `CUSTOMC10` varchar(256) DEFAULT NULL,
  `CUSTOMN01` double DEFAULT NULL,
  `CUSTOMN02` double DEFAULT NULL,
  `CUSTOMN03` double DEFAULT NULL,
  `CUSTOMN04` double DEFAULT NULL,
  `CUSTOMN05` double DEFAULT NULL,
  `CUSTOMB01` bit(1) DEFAULT NULL,
  `CUSTOMB02` bit(1) DEFAULT NULL,
  `CUSTOMB03` bit(1) DEFAULT NULL,
  `CUSTOMB04` bit(1) DEFAULT NULL,
  `CUSTOMB05` bit(1) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`SSHTABLEID`),
  UNIQUE KEY `KORDERNO` (`ORDERNO`,`ORDERPOS`,`DISPNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Verkaufsdisposition';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sststoinvbook
DROP TABLE IF EXISTS `sststoinvbook`;
CREATE TABLE IF NOT EXISTS `sststoinvbook` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `INVNUMBER` int(11) DEFAULT 0 COMMENT 'Inventur Nummer',
  `BOOKNUMBER` int(11) DEFAULT 0 COMMENT 'Buchnummer in der Inventur',
  `BOOKTYPE` varchar(10) DEFAULT '' COMMENT 'TYP des Buches',
  `DATECREATE` datetime DEFAULT NULL,
  `BOOKSUM` double DEFAULT 0 COMMENT 'Summe über Buch',
  `BOOKSTATE` varchar(10) DEFAULT '' COMMENT 'Status Buch',
  `BOOKSTATEDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sststoinvbook` (`INVNUMBER`,`BOOKNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Inventur Buecher';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sststoinvbookpos
DROP TABLE IF EXISTS `sststoinvbookpos`;
CREATE TABLE IF NOT EXISTS `sststoinvbookpos` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `INVNUMMER` int(11) DEFAULT 0 COMMENT 'Inventurnummer',
  `BOOKNUMBER` int(11) DEFAULT 0 COMMENT 'Buchnummer',
  `SORTBOOK` int(11) DEFAULT 0 COMMENT 'Sortierung im Buch',
  `SORTHELPER` varchar(128) NOT NULL DEFAULT '' COMMENT 'Helper für Sortierung',
  `PARTARTIKELNO` varchar(20) DEFAULT '' COMMENT 'Artikelnummer',
  `PARTDESCRIPTION1` varchar(2000) DEFAULT '' COMMENT 'Beschreibung aus Stamm',
  `QUANTITYSOLL` double DEFAULT 0 COMMENT 'Bestand',
  `QUANTITYCOUNT` double DEFAULT 0 COMMENT 'gezaehleter Bestand',
  `COUNTERNAME` varchar(20) DEFAULT '' COMMENT 'Name des Zaehlers',
  `COUNTDATE` datetime DEFAULT NULL COMMENT 'Zaehldatum',
  `ISCOUNTED` bit(1) DEFAULT b'0' COMMENT 'ist gezaehlt',
  `STORAGE` varchar(50) DEFAULT '' COMMENT 'Lager',
  `STORAGEYARD` varchar(50) DEFAULT '' COMMENT 'Lager',
  `STORAGEID` int(11) DEFAULT 0 COMMENT 'Tableid vom Lagerfach',
  `CHARGE` varchar(50) DEFAULT '' COMMENT 'Charge im Fach',
  `ISBOOKED` bit(1) DEFAULT b'0' COMMENT 'Inventur gebucht !',
  `BOOKINGDATE` datetime DEFAULT NULL,
  `TYP` varchar(12) DEFAULT '',
  `ISMANUELL` bit(1) DEFAULT b'0' COMMENT 'manuell Angelegt',
  `ISTORECOUNT` bit(1) DEFAULT b'0' COMMENT 'nochmal Zaehlen',
  `INVPRICE` double DEFAULT 0 COMMENT 'Bewertungspreis',
  `INVPRICEDATE` datetime DEFAULT NULL COMMENT 'Preisdatum',
  `COUNTINGDATE` datetime DEFAULT NULL COMMENT 'Zaehldatum',
  `COMMENT` varchar(2000) DEFAULT '' COMMENT 'Kommentar',
  `ERRORTEXT` varchar(2000) DEFAULT '' COMMENT 'Fehlertexte',
  `STORAGEMANUELL` varchar(256) DEFAULT '' COMMENT 'manueller Lagerort',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sststoinvbookpos` (`INVNUMMER`,`BOOKNUMBER`,`SORTBOOK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Artikelpositionen zum Inventurbuch';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sststoinvheader
DROP TABLE IF EXISTS `sststoinvheader`;
CREATE TABLE IF NOT EXISTS `sststoinvheader` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `INVNAME` varchar(128) DEFAULT NULL COMMENT 'Eindeutiger Inventurname (2020JAHRESINV)',
  `INVNUMBER` int(11) DEFAULT 0 COMMENT 'laufende Nummer der Inventur',
  `INVDATE` datetime DEFAULT NULL COMMENT 'Inventurdatum',
  `COMMENT` varchar(255) DEFAULT '' COMMENT 'Beschreibung der Inventur',
  `INVSUM` double DEFAULT 0 COMMENT 'Gesamtsumme',
  `ISDONE` bit(1) DEFAULT b'0' COMMENT 'Erledigt',
  `INVTYPE` varchar(10) DEFAULT '' COMMENT 'Inventurtyp (Buch od Jahres od Bewinventur)',
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_sststoinvheader_INVNAME` (`INVNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Kopf für Inventuren';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sststoragetransaction
DROP TABLE IF EXISTS `sststoragetransaction`;
CREATE TABLE IF NOT EXISTS `sststoragetransaction` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `STORAGEB` varchar(50) DEFAULT '' COMMENT 'Lagerort vor Buchung',
  `STORAGEYARDB` varchar(50) DEFAULT '' COMMENT 'Lagerfach vor Buchung',
  `STORAGEA` varchar(50) DEFAULT '' COMMENT 'Lagerort nach Buchung',
  `PARTARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikelnummer ',
  `STORAGEYARDA` varchar(50) DEFAULT '' COMMENT 'Lagerfach nach Buchung',
  `VARIANT` varchar(50) DEFAULT '' COMMENT 'Variante',
  `CHARGE` varchar(50) DEFAULT '' COMMENT 'Charge',
  `BOOKINGDATE` datetime DEFAULT curdate() COMMENT 'Buchungsdatum',
  `BOOKINGQUANTITY` double DEFAULT 0 COMMENT 'Buchungsmenge',
  `BOOKINGKIND` varchar(50) DEFAULT '' COMMENT 'Buchungsart',
  `STOREQUANTITYB` double DEFAULT 0 COMMENT 'Lagermenge vor Buchung',
  `STOREQUANTITYA` double DEFAULT 0 COMMENT 'Lagermenge nach Buchung',
  `INVENTORYQUANTITY` double DEFAULT 0 COMMENT 'Inventurmenge',
  `RESERVATIONQUANTITYB` double DEFAULT 0 COMMENT 'reservierte Menge vor Buchung',
  `RESERVATIONQUANTITYA` double DEFAULT 0 COMMENT 'reservierte Menge nach Buchung',
  `PASSIVB` bit(1) DEFAULT b'0' COMMENT 'Kz Passiv vor Buchung',
  `PASSIVA` bit(1) DEFAULT b'0' COMMENT 'Kz Passiv nach Buchung',
  `PASSIVCLASSB` varchar(50) DEFAULT '' COMMENT 'Klassifizierung Passiv vor Buchung',
  `PASSIVCLASSA` varchar(50) DEFAULT '' COMMENT 'Klassifizierung Passiv nach Buchung',
  `BOOKINGPRICE` double DEFAULT 0 COMMENT 'Preis Buchung',
  `PASSIVCLASS` varchar(50) DEFAULT '' COMMENT 'Klassifizierung Passiv ',
  `COMMENT` varchar(255) DEFAULT '' COMMENT 'Kommentar',
  `PROJECT` varchar(50) DEFAULT '',
  `BOOKINGTYPE` varchar(10) DEFAULT '',
  `BOOKINGNUMBER` varchar(20) DEFAULT '',
  `BOOKINGPOS` int(11) DEFAULT 0,
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMB01` bit(1) DEFAULT b'0',
  `CUSTOMB02` bit(1) DEFAULT b'0',
  `CUSTOMB03` bit(1) DEFAULT b'0',
  `CUSTOMB04` bit(1) DEFAULT b'0',
  `CUSTOMB05` bit(1) DEFAULT b'0',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(20) DEFAULT '',
  `ESUSRMODIFYED` varchar(20) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sststoragetransaction_PARTARTIKELNO` (`PARTARTIKELNO`)
) ENGINE=InnoDB AUTO_INCREMENT=934 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=2340 COMMENT='Lagerbewegungprotokoll';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.ssttimeentries
DROP TABLE IF EXISTS `ssttimeentries`;
CREATE TABLE IF NOT EXISTS `ssttimeentries` (
  `TIMETABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMENR` varchar(50) DEFAULT NULL COMMENT 'Time Nummer',
  `TIMEDESC` varchar(255) DEFAULT NULL COMMENT 'Beschreibung',
  `TIMEREFERENCE01` varchar(50) DEFAULT NULL COMMENT 'Referenz Kunde',
  `TIMEREFERENCE02` varchar(50) DEFAULT NULL COMMENT 'Referenz Projekt',
  `TIMEREFERENCE03` varchar(50) DEFAULT NULL COMMENT 'Referenz Aufgabe',
  `TIMECATEGORY` varchar(255) DEFAULT NULL COMMENT 'Kategorie',
  `TIMESTATUS` varchar(10) DEFAULT NULL COMMENT 'Status',
  `TIMEASSIGNMENT` varchar(256) DEFAULT NULL COMMENT 'Zuweisung Personen',
  `TIMEBILLABLE` varchar(50) DEFAULT NULL COMMENT 'Abrechenbar',
  `TIMEINTERN` bit(1) DEFAULT NULL COMMENT 'Interne Zeit',
  `TIMEBILLED` varchar(50) DEFAULT NULL COMMENT 'Abgerechnet',
  `TIMESUM` varchar(50) DEFAULT NULL COMMENT 'Gesamtzeit',
  `TIMETYPE` varchar(50) DEFAULT NULL COMMENT 'Typ',
  `TIMESTART` datetime DEFAULT NULL COMMENT 'Startzeit',
  `TIMEEND` datetime DEFAULT NULL COMMENT 'Endzeit',
  `TIMEDATE` datetime DEFAULT NULL COMMENT 'Datum',
  `TIMECUSTOMC01` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC02` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC03` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC04` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC05` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC06` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC07` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC08` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC09` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC10` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC11` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC12` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC13` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC14` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC15` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC16` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC17` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC18` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC19` varchar(50) DEFAULT NULL,
  `TIMECUSTOMC20` varchar(50) DEFAULT NULL,
  `TIMECUSTOMD01` datetime DEFAULT NULL,
  `TIMECUSTOMD02` datetime DEFAULT NULL,
  `TIMECUSTOMD03` datetime DEFAULT NULL,
  `TIMECUSTOMD04` datetime DEFAULT NULL,
  `TIMECUSTOMD05` datetime DEFAULT NULL,
  `TIMECUSTOMN01` double DEFAULT NULL,
  `TIMECUSTOMN02` double DEFAULT NULL,
  `TIMECUSTOMN03` double DEFAULT NULL,
  `TIMECUSTOMN04` double DEFAULT NULL,
  `TIMECUSTOMN05` double DEFAULT NULL,
  `TIMECUSTOMRTF` text DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TIMETABLEID`),
  KEY `TIMEIX01` (`TIMENR`),
  KEY `TIMEIX02` (`TIMEREFERENCE01`),
  KEY `TIMEIX03` (`TIMEREFERENCE02`),
  KEY `TIMEIX04` (`TIMEREFERENCE03`),
  KEY `TIMEIX05` (`TIMECATEGORY`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=3276;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstwroheader
DROP TABLE IF EXISTS `sstwroheader`;
CREATE TABLE IF NOT EXISTS `sstwroheader` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `WRONUMMER` varchar(50) DEFAULT '' COMMENT 'Work Order Number',
  `WROBDENR` double DEFAULT 0 COMMENT 'Work Order BDE Number',
  `WROSTATE` varchar(10) DEFAULT 'NEW' COMMENT 'Work Order State',
  `WROSTATEDATE` datetime DEFAULT NULL COMMENT 'Last Work Order State Date',
  `DISORDERNO` varchar(10) DEFAULT '',
  `DISORDERPOS` int(11) DEFAULT 0,
  `PARTARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikelnummer',
  `PARTVARIANT` varchar(50) DEFAULT '' COMMENT 'Artikel-Variante',
  `PARTDRAWINGNO` varchar(255) DEFAULT '' COMMENT 'Zeichungs-Nummer',
  `PARTVERSION` varchar(10) DEFAULT '',
  `COMMISSION` varchar(255) DEFAULT '' COMMENT 'Projekt',
  `COMMISSIONPOS` int(11) DEFAULT 0 COMMENT 'Projekt Position',
  `DESCRIPTION1` varchar(2000) DEFAULT '' COMMENT 'Beschreibung 1',
  `DESCRIPTION2` varchar(2000) DEFAULT '' COMMENT 'Beschreibung 2',
  `DESCRIPTION3` varchar(2000) DEFAULT '' COMMENT 'Beschreibung 3',
  `BOMDIM1` double DEFAULT 0 COMMENT 'Stücklistenbezogene Eigenschaft Länge',
  `BOMDIM2` double DEFAULT 0 COMMENT 'Stücklistenbezogene Eigenschaft Breite',
  `BOMDIM3` double DEFAULT 0 COMMENT 'Stücklistenbezogene Eigenschaft Höhe',
  `BOMVAR1` varchar(255) DEFAULT '' COMMENT 'Stücklistenbezogene Eigenschaft Text (Endenbearbeitung)',
  `BOMVAR2` varchar(255) DEFAULT '' COMMENT 'Stücklistenbezogene Eigenschaft Text',
  `BOMVAR3` varchar(255) DEFAULT '' COMMENT 'Stücklistenbezogene Eigenschaft Text',
  `QUANTITYORDERED` double DEFAULT 0 COMMENT 'Menge bestellt',
  `QUANTITYDELIVERD` double DEFAULT 0 COMMENT 'Menge geliefert',
  `QUANTITYFAULTY` double DEFAULT 0 COMMENT 'Menge Ausschuss',
  `PARTUNIT` varchar(12) DEFAULT '' COMMENT 'Mengen-Einheit',
  `ORDERDATE` datetime DEFAULT NULL COMMENT 'Bestelldatum',
  `PLANEDDELIVERYDATE` datetime DEFAULT NULL COMMENT 'geplantes Lieferdatum',
  `PLANEDDELIVERYWEEK` int(11) DEFAULT 0 COMMENT 'geplante Lieferwoche',
  `DELIVERYDATE` datetime DEFAULT NULL COMMENT 'Lieferdatum',
  `DELIVERYWEEK` int(11) DEFAULT 0 COMMENT 'Lieferwoche',
  `PRINTDATE` datetime DEFAULT NULL COMMENT 'Druckdatum',
  `PRINTUSER` varchar(20) DEFAULT '' COMMENT 'User von Druck',
  `WORKENDDATE` datetime DEFAULT NULL COMMENT 'Auftrag beendet',
  `WORKSTARTDATE` datetime DEFAULT NULL COMMENT 'Auftrag begonnen',
  `COMMENTPROD` varchar(255) DEFAULT '' COMMENT 'Bermerkung für Fertigung',
  `COMMENTINT` varchar(255) DEFAULT '' COMMENT 'Bemerkung intern',
  `WROHEADCUSTOMC01` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC02` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC03` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC04` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC05` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC06` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC07` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC08` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC09` varchar(255) DEFAULT '',
  `WROHEADCUSTOMC10` varchar(255) DEFAULT '',
  `WROHEADCUSTOMD01` datetime DEFAULT NULL,
  `WROHEADCUSTOMD02` datetime DEFAULT NULL,
  `WROHEADCUSTOMD03` datetime DEFAULT NULL,
  `WROHEADCUSTOMD04` datetime DEFAULT NULL,
  `WROHEADCUSTOMD05` datetime DEFAULT NULL,
  `WROHEADCUSTOMN01` double DEFAULT 0,
  `WROHEADCUSTOMN02` double DEFAULT 0,
  `WROHEADCUSTOMN03` double DEFAULT 0,
  `WROHEADCUSTOMN04` double DEFAULT 0,
  `WROHEADCUSTOMN05` double DEFAULT 0,
  `WROHEADCUSTOMGRP01` varchar(255) DEFAULT '',
  `WROHEADCUSTOMGRP02` varchar(255) DEFAULT '',
  `WROHEADCUSTOMGRP03` varchar(255) DEFAULT '',
  `WROHEADCUSTOMGRP04` varchar(255) DEFAULT '',
  `WROHEADCUSTOMGRP05` varchar(255) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sstwrokop_PARTARTIKELNO` (`PARTARTIKELNO`),
  KEY `IDX_sstwrokop_WRONUMMER` (`WRONUMMER`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=16384;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sstwropos
DROP TABLE IF EXISTS `sstwropos`;
CREATE TABLE IF NOT EXISTS `sstwropos` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `WRONUMMER` varchar(50) DEFAULT '' COMMENT 'Work Order Number',
  `WROBDENR` double DEFAULT 0 COMMENT 'Work Order BDE Number',
  `WROPOS` double DEFAULT 0,
  `WROPOSSUB` double DEFAULT 0,
  `POSTYP` varchar(10) DEFAULT '' COMMENT 'WRK = Arbeitsgang , MAT = Material , FRD = Fremdarbeitsgang',
  `WROSTATEPOS` varchar(10) DEFAULT 'NEW' COMMENT 'Work OrderPos State',
  `WROSTATEDATE` datetime DEFAULT NULL COMMENT 'Last Work OrderPos State Date',
  `PARTARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikelnummer  Kostenstelle',
  `PARTVERSION` varchar(10) DEFAULT '0.0',
  `PARTVARIANT` varchar(50) DEFAULT '' COMMENT 'Artikel-Variante  Kostenstelle Sub',
  `DESCRIPTION1` varchar(2000) DEFAULT '',
  `DESCRIPTION2` varchar(2000) DEFAULT '',
  `DESCRIPTION3` varchar(2000) DEFAULT '',
  `QUANTITYORDERED` double DEFAULT 0 COMMENT 'Menge bestellt',
  `QUANTITYDELIVERD` double DEFAULT 0 COMMENT 'Menge geliefert',
  `QUANTITYFAULTY` double DEFAULT 0 COMMENT 'Menge Ausschuss',
  `POSUNIT` varchar(12) DEFAULT '' COMMENT 'Mengen-Einheit',
  `TIMETR` double DEFAULT 0 COMMENT 'Ruestzeit',
  `TIMETE` double DEFAULT 0 COMMENT 'Einzelzeit',
  `TIMESUM` double DEFAULT 0 COMMENT 'Gesamtzeit',
  `PLANEDSTARTDATE` datetime DEFAULT NULL COMMENT 'geplantes Startdatum',
  `PLANEDSTARTWEEK` int(11) DEFAULT 0 COMMENT 'geplante Startwoche',
  `PLANEDDELIVERYDATE` datetime DEFAULT NULL COMMENT 'geplantes Enddatum',
  `PLANEDDELIVERYWEEK` int(11) DEFAULT 0 COMMENT 'geplante Endwoche',
  `DELIVERYDATE` datetime DEFAULT NULL COMMENT 'Lieferdatum',
  `DELIVERYWEEK` int(11) DEFAULT 0 COMMENT 'Lieferwoche',
  `WORKSTARTDATE` datetime DEFAULT NULL COMMENT 'Position begonnen',
  `WORKENDDATE` datetime DEFAULT NULL COMMENT 'Position beendet',
  `COMMENTRTF` varchar(2000) DEFAULT '' COMMENT 'Kommentar',
  `WROPOSCUSTOMC01` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC02` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC03` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC04` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC05` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC06` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC07` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC08` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC09` varchar(255) DEFAULT '',
  `WROPOSCUSTOMC010` varchar(255) DEFAULT '',
  `WROPOSCUSTOMD01` datetime DEFAULT NULL,
  `WROPOSCUSTOMD02` datetime DEFAULT NULL,
  `WROPOSCUSTOMD03` datetime DEFAULT NULL,
  `WROPOSCUSTOMD04` datetime DEFAULT NULL,
  `WROPOSCUSTOMD05` datetime DEFAULT NULL,
  `WROPOSCUSTOMN01` double DEFAULT 0,
  `WROPOSCUSTOMN02` double DEFAULT 0,
  `WROPOSCUSTOMN03` double DEFAULT 0,
  `WROPOSCUSTOMN04` double DEFAULT 0,
  `WROPOSCUSTOMN05` double DEFAULT 0,
  `WROPOSCUSTOMGRP01` varchar(255) DEFAULT '',
  `WROPOSCUSTOMGRP02` varchar(255) DEFAULT '',
  `WROPOSCUSTOMGRP03` varchar(255) DEFAULT '',
  `WROPOSCUSTOMGRP04` varchar(255) DEFAULT '',
  `WROPOSCUSTOMGRP05` varchar(255) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sstwropos` (`WRONUMMER`,`WROPOS`),
  KEY `IDX_sstwropos_PARTARTIKELNO` (`PARTARTIKELNO`),
  KEY `IDX_sstwropos_WROBDENR` (`WROBDENR`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=5461;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdadress
DROP TABLE IF EXISTS `stdadress`;
CREATE TABLE IF NOT EXISTS `stdadress` (
  `ADRTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ADRNUMBER` int(11) NOT NULL DEFAULT 0 COMMENT 'Adress-Nummer',
  `ADRLEDGERACCOUNTTYP` varchar(50) DEFAULT NULL COMMENT 'Kontokorrent (Kunde/Lieferant/eigen)',
  `ADRBUSINESSNO` varchar(50) DEFAULT NULL COMMENT 'Kunden-/Lieferantennummer',
  `ADRBUSCOMPANY` varchar(256) DEFAULT NULL COMMENT 'Kunden- / Lieferantenbezeichnung',
  `ADRADRTYPE` varchar(50) DEFAULT NULL COMMENT 'Adress-Verwendung',
  `ADRPRIO` int(11) DEFAULT 0 COMMENT 'Prio Verwendung',
  `ADRADDRESS1` varchar(256) DEFAULT NULL COMMENT 'Adresse 1',
  `ADRADDRESS2` varchar(256) DEFAULT NULL COMMENT 'Adresse 2',
  `ADRADDRESS3` varchar(256) DEFAULT NULL COMMENT 'Adresse 3',
  `ADRADDRESS4` varchar(256) DEFAULT NULL COMMENT 'Adresse 4',
  `ADRADRPOBOX` varchar(256) DEFAULT NULL COMMENT 'Postfach',
  `ADRADRPOBOXZIP` varchar(256) DEFAULT NULL COMMENT 'PLZ Postfach',
  `ADRSTREET` varchar(256) DEFAULT NULL COMMENT 'Strasse',
  `ADRZIP` varchar(256) DEFAULT NULL COMMENT 'PLZ',
  `ADRCOUNTRYCODE` varchar(3) DEFAULT NULL COMMENT 'Länder-Code',
  `ADRCITY` varchar(256) DEFAULT NULL COMMENT 'Ort',
  `ADRGLN` varchar(13) DEFAULT NULL COMMENT 'Global Location Number',
  `ADRDUNS` varchar(13) DEFAULT NULL COMMENT 'DUNS Number',
  `ADRCUSTOM1` varchar(256) DEFAULT NULL,
  `ADRCUSTOM2` varchar(256) DEFAULT NULL,
  `ADRCUSTOM3` varchar(256) DEFAULT NULL,
  `ADRCUSTOM4` varchar(256) DEFAULT NULL,
  `ADRCUSTOM5` varchar(256) DEFAULT NULL,
  `ADRCUSTOM6` varchar(256) DEFAULT NULL,
  `ADRCUSTOMN01` double DEFAULT NULL,
  `ADRCUSTOMN02` double DEFAULT NULL,
  `ADRCUSTOMN03` double DEFAULT NULL,
  `ADRCUSTOMN04` double DEFAULT NULL,
  `ADRCUSTOMN05` double DEFAULT NULL,
  `ADRCUSTOMD01` datetime DEFAULT NULL,
  `ADRCUSTOMD02` datetime DEFAULT NULL,
  `ADRCUSTOMD03` datetime DEFAULT NULL,
  `ADRCUSTOMD04` datetime DEFAULT NULL,
  `ADRCUSTOMD05` datetime DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`ADRTABLEID`),
  KEY `ADR_DUNS` (`ADRDUNS`),
  KEY `ADR_GLN` (`ADRGLN`),
  KEY `ADRLEDGERACCOUNTTYP` (`ADRLEDGERACCOUNTTYP`,`ADRBUSINESSNO`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=252 COMMENT='Adressen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdbom
DROP TABLE IF EXISTS `stdbom`;
CREATE TABLE IF NOT EXISTS `stdbom` (
  `BOMTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `BOMHEADERID` int(11) NOT NULL,
  `BOMPOSID` int(11) NOT NULL,
  `BOMHEADERNO` varchar(128) NOT NULL,
  `BOMVARIANT` varchar(50) NOT NULL COMMENT 'Variante',
  `BOMPOS` int(11) NOT NULL,
  `BOMPOSNO` varchar(128) NOT NULL,
  `BOMPOSTYPE` varchar(30) NOT NULL,
  `BOMQUANTITY` double NOT NULL,
  `BOMQUANTITYUNIT` varchar(10) NOT NULL,
  `BOMCATEGORY` varchar(10) DEFAULT NULL,
  `BOMMANUELL` bit(1) DEFAULT NULL,
  `BOMCOSTCENTRE` varchar(10) DEFAULT NULL,
  `BOMDIM1` double DEFAULT NULL,
  `BOMDIM2` double DEFAULT NULL,
  `BOMDIM3` double DEFAULT NULL,
  `BOMCUSTOMC01` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC02` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC03` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC04` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC05` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC06` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC07` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC08` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC09` varchar(256) DEFAULT NULL,
  `BOMCUSTOMC10` varchar(256) DEFAULT NULL,
  `BOMCUSTOMN01` double DEFAULT NULL,
  `BOMCUSTOMN02` double DEFAULT NULL,
  `BOMCUSTOMN03` double DEFAULT NULL,
  `BOMCUSTOMN04` double DEFAULT NULL,
  `BOMCUSTOMN05` double DEFAULT NULL,
  `BOMCUSTOMD01` datetime DEFAULT NULL,
  `BOMCUSTOMD02` datetime DEFAULT NULL,
  `BOMCUSTOMD03` datetime DEFAULT NULL,
  `BOMCUSTOMD04` datetime DEFAULT NULL,
  `BOMCUSTOMD05` datetime DEFAULT NULL,
  `BOMRTF` text DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`BOMTABLEID`),
  KEY `IX_BOMHEADER` (`BOMHEADERID`),
  KEY `IX_BOMPOS` (`BOMPOSID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=1170 COMMENT='Standard Stücklisten';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdbusaccount
DROP TABLE IF EXISTS `stdbusaccount`;
CREATE TABLE IF NOT EXISTS `stdbusaccount` (
  `BUSTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `BUSBUSINESSNO` varchar(50) DEFAULT NULL COMMENT 'Lieferanten-/Kundennummer',
  `BUSTYPE` varchar(50) DEFAULT NULL COMMENT 'Divers/Normal',
  `BUSLEDGERACCOUNTTYP` varchar(50) DEFAULT NULL COMMENT 'Kontokorrent',
  `BUSCONCERN` varchar(50) DEFAULT NULL COMMENT 'Konzern',
  `BUSBUSINESSGRP1` varchar(50) DEFAULT NULL COMMENT 'Business-Gruppe1',
  `BUSBUSINESSGRP2` varchar(50) DEFAULT NULL COMMENT 'Business-Gruppe2',
  `BUSCONDGROUP` varchar(12) DEFAULT NULL,
  `BUSCOMPANY` varchar(256) DEFAULT NULL COMMENT 'Kurz-Bezeichnung',
  `BUSMATCHCODE` varchar(255) DEFAULT NULL COMMENT 'Matchcode (SPEEDY)',
  `BUSADDRESS1` varchar(256) DEFAULT NULL COMMENT 'Firma',
  `BUSADDRESS2` varchar(256) DEFAULT NULL COMMENT 'Adresse 2',
  `BUSADDRESS3` varchar(256) DEFAULT NULL COMMENT 'Adresse 3',
  `BUSADDRESS4` varchar(256) DEFAULT NULL COMMENT 'Adresse 4',
  `BUSADRPOBOX` varchar(256) DEFAULT NULL COMMENT 'Postfach',
  `BUSADRPOBOXZIP` varchar(256) DEFAULT NULL COMMENT 'PLZ Postfach',
  `BUSSTREET` varchar(256) DEFAULT NULL COMMENT 'Strasse',
  `BUSZIP` varchar(256) DEFAULT NULL COMMENT 'PLZ',
  `BUSCOUNTRYCODE` varchar(3) DEFAULT NULL COMMENT 'Länder-Code',
  `BUSCITY` varchar(256) DEFAULT NULL COMMENT 'Ort',
  `BUSCONTACTNAME` varchar(256) DEFAULT NULL COMMENT 'Kontakt-Name',
  `BUSCONTACTTEL` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Telefon',
  `BUSCONTACTFAX` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Fax',
  `BUSCONTACTEMAIL` varchar(256) DEFAULT NULL COMMENT 'Kontakt-Email',
  `BUSURL` varchar(256) DEFAULT NULL COMMENT 'WEB-Adresse',
  `BUSVATNO` varchar(50) DEFAULT NULL COMMENT 'USt-ID-Nummer',
  `BUSTAXNUMBER` varchar(255) DEFAULT NULL,
  `BUSNOINVOICE` int(11) DEFAULT NULL COMMENT 'Anzahl Rechnungskopien',
  `BUSNODELIVERYNOTE` int(11) DEFAULT NULL COMMENT 'Anzahl Lieferscheine',
  `BUSTERMSOFPAYMENT` varchar(256) DEFAULT NULL COMMENT 'Zahlungsbedingungen',
  `BUSTERMSOFDELIVERY` varchar(256) DEFAULT NULL COMMENT 'Frankatur (Incoterms)',
  `BUSFMODEOFDELIVERY` varchar(256) DEFAULT NULL COMMENT 'Versandart',
  `BUSFREIGHTFORWARDER` varchar(256) DEFAULT NULL COMMENT 'Spediteur',
  `BUSTXTCONFHEADER` int(11) DEFAULT NULL COMMENT 'Text Anfrage Header',
  `BUSTXTCONFFOOTER` int(11) DEFAULT NULL COMMENT 'Text Anfrage Fuss',
  `BUSTXTPUOHEADER` int(11) DEFAULT NULL COMMENT 'Text Bestellung Header',
  `BUSTXTPUOFOOTER` int(11) DEFAULT NULL COMMENT 'Text Bestellung Fuss',
  `BUSTXTOFFHEADER` int(11) DEFAULT NULL COMMENT 'Text Angebot Kopf',
  `BUSTXTOFFFOOTER` int(11) DEFAULT NULL COMMENT 'Text Angebot Fuss',
  `BUSTXTSOHEADER` int(11) DEFAULT NULL COMMENT 'Text Auftrag Kopf',
  `BUSTXTSOFOOTER` int(11) DEFAULT NULL COMMENT 'Text Auftrag Fuss',
  `BUSTXTDELHEADER` int(11) DEFAULT NULL COMMENT 'Text Lieferschein Kopf',
  `BUSTXTDELFOOTER` int(11) DEFAULT NULL COMMENT 'Text Lieferschein Fuss',
  `BUSTXTINVHEADER` int(11) DEFAULT NULL COMMENT 'Text Rechnung Kopf',
  `BUSTXTINVFOOTER` int(11) DEFAULT NULL COMMENT 'Text Rechnung Fuss',
  `BUSTXTCREHEADER` int(11) DEFAULT NULL COMMENT 'Text Gutschrift Kopf',
  `BUSTXTCREFOOTER` int(11) DEFAULT NULL COMMENT 'Text Gutschrift Fuss',
  `BUSMANUFTEXT` varchar(1024) DEFAULT NULL COMMENT 'Text Fertigung',
  `BUSINTERNINFO` text DEFAULT NULL COMMENT 'Interne Info',
  `BUSPRINTTEXT` varchar(1024) DEFAULT NULL COMMENT 'Text auf allen externen Dokumenten',
  `BUSPICKTEXT` varchar(1024) DEFAULT NULL COMMENT 'Text Kommissionierung',
  `BUSGLN` varchar(20) DEFAULT NULL COMMENT 'Global Ident No.',
  `BUSDUNS` varchar(20) DEFAULT NULL COMMENT 'DUNS',
  `BUSCURRENCY` varchar(20) DEFAULT NULL COMMENT 'Währung',
  `BUSLEDGERACCOUNT` varchar(50) DEFAULT NULL COMMENT 'Debitoren-/Kreditorenkonto',
  `BUSBLOCKED` bit(1) DEFAULT NULL COMMENT 'Kunde/Lieferant gesperrt',
  `BUSMANUFACTORINGSTOP` bit(1) DEFAULT NULL COMMENT 'Fertigungsstopp',
  `BUSDELIVERYSTOP` bit(1) DEFAULT NULL COMMENT 'Lieferstopp',
  `BUSLANGUAGE` varchar(3) DEFAULT NULL COMMENT 'Sprache',
  `BUSDISCOUNT` double DEFAULT NULL COMMENT 'Rabatt',
  `BUSMYPARTNERID` varchar(50) DEFAULT NULL COMMENT 'Kundennr bei Lieferant, Lieferantennr bei Kunde',
  `BUSRESPONSIBLE` varchar(50) DEFAULT NULL COMMENT 'Sachbearbeiter VER/EK',
  `BUSVATKEY` int(11) DEFAULT NULL COMMENT 'Steuer-Nummer',
  `BUSINVOICEACCOUNT` varchar(50) DEFAULT NULL COMMENT 'Faktura-Empfänger',
  `BUSLEADTIMETRANSPORT` smallint(6) DEFAULT NULL COMMENT 'Transport-Zeit',
  `BUSIBAN` varchar(50) DEFAULT NULL COMMENT 'IBAN',
  `BUSBIC` varchar(50) DEFAULT NULL COMMENT 'Internationaler Bank-Code',
  `BUSBANK` varchar(256) DEFAULT NULL COMMENT 'Bank',
  `BUSSALESAGENT1` varchar(50) DEFAULT NULL COMMENT 'Vertreter 1',
  `BUSSALESAGENT1PROV` double DEFAULT NULL COMMENT 'Provision Vertreter 1 in %',
  `BUSSALESAGENT2` varchar(50) DEFAULT NULL COMMENT 'Vertreter 2',
  `BUSSALSAGENT2PROV` double DEFAULT NULL COMMENT 'Provision Vertreter 2 in %',
  `SALESLISTGROUPB` varchar(10) DEFAULT NULL COMMENT 'Gruppe für Preisliste',
  `BUSKEYWORD` varchar(256) DEFAULT NULL COMMENT 'Stichwörter',
  `BUSCUSTOMC01` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC02` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC03` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC04` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC05` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC06` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC07` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC08` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC09` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC10` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC11` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC12` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC13` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC14` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC15` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC16` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC17` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC18` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC19` varchar(256) DEFAULT NULL,
  `BUSCUSTOMC20` varchar(256) DEFAULT NULL,
  `BUSCUSTOMN01` double DEFAULT NULL,
  `BUSCUSTOMN02` double DEFAULT NULL,
  `BUSCUSTOMN03` double DEFAULT NULL,
  `BUSCUSTOMN04` double DEFAULT NULL,
  `BUSCUSTOMN05` double DEFAULT NULL,
  `BUSCUSTOMD01` datetime DEFAULT NULL,
  `BUSCUSTOMD02` datetime DEFAULT NULL,
  `BUSCUSTOMD03` datetime DEFAULT NULL,
  `BUSCUSTOMD04` datetime DEFAULT NULL,
  `BUSCUSTOMD05` datetime DEFAULT NULL,
  `BUSPARTDELIVERY` varchar(50) DEFAULT NULL COMMENT 'Teillieferung',
  `BUSONLINELOGIN` varchar(50) DEFAULT NULL,
  `BUSONLINEPW` varchar(50) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`BUSTABLEID`),
  UNIQUE KEY `BUSBUSINESSNO` (`BUSBUSINESSNO`,`BUSLEDGERACCOUNTTYP`)
) ENGINE=InnoDB AUTO_INCREMENT=4271 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=768 COMMENT='Business-Stamm (Kunden und Lieferanten)';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdbusparts
DROP TABLE IF EXISTS `stdbusparts`;
CREATE TABLE IF NOT EXISTS `stdbusparts` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikel-Nummer',
  `VARIANT` varchar(50) DEFAULT '' COMMENT 'Variante',
  `TEXT` varchar(255) DEFAULT '' COMMENT 'Artikeltext',
  `BUSINESSNO` varchar(50) DEFAULT '' COMMENT 'Lieferanten-/Kundennummer',
  `TYP` varchar(255) DEFAULT '' COMMENT 'Kunde / Lieferant',
  `VENDORTEXT` text DEFAULT '' COMMENT 'Bestell-Text',
  `QUANTITY` double DEFAULT 0 COMMENT 'Menge Staffel',
  `QUANTITYVPE` double DEFAULT 1,
  `PRICE` double DEFAULT 0 COMMENT 'Preis für Staffel',
  `DISCOUNT` double DEFAULT 0 COMMENT 'Rabatt für Staffel',
  `DEDUCTION` double DEFAULT 0 COMMENT 'Abzug für Staffel',
  `VALIDDATEFROM` date DEFAULT NULL,
  `VALIDDATETILL` date DEFAULT NULL,
  `QUANTITYUNIT` varchar(11) DEFAULT '',
  `CURRENCY` varchar(3) DEFAULT 'EUR',
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMC06` varchar(256) DEFAULT '',
  `CUSTOMC07` varchar(256) DEFAULT '',
  `CUSTOMC08` varchar(256) DEFAULT '',
  `CUSTOMC09` varchar(256) DEFAULT '',
  `CUSTOMC10` varchar(256) DEFAULT '',
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMD01` datetime DEFAULT NULL,
  `CUSTOMD02` datetime DEFAULT NULL,
  `CUSTOMD03` datetime DEFAULT NULL,
  `CUSTOMD04` datetime DEFAULT NULL,
  `CUSTOMD05` datetime DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT '' COMMENT 'Kommentar',
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_stdbusparts` (`ARTIKELNO`,`VARIANT`,`BUSINESSNO`,`QUANTITY`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=4096 COMMENT='Busaccount-Artikeldaten';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdcalender
DROP TABLE IF EXISTS `stdcalender`;
CREATE TABLE IF NOT EXISTS `stdcalender` (
  `CAIDDATE` int(11) NOT NULL,
  `CAFULLDATE` date NOT NULL,
  `CAYEAR` int(11) NOT NULL,
  `CAMONTH` int(11) NOT NULL,
  `CADAY` int(11) NOT NULL,
  `CAQUATER` int(11) NOT NULL,
  `CAWEEK` int(11) NOT NULL,
  `CADAYOFWEEK` int(11) NOT NULL,
  `CAWEEKENDFLAG` bit(1) NOT NULL,
  `CADAYNAME` varchar(10) DEFAULT '',
  `CAMONTHNAME` varchar(10) DEFAULT '',
  `CACOMMENT` varchar(255) DEFAULT '',
  `CAWORKPERCENT` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`CAIDDATE`),
  UNIQUE KEY `td_dbdate_idx` (`CAFULLDATE`),
  UNIQUE KEY `td_ymd_idx` (`CAYEAR`,`CAMONTH`,`CADAY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=67;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdcondition
DROP TABLE IF EXISTS `stdcondition`;
CREATE TABLE IF NOT EXISTS `stdcondition` (
  `CONDTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ARTICLENO` varchar(128) DEFAULT NULL COMMENT 'Artikel-Nummer',
  `VARIANT` varchar(50) DEFAULT NULL COMMENT 'Variante',
  `BUSINESSNO` varchar(50) DEFAULT NULL COMMENT 'Lieferanten-/Kundennummer',
  `LEDGERACCOUNTTYP` varchar(50) DEFAULT NULL COMMENT 'Kontokorrent',
  `DATEVALIDFROM` datetime DEFAULT NULL COMMENT 'gültig ab',
  `DATEVALIDTO` datetime DEFAULT NULL COMMENT 'gültig bis',
  `QUANTITY` double DEFAULT NULL COMMENT 'ab Menge',
  `CURRENCY` varchar(50) DEFAULT NULL COMMENT 'Währung',
  `CONCERN` varchar(50) DEFAULT NULL COMMENT 'Konzern',
  `PRICE` double DEFAULT NULL COMMENT 'Preis',
  `PRICEUNIT` double DEFAULT NULL COMMENT 'Preis-Einheit',
  `PRICENET` bit(1) DEFAULT NULL COMMENT 'Kennung Netto-Preis',
  `PRICEFOREIGN` double DEFAULT NULL COMMENT 'Preis Fremdwährung',
  `DISCOUNT1` double DEFAULT NULL COMMENT 'Artikel-Rabatt',
  `DISCOUNTRULE1` varchar(50) DEFAULT NULL COMMENT 'Artikel-Rabatt Rechenregel',
  `DISCONTNAME1` varchar(50) DEFAULT NULL COMMENT 'Artikel-Rabatt Bezeichnung',
  `DISCOUNT2` double DEFAULT NULL,
  `DISCOUNTRULE2` varchar(50) DEFAULT NULL,
  `DISCOUNTNAME2` varchar(50) DEFAULT NULL,
  `CUSTOMC01` varchar(256) DEFAULT NULL,
  `CUSTOMC02` varchar(256) DEFAULT NULL,
  `CUSTOMC03` varchar(256) DEFAULT NULL,
  `CUSTOMC04` varchar(256) DEFAULT NULL,
  `CUSTOMC05` varchar(256) DEFAULT NULL,
  `CUSTOMC06` varchar(256) DEFAULT NULL,
  `CUSTOMC07` varchar(256) DEFAULT NULL,
  `CUSTOMC08` varchar(256) DEFAULT NULL,
  `CUSTOMC09` varchar(256) DEFAULT NULL,
  `CUSTOMC10` varchar(256) DEFAULT NULL,
  `CUSTOMN01` double DEFAULT NULL,
  `CUSTOMN02` double DEFAULT NULL,
  `CUSTOMN03` double DEFAULT NULL,
  `CUSTOMN04` double DEFAULT NULL,
  `CUSTOMN05` double DEFAULT NULL,
  `CUSTOMB01` bit(1) DEFAULT NULL,
  `CUSTOMB02` bit(1) DEFAULT NULL,
  `CUSTOMB03` bit(1) DEFAULT NULL,
  `CUSTOMB04` bit(1) DEFAULT NULL,
  `CUSTOMB05` bit(1) DEFAULT NULL,
  `PARTCONDGROUP` varchar(12) DEFAULT NULL COMMENT 'Artikel-Konditions-Gruppe',
  `BUSCONDGROUP` varchar(12) DEFAULT NULL COMMENT 'Partner-Konditions-Gruppe',
  `PRICESOURCE` varchar(50) DEFAULT NULL COMMENT 'Preis Herkunft',
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`CONDTABLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdcontact
DROP TABLE IF EXISTS `stdcontact`;
CREATE TABLE IF NOT EXISTS `stdcontact` (
  `CONTTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTADRNUMBER` int(11) NOT NULL DEFAULT 0 COMMENT 'Adresse Kontakt',
  `CONTLEDGERACCOUNTTYP` varchar(50) DEFAULT NULL COMMENT 'Kontokorrent',
  `CONTBUSINESSNO` varchar(50) DEFAULT NULL COMMENT 'Lieferanten-/Kundennummer',
  `CONTMAINCONTACT` bit(1) DEFAULT b'0' COMMENT 'Ansprechpartner',
  `CONSTSORT` int(11) DEFAULT NULL COMMENT 'Sortierung',
  `CONTSALUTION` varchar(50) DEFAULT NULL COMMENT 'Anrede',
  `CONTTITLE` varchar(50) DEFAULT NULL COMMENT 'Titel',
  `CONTCONTACTNAME` varchar(256) DEFAULT NULL COMMENT 'Kontakt-Name',
  `CONTCONTACTLASTNAME` varchar(256) DEFAULT NULL COMMENT 'Kontakt-Nachname',
  `CONTCONTACTTEL` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Telefon',
  `CONTACTMOBILE` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Mobil',
  `CONTCONTACTFAX` varchar(50) DEFAULT NULL COMMENT 'Kontakt-Fax',
  `CONTCONTACTEMAIL` varchar(256) DEFAULT NULL COMMENT 'Kontakt-Email',
  `CONTFUNCTION` varchar(256) DEFAULT NULL COMMENT 'Funktion im Unternehmen',
  `CONTCOMMENTAR` text DEFAULT NULL COMMENT 'Kommentar',
  `CONTKEYWORD` varchar(128) DEFAULT NULL COMMENT 'Keyword',
  `CONTCUSTOMN01` double DEFAULT NULL,
  `CONTCUSTOMN02` double DEFAULT NULL,
  `CONTCUSTOMN03` double DEFAULT NULL,
  `CONTCUSTOMN04` double DEFAULT NULL,
  `CONTCUSTOMN05` double DEFAULT NULL,
  `CONTCUSTOMD01` datetime DEFAULT NULL,
  `CONTCUSTOMD02` datetime DEFAULT NULL,
  `CONTCUSTOMD03` datetime DEFAULT NULL,
  `CONTCUSTOMD04` datetime DEFAULT NULL,
  `CONTCUSTOMD05` datetime DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`CONTTABLEID`),
  KEY `CONTADRNUMBER` (`CONTADRNUMBER`),
  KEY `CONTLEDGERACCOUNTTYP` (`CONTLEDGERACCOUNTTYP`,`CONTBUSINESSNO`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=1170 COMMENT='Ansprechpartner';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdcountry
DROP TABLE IF EXISTS `stdcountry`;
CREATE TABLE IF NOT EXISTS `stdcountry` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `IDENT` varchar(10) NOT NULL,
  `COUNTRYNAME` varchar(255) DEFAULT NULL,
  `COUNTRYCODE2` varchar(255) DEFAULT NULL,
  `COUNTRYCODE3` varchar(255) DEFAULT NULL,
  `LANQ01` varchar(20) DEFAULT NULL,
  `LANQKEY01` varchar(20) DEFAULT NULL,
  `LANQ02` varchar(20) DEFAULT NULL,
  `LANQKEY02` varchar(20) DEFAULT NULL,
  `LANQ03` varchar(20) DEFAULT NULL,
  `LANQKEY03` varchar(20) DEFAULT NULL,
  `LANQ04` varchar(20) DEFAULT NULL,
  `LANQKEY04` varchar(20) DEFAULT NULL,
  `LANQ05` varchar(20) DEFAULT NULL,
  `LANQKEY05` varchar(20) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `CURRENCY` varchar(10) DEFAULT NULL,
  `CONTRYTYPE` varchar(20) DEFAULT NULL,
  `EG_TYPE` varchar(20) DEFAULT NULL,
  `USERGROUP` varchar(1024) DEFAULT NULL,
  `COUNTRYGRP01` varchar(256) DEFAULT NULL,
  `COUNTRYGRP02` varchar(20) DEFAULT NULL,
  `COUNTRYGRP03` varchar(20) DEFAULT NULL,
  `PATHTOFLAG` varchar(255) DEFAULT NULL,
  `LANQKEY` varchar(20) DEFAULT NULL,
  `PRICELISTTYPE01` varchar(50) DEFAULT NULL,
  `PRICELISTTYPE02` varchar(50) DEFAULT NULL,
  `MSCULTURE` varchar(10) DEFAULT NULL,
  `TAXGROUP` varchar(50) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  KEY `IX_SDTCOUNTRY01` (`COUNTRYNAME`),
  KEY `IX_SDTCOUNTRY02` (`IDENT`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=266;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdcountryculture
DROP TABLE IF EXISTS `stdcountryculture`;
CREATE TABLE IF NOT EXISTS `stdcountryculture` (
  `COUNTRY` varchar(128) DEFAULT NULL,
  `TWOLETTERCOUNTRYCODE` varchar(10) DEFAULT NULL,
  `TREELETTERCOUNTRYCODE` varchar(10) DEFAULT NULL,
  `LANGUAGE` varchar(128) DEFAULT NULL,
  `TWOLETTERLANGCODE` varchar(10) DEFAULT NULL,
  `THREELETTERLANGCODE` varchar(10) DEFAULT NULL,
  `CULTUREINFOCODE` varchar(20) NOT NULL,
  PRIMARY KEY (`CULTUREINFOCODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=78;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdcurrency
DROP TABLE IF EXISTS `stdcurrency`;
CREATE TABLE IF NOT EXISTS `stdcurrency` (
  `CURRKEY` varchar(5) NOT NULL DEFAULT '',
  `CURRNAME` varchar(255) DEFAULT NULL,
  `CURRDESCRIPTION` varchar(255) DEFAULT NULL,
  `CURREXCHANGERATE` double DEFAULT NULL,
  `CURRROUNDING` double DEFAULT NULL,
  `CURRSYMBOL` varchar(11) DEFAULT NULL,
  `CURRDATE` date DEFAULT NULL,
  PRIMARY KEY (`CURRKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=496;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdeledefatt
DROP TABLE IF EXISTS `stdeledefatt`;
CREATE TABLE IF NOT EXISTS `stdeledefatt` (
  `ATTNODE` varchar(20) NOT NULL,
  `ATTTYP` varchar(10) DEFAULT '',
  `ATTINTDESC` varchar(256) DEFAULT '',
  `ATTGRP01` varchar(20) DEFAULT '',
  `ATTGRP02` varchar(20) DEFAULT '',
  `ATTGRP03` varchar(20) DEFAULT '',
  `ATTGRP04` varchar(20) DEFAULT '',
  `ATTGRP05` varchar(20) DEFAULT '',
  `ATTUNIT01` varchar(10) DEFAULT '',
  `LANQKEY01` varchar(20) DEFAULT '',
  `ATTIMAGEPATH01` varchar(256) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(40) DEFAULT '',
  `ESUSRMODIFYED` varchar(40) DEFAULT '',
  PRIMARY KEY (`ATTNODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='KALK_ELEMENT Attribute Tabelle';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdeledefgrp
DROP TABLE IF EXISTS `stdeledefgrp`;
CREATE TABLE IF NOT EXISTS `stdeledefgrp` (
  `GRPNODE` varchar(20) NOT NULL,
  `GRPTYP` varchar(10) DEFAULT '',
  `GRPINTDESC` varchar(256) DEFAULT '',
  `GRPGRP01` varchar(20) DEFAULT '',
  `GRPGRP02` varchar(20) DEFAULT '',
  `GRPGRP03` varchar(20) DEFAULT '',
  `GRPGRP04` varchar(20) DEFAULT '',
  `GRPGRP05` varchar(20) DEFAULT '',
  `GRPUNIT01` varchar(10) DEFAULT '',
  `LANQKEY01` varchar(20) DEFAULT '',
  `GRPIMAGEPATH01` varchar(256) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(40) DEFAULT '',
  `ESUSRMODIFYED` varchar(40) DEFAULT '',
  PRIMARY KEY (`GRPNODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='KALK_ELEMENT Gruppen Tabelle';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdeledefref
DROP TABLE IF EXISTS `stdeledefref`;
CREATE TABLE IF NOT EXISTS `stdeledefref` (
  `XNODE` varchar(20) NOT NULL DEFAULT '',
  `XNODEPARENT` varchar(20) NOT NULL DEFAULT '',
  `XNODEORG` varchar(20) DEFAULT '',
  `XPOSITION` int(11) DEFAULT 0,
  `XRELTYP` varchar(20) DEFAULT '',
  `XCOUNTRYS` varchar(4000) DEFAULT '',
  `XINTDESC` varchar(256) DEFAULT '',
  `XCOMMENT` varchar(256) DEFAULT '',
  `XNODEACTION01` varchar(10) DEFAULT '',
  `XLANQKEY01` int(11) DEFAULT 0,
  `XADMINSHOW` bit(1) DEFAULT b'0',
  `XGRP01` varchar(20) DEFAULT '',
  `XGRP02` varchar(20) DEFAULT '',
  `XGRP03` varchar(20) DEFAULT '',
  `XGRP04` varchar(20) DEFAULT '',
  `XGRP05` varchar(20) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(40) DEFAULT '',
  `ESUSRMODIFYED` varchar(40) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='KALK_ELEMENT Verknüpfungstabelle Tabelle';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdeledefval
DROP TABLE IF EXISTS `stdeledefval`;
CREATE TABLE IF NOT EXISTS `stdeledefval` (
  `VALNODE` varchar(20) NOT NULL,
  `VALTYP` varchar(10) DEFAULT '',
  `VALDESC` varchar(128) DEFAULT '',
  `VALCOMMENT` varchar(255) DEFAULT NULL,
  `VALGRP01` varchar(20) DEFAULT '',
  `VALGRP02` varchar(20) DEFAULT '',
  `VALGRP03` varchar(20) DEFAULT '',
  `VALGRP04` varchar(20) DEFAULT '',
  `VALGRP05` varchar(20) DEFAULT '',
  `VALFORMAT` varchar(10) DEFAULT '',
  `VALUE01` varchar(50) DEFAULT '',
  `VALUE02` varchar(50) DEFAULT '',
  `VALUE03` varchar(50) DEFAULT '',
  `VALUE04` varchar(50) DEFAULT '',
  `VALUE05` varchar(50) DEFAULT '',
  `VALUNIT01` varchar(10) DEFAULT '',
  `VALUNIT02` varchar(10) DEFAULT '',
  `VALUNIT03` varchar(10) DEFAULT '',
  `VALUNIT04` varchar(10) DEFAULT '',
  `VALUNIT05` varchar(10) DEFAULT '',
  `VALOUTPFORMAT01` varchar(128) DEFAULT '',
  `VALOUTPFORMAT02` varchar(128) DEFAULT '',
  `VALOUTPFORMAT03` varchar(128) DEFAULT '',
  `VALOUTPFORMAT04` varchar(128) DEFAULT '',
  `VALOUTPFORMAT05` varchar(128) DEFAULT '',
  `LANQKEY` varchar(20) DEFAULT '',
  `VALIMAGEPATH01` varchar(256) DEFAULT '',
  `IDENTERP01` varchar(20) DEFAULT '',
  `IDENTERP02` varchar(20) DEFAULT '',
  `IDENTERP03` varchar(20) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(40) DEFAULT '',
  `ESUSRMODIFYED` varchar(40) DEFAULT '',
  PRIMARY KEY (`VALNODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='KALK_ELEMENT Werte Tabelle';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdfixcosts
DROP TABLE IF EXISTS `stdfixcosts`;
CREATE TABLE IF NOT EXISTS `stdfixcosts` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `TYP` varchar(50) DEFAULT NULL COMMENT 'Typ ',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'Beschreibung',
  `AMOUNTNETTO` double DEFAULT 0 COMMENT 'Betrag Netto',
  `AMOUNTBRUTTO` double DEFAULT 0 COMMENT 'Betrag Brutto',
  `CATEGORY` varchar(50) DEFAULT NULL COMMENT 'Kategorie (Software, Miete, Personal, ..)',
  `ACCOUNT` varchar(50) DEFAULT NULL COMMENT 'Bankkonto',
  `PARENTID` int(11) DEFAULT NULL COMMENT 'Eltern ID für Gruppierungen',
  `AMOUNTWAGETAX` double DEFAULT 0 COMMENT 'Lohnsteuer Netto',
  `AMOUNTINSURANCE` double DEFAULT 0 COMMENT 'Sozialversicherung Netto',
  `SUPPLIER` varchar(255) DEFAULT NULL,
  `DEBITDAY` int(11) DEFAULT NULL COMMENT 'Abbuchungstag',
  `DEBITPERIOD` varchar(50) DEFAULT NULL COMMENT 'Abbuchungsintervall',
  `DEBITMONTH` varchar(50) DEFAULT NULL,
  `COMMENT` text DEFAULT NULL COMMENT 'Kommentar',
  `PAYMENTMETHOD` varchar(50) DEFAULT NULL COMMENT 'VISA, Rechnung, Paypal, ...',
  `DEBITAUTOMATICALLY` bit(1) DEFAULT NULL COMMENT 'Automatische Abbuchung (ja / nein)',
  `ISACTIVE` bit(1) DEFAULT NULL,
  `ESDATEADDED` datetime NOT NULL DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) NOT NULL DEFAULT '',
  `ESUSRMODIFYED` varchar(64) NOT NULL DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESROWVERSION` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdgroup2column
DROP TABLE IF EXISTS `stdgroup2column`;
CREATE TABLE IF NOT EXISTS `stdgroup2column` (
  `ZAEHLER` int(11) NOT NULL AUTO_INCREMENT,
  `GROUPNUMBER` varchar(50) DEFAULT NULL,
  `GROUPNAME` varchar(100) DEFAULT NULL,
  `COLUMNNAME` varchar(100) DEFAULT NULL,
  `VALUEE` varchar(4000) DEFAULT NULL,
  `VALUEF` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`ZAEHLER`),
  KEY `IX_SDTGROUPCOLUMN` (`GROUPNAME`,`COLUMNNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=621 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=819;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdgroup2work
DROP TABLE IF EXISTS `stdgroup2work`;
CREATE TABLE IF NOT EXISTS `stdgroup2work` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUPNUMBER` int(11) DEFAULT NULL,
  `GROUPNAME` varchar(50) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `VALUEWORK` varchar(50) DEFAULT NULL,
  `PARTNUMBER` varchar(50) DEFAULT NULL,
  `TIMEDURATION01` double DEFAULT NULL,
  `TIMEDURATION02` double DEFAULT NULL,
  `TIMEUNIT` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  KEY `IX_SDTGROUPWORK01` (`GROUPNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=119;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdlookup
DROP TABLE IF EXISTS `stdlookup`;
CREATE TABLE IF NOT EXISTS `stdlookup` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `SDLOOKTYPE` varchar(20) DEFAULT NULL,
  `SDLOOKKEY` varchar(50) DEFAULT NULL,
  `SDLOOKSORT` int(11) DEFAULT NULL,
  `SDLOOKINTERN` varchar(50) DEFAULT NULL,
  `SDLANQKEY` varchar(20) DEFAULT NULL,
  `VALUE01` varchar(50) DEFAULT NULL,
  `VALUE02` varchar(50) DEFAULT NULL,
  `VALUE03` varchar(50) DEFAULT NULL,
  `VALUE04` varchar(50) DEFAULT NULL,
  `VALUE05` varchar(50) DEFAULT NULL,
  `VALUE06` varchar(50) DEFAULT NULL,
  `VALUE07` varchar(50) DEFAULT NULL,
  `VALUE08` varchar(50) DEFAULT NULL,
  `VALUE09` text DEFAULT NULL,
  `VALUE10` text DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_stdlookup` (`SDLOOKTYPE`,`SDLOOKKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=832 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=148;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdlookupheader
DROP TABLE IF EXISTS `stdlookupheader`;
CREATE TABLE IF NOT EXISTS `stdlookupheader` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `SDLOOKTYPE` varchar(20) NOT NULL,
  `DESCRIPTION` varchar(256) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_stdlookupheader_SDLOOKTYPE` (`SDLOOKTYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=297;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdmaintancecosts
DROP TABLE IF EXISTS `stdmaintancecosts`;
CREATE TABLE IF NOT EXISTS `stdmaintancecosts` (
  `TABLEID` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `AMOUNTNETTO` double DEFAULT NULL,
  `AMOUNTBRUTTO` double DEFAULT NULL,
  `AMOUNTPURCHASENETTO` varchar(255) DEFAULT NULL,
  `AMOUNTPURCHASEBRUTTO` varchar(255) DEFAULT NULL,
  `AMOUNTPROFITNETTO` varchar(255) DEFAULT NULL,
  `AMOUNTPROFITBRUTTO` varchar(255) DEFAULT NULL,
  `DUEDATEMONTH` varchar(255) DEFAULT NULL,
  `DUEDATEPERIOD` varchar(255) DEFAULT NULL,
  `PROJECT` varchar(255) DEFAULT NULL,
  `ESDATEADDED` datetime NOT NULL DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) NOT NULL DEFAULT '',
  `ESUSRMODIFYED` varchar(64) NOT NULL DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESROWVERSION` int(11) NOT NULL DEFAULT 0,
  `ISACTIVE` bit(1) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdobjectformat
DROP TABLE IF EXISTS `stdobjectformat`;
CREATE TABLE IF NOT EXISTS `stdobjectformat` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(50) NOT NULL DEFAULT '' COMMENT 'Typ des Formats',
  `BUSBUSINESSNO` varchar(50) NOT NULL DEFAULT '' COMMENT 'Kundennummer (für Standard "DEFAULT")',
  `DOCTYPE` varchar(50) NOT NULL DEFAULT '' COMMENT 'Dokumenttyp (für Standard "1")',
  `DIRECTORYSTRUCT` varchar(511) DEFAULT '' COMMENT 'Ordnerstruktur',
  `FILENAME` varchar(511) DEFAULT '' COMMENT 'Dateiname',
  `FILEKEY` int(11) DEFAULT 0 COMMENT 'Schlüssel, welche Datei betroffen ist (Default = Zeichnung, 1 = Anhangdokumente)',
  `OBJCUSTOMC01` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC02` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC03` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC04` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC05` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC06` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC07` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC08` varchar(255) DEFAULT NULL,
  `OBJCUSTOMC09` varchar(255) DEFAULT NULL,
  `OBJCUSTOMN01` double DEFAULT NULL,
  `OBJCUSTOMN02` double DEFAULT NULL,
  `OBJCUSTOMN03` double DEFAULT NULL,
  `OBJCUSTOMN04` double DEFAULT NULL,
  `OBJCUSTOMN05` double DEFAULT NULL,
  `OBJCUSTOMD01` datetime DEFAULT NULL,
  `OBJCUSTOMD02` datetime DEFAULT NULL,
  `OBJCUSTOMD03` datetime DEFAULT NULL,
  `OBJCUSTOMD04` datetime DEFAULT NULL,
  `OBJCUSTOMD05` datetime DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdparts
DROP TABLE IF EXISTS `stdparts`;
CREATE TABLE IF NOT EXISTS `stdparts` (
  `PARTTABLEID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Steuerung Lagerführung',
  `PARTARTIKELNO` varchar(128) DEFAULT '' COMMENT 'Artikel-Nummer',
  `PARTVARIANT` varchar(50) DEFAULT '' COMMENT 'Artikel-Variante',
  `PARTDRAWINGNO` varchar(255) DEFAULT '' COMMENT 'Zeichungs-Nummer',
  `PARTDESCRIPTION1` varchar(512) DEFAULT '' COMMENT 'Bezeichnung 1',
  `PARTDESCRIPTION2` varchar(512) DEFAULT '' COMMENT 'Bezeichnung 2',
  `PARTDESCRIPTION3` varchar(512) DEFAULT '' COMMENT 'Bezeichnung 3',
  `PARTMATCHCODE` varchar(128) DEFAULT '' COMMENT 'Match-Code',
  `PARTUNIT` varchar(12) DEFAULT '' COMMENT 'Mengen-Einheit',
  `PARTUNITEK` varchar(12) DEFAULT '' COMMENT 'Mengeneinheit Einkauf',
  `PARTUNITEKFAKTOR` double DEFAULT 1 COMMENT 'Mengeneinheit Umrechnungsfaktor Lager Einkauf',
  `PARTWEIGHT` double DEFAULT 0 COMMENT 'Gewicht',
  `PARTWEIGHTUNIT` varchar(12) DEFAULT '' COMMENT 'Gewichts-Einheit',
  `PARTPRICE` double DEFAULT 0 COMMENT 'frei (Für Preis vorgesehen)',
  `PARTPRICEDATE` datetime DEFAULT NULL COMMENT 'frei (Für Preisdatum vorgesehen)',
  `PARTCATEGORY` varchar(30) DEFAULT '' COMMENT 'Artikel-Kategorie',
  `PARTTYPE` varchar(256) DEFAULT NULL COMMENT 'Artikel Typ (old Partgroup01)',
  `PARTMANUELL` bit(1) DEFAULT b'0' COMMENT '0 = Manuell erfasst , 1= importiert',
  `PARTCUSTOMC01` varchar(256) DEFAULT '' COMMENT 'Standard: EPREIS (ist nicht zwingend Preis)',
  `PARTCUSTOMC02` varchar(256) DEFAULT '',
  `PARTCUSTOMC03` varchar(256) DEFAULT '',
  `PARTCUSTOMC04` varchar(256) DEFAULT '',
  `PARTCUSTOMC05` varchar(256) DEFAULT '',
  `PARTCUSTOMC06` varchar(256) DEFAULT '',
  `PARTCUSTOMC07` varchar(256) DEFAULT '',
  `PARTCUSTOMC08` varchar(256) DEFAULT '',
  `PARTCUSTOMC09` varchar(256) DEFAULT '',
  `PARTCUSTOMC10` varchar(256) DEFAULT '',
  `PARTCUSTOMC11` varchar(256) DEFAULT '',
  `PARTCUSTOMC12` varchar(256) DEFAULT '',
  `PARTCUSTOMC13` varchar(256) DEFAULT '',
  `PARTCUSTOMC14` varchar(256) DEFAULT '',
  `PARTCUSTOMC15` varchar(256) DEFAULT '',
  `PARTCUSTOMC16` varchar(256) DEFAULT '',
  `PARTCUSTOMC17` varchar(256) DEFAULT '',
  `PARTCUSTOMC18` varchar(256) DEFAULT '',
  `PARTCUSTOMC19` varchar(256) DEFAULT '',
  `PARTCUSTOMC20` varchar(256) DEFAULT '',
  `PARTCUSTOMN01` double DEFAULT 0,
  `PARTCUSTOMN02` double DEFAULT 0,
  `PARTCUSTOMN03` double DEFAULT 0,
  `PARTCUSTOMN04` double DEFAULT 0,
  `PARTCUSTOMN05` double DEFAULT 0,
  `PARTCUSTOMD01` datetime DEFAULT NULL,
  `PARTCUSTOMD02` datetime DEFAULT NULL,
  `PARTCUSTOMD03` datetime DEFAULT NULL,
  `PARTCUSTOMD04` datetime DEFAULT NULL,
  `PARTCUSTOMD05` datetime DEFAULT NULL,
  `PARTCUSTOMB01` bit(1) DEFAULT b'0',
  `PARTCUSTOMB02` bit(1) DEFAULT b'0',
  `PARTCUSTOMB03` bit(1) DEFAULT b'0',
  `PARTCUSTOMB04` bit(1) DEFAULT b'0',
  `PARTCUSTOMB05` bit(1) DEFAULT b'0',
  `PARTGROUP01` varchar(50) DEFAULT '',
  `PARTGROUP02` varchar(50) DEFAULT '' COMMENT 'ERSATZTEIL Kenner',
  `PARTGROUP03` varchar(50) DEFAULT '' COMMENT 'OBERFLÄCHE Kenner',
  `PARTGROUP04` varchar(50) DEFAULT '',
  `PARTGROUP05` varchar(50) DEFAULT '',
  `PARTGROUP06` varchar(50) DEFAULT '',
  `PARTGROUP07` varchar(50) DEFAULT '',
  `PARTGROUP08` varchar(50) DEFAULT '',
  `PARTGROUP09` varchar(50) DEFAULT '',
  `PARTGROUP10` varchar(50) DEFAULT '',
  `PARTCONDGROUPVENDOR` varchar(50) DEFAULT '' COMMENT 'Artikel-Gruppe für Conditions Lieferant',
  `PARTCONDGROUP` varchar(50) DEFAULT '' COMMENT 'Artikel-Gruppe für Conditions',
  `PARTSTOREHOUSE` varchar(50) DEFAULT '' COMMENT 'Lager',
  `PARTSTORELOCATION` varchar(50) DEFAULT '' COMMENT 'Lagerfach',
  `PARTSTDVENDOR` varchar(50) DEFAULT '' COMMENT 'Standard-Lieferant',
  `PARTCADPRODUCER` varchar(50) DEFAULT '' COMMENT 'CAD Hersteller',
  `PARTVENDORTEXT` text DEFAULT '' COMMENT 'Werkstoff ; Bestellnummer ; Bestelltext',
  `PARTCADVERSION` varchar(10) DEFAULT '0.0' COMMENT 'CAD Version  Major.Minor',
  `PARTNORMTEXT` varchar(254) DEFAULT '' COMMENT 'CAD Normbezeichnung',
  `PARTCOLOR` varchar(128) DEFAULT '',
  `PARTCADCATEGORY` varchar(10) DEFAULT '' COMMENT 'CAD Kennung welcher DEFAULT Artikel bei Neuanlage (speedyPDM: FKZ)',
  `PARTCADUSAGE` varchar(64) DEFAULT '' COMMENT 'CAD Verwendungstyp',
  `PARTDIMENSION` varchar(64) DEFAULT '' COMMENT 'CAD Abmessungen',
  `PARTPROPBOX` varchar(64) DEFAULT '' COMMENT 'CAD Abmessungen (Box)',
  `PARTWERKSTOFF` varchar(64) DEFAULT '' COMMENT 'CAD Werkstoff',
  `PARTRTF` text DEFAULT '' COMMENT 'Artikeltext formatiert als RTF',
  `PARTCOMMENTERP` text DEFAULT '' COMMENT 'Erp Kommentar',
  `PARTRELEASED` bit(1) DEFAULT b'0' COMMENT 'Artikel freigegeben',
  `PARTRELEASEDDATE` datetime DEFAULT NULL COMMENT 'Freigabe-Datum',
  `PARTRELEASEDUSER` varchar(64) DEFAULT '' COMMENT 'Freigabe-Benutzer',
  `BOMRELEASED` bit(1) DEFAULT b'0' COMMENT 'Freigabe Stückliste',
  `BOMRELEASEDDATE` datetime DEFAULT NULL COMMENT 'Datum Freigabe Stückliste',
  `PARTDISPO` varchar(50) DEFAULT '' COMMENT 'Dispo-Art',
  `PARTPRICEUNIT` double DEFAULT 1 COMMENT 'Preis-Einheit',
  `PARTBLOCKED` bit(1) DEFAULT b'0' COMMENT 'Kz gesperrt',
  `PARTDELETED` bit(1) DEFAULT b'0' COMMENT 'Kz gelöscht',
  `PARTPROCUREMENTTYPE` varchar(10) DEFAULT '' COMMENT 'Beschaffungsart',
  `PARTMINSTOCKLEVEL` double DEFAULT 0 COMMENT 'Mindestbestand',
  `PARTSECSTOCKLEVEL` double DEFAULT 0 COMMENT 'Sicherheitsbestand',
  `PARTLOTSIZE` double DEFAULT 0 COMMENT 'Losgröße',
  `PARTLASTCOSTPRICE` double DEFAULT 0 COMMENT 'letzter Einstandspreis',
  `PARATLASTCOSTPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum letzter Einstandspreis',
  `PARTSTDPRICE` double DEFAULT 0 COMMENT 'Standard-Preis',
  `PARTSTDPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum Standard-Preis',
  `PARTMANUFACTORINGPRICE` double DEFAULT 0 COMMENT 'Herstell-Kosten',
  `PARTMANUFACTORINGPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum Herstell-Kosten',
  `PARTMANUFACTORINGTEXT` varchar(1024) DEFAULT '' COMMENT 'Text Fertigung',
  `PARTINVENTORYPRICE` double DEFAULT 0 COMMENT 'Inventur-Preis',
  `PARTINVENTORYPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum Inventurpreis',
  `PARTTOOLPROTECT` bit(1) DEFAULT b'0' COMMENT 'Werkzeug geschützt',
  `PARTPRINTTEXT` varchar(1024) DEFAULT '' COMMENT 'Text für alle externen Dokumente VER',
  `PARTPICKTEXT` varchar(1024) DEFAULT '' COMMENT 'Kommissionier-Text',
  `PARTEAN` varchar(20) DEFAULT '' COMMENT 'EAN',
  `PARTCTN` varchar(20) DEFAULT '' COMMENT 'Zoll-Tarifnummer',
  `PARTINTRAUNIT` varchar(20) DEFAULT '' COMMENT 'Intrastat abw.  Einheit',
  `PARTINTRAUNITFACTOR` double DEFAULT 0 COMMENT 'Intrastat abw. Einheit, Umrechnungsfaktor zu Lager',
  `PARTVAT` varchar(50) DEFAULT '' COMMENT 'MwSt.',
  `PARTREVENUEACCOUNT` varchar(50) DEFAULT '' COMMENT 'Erlös-Konto',
  `PARTREVENUEACCOUNTFOREIGN` varchar(50) DEFAULT '' COMMENT 'Erlös-Konte Export',
  `PARTEXPENSEACCOUNT` varchar(50) DEFAULT '' COMMENT 'Aufwandskonto',
  `PARTCOSTUNIT` varchar(50) DEFAULT '' COMMENT 'Kostenstelle',
  `PARTCOSTOBJECT` varchar(50) DEFAULT '' COMMENT 'Kostenträger',
  `PARTPREFERENTIAL` bit(1) DEFAULT b'0' COMMENT 'Präferenzberechtigt',
  `PARTCOUNTRYORIGIN` varchar(50) DEFAULT '' COMMENT 'Ursprungsland',
  `PARTREGIONINTRA` varchar(50) DEFAULT '' COMMENT 'Intrastat Region',
  `PARTSALESUNIT` varchar(50) DEFAULT '' COMMENT 'VPE Verkauf',
  `PARTSALESUNITFACTOR` double DEFAULT NULL COMMENT 'Umrechnungsfaktor Verkaufseinheit zu Lager',
  `PARTSTOCKACCOUNT` varchar(50) DEFAULT '' COMMENT 'Bestandskonto',
  `PARTBUYER` varchar(50) DEFAULT '' COMMENT 'Einkäufer',
  `PARTSALESRESPOSIBLE` varchar(50) DEFAULT '' COMMENT 'Verkäufer',
  `PARTSALESPRICE` double DEFAULT 0 COMMENT 'Verkaufspreis',
  `PARTSALESPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum zum Verkaufspreis',
  `PARTSALESPRICEUNIT` double DEFAULT 1,
  `PARTSALESLISTGROUP` varchar(10) DEFAULT '' COMMENT 'Gruppe für Preisliste',
  `PARTMATERIALPLANER` varchar(50) DEFAULT '' COMMENT 'Disponent',
  `PARTVENDORDELIVERYTIME` int(11) DEFAULT NULL COMMENT 'Lieferzeit Beschaffung',
  `PARTVENDORTRANSPORTTIME` int(11) DEFAULT NULL COMMENT 'Transport-Zeit Beschaffung',
  `PARTVENDORQUALITYTEXT` varchar(1024) DEFAULT '' COMMENT 'Qualitäts-Text Wareneingang',
  `PARTMINORDERQUANTITY` double DEFAULT 0 COMMENT 'Mindestbestell-Menge',
  `PARTCADCONSTRUCTOR` varchar(20) DEFAULT '' COMMENT 'CAD Konstrukteur',
  `PARTSTOCKKEEPING` bit(1) DEFAULT b'0',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`PARTTABLEID`),
  UNIQUE KEY `UK_stdparts_PARTARTIKELNO` (`PARTARTIKELNO`),
  KEY `IDX_stdparts_PARTDESCRIPTION1` (`PARTDESCRIPTION1`),
  KEY `IDX_stdparts_PARTDRAWINGNO` (`PARTDRAWINGNO`)
) ENGINE=InnoDB AUTO_INCREMENT=2356 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=369 COMMENT='Standard Artikel';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpartsattgroup
DROP TABLE IF EXISTS `stdpartsattgroup`;
CREATE TABLE IF NOT EXISTS `stdpartsattgroup` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ATTGROUP` varchar(50) DEFAULT NULL,
  `ATTSORT` int(11) DEFAULT NULL,
  `ATTKEY` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_SDTCATMACHATT` (`ATTGROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Attributsgruppen allgemein';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpartsattrib
DROP TABLE IF EXISTS `stdpartsattrib`;
CREATE TABLE IF NOT EXISTS `stdpartsattrib` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PARTSARTIKELNO` varchar(128) DEFAULT NULL,
  `PARTSVARIANT` varchar(50) DEFAULT NULL COMMENT 'Variante',
  `ATTDEFNO` varchar(20) DEFAULT NULL,
  `ATTGROUP` varchar(28) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `VALUE01` varchar(50) DEFAULT NULL,
  `VALUE02` varchar(50) DEFAULT NULL,
  `VALUE03` varchar(50) DEFAULT NULL,
  `VALUE04` varchar(50) DEFAULT NULL,
  `VALUE05` varchar(50) DEFAULT NULL,
  `UNIT01` varchar(50) DEFAULT NULL,
  `UNIT02` varchar(50) DEFAULT NULL,
  `UNIT03` varchar(50) DEFAULT NULL,
  `UNIT04` varchar(50) DEFAULT NULL,
  `UNIT05` varchar(50) DEFAULT NULL,
  `VALTYPE01` varchar(10) DEFAULT NULL,
  `VALTYPE02` varchar(10) DEFAULT NULL,
  `VALTYPE03` varchar(10) DEFAULT NULL,
  `VALTYPE04` varchar(10) DEFAULT NULL,
  `VALTYPE05` varchar(10) DEFAULT NULL,
  `LANQKEY01` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_SDTCATMACHATTVAL` (`PARTSARTIKELNO`,`PARTSVARIANT`,`ATTDEFNO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=1638 COMMENT='Attribute für Standard Artikel';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpartsattribdef
DROP TABLE IF EXISTS `stdpartsattribdef`;
CREATE TABLE IF NOT EXISTS `stdpartsattribdef` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ATTDEFNO` varchar(20) DEFAULT NULL COMMENT 'Name',
  `ATTINTDESC` varchar(256) DEFAULT NULL COMMENT 'Beschreibung',
  `ATTINPFORMAT` varchar(256) DEFAULT NULL,
  `ATTSORT` int(11) DEFAULT NULL COMMENT 'Sortierung',
  `VALTYP01` varchar(10) DEFAULT NULL,
  `VALGRP01` varchar(20) DEFAULT NULL,
  `VALGRP02` varchar(20) DEFAULT NULL,
  `VALGRP03` varchar(20) DEFAULT NULL,
  `VALGRP04` varchar(20) DEFAULT NULL,
  `VALGRP05` varchar(20) DEFAULT NULL,
  `VALUE01` varchar(50) DEFAULT NULL,
  `VALUE02` varchar(50) DEFAULT NULL,
  `VALUE03` varchar(50) DEFAULT NULL,
  `VALUE04` varchar(50) DEFAULT NULL,
  `VALUE05` varchar(50) DEFAULT NULL,
  `VALUNIT01` varchar(10) DEFAULT NULL,
  `VALUNIT02` varchar(10) DEFAULT NULL,
  `VALUNIT03` varchar(10) DEFAULT NULL,
  `VALUNIT04` varchar(10) DEFAULT NULL,
  `VALUNIT05` varchar(10) DEFAULT NULL,
  `VALOUTPFORMAT01` varchar(1000) DEFAULT NULL,
  `VALOUTPFORMAT02` varchar(1000) DEFAULT NULL,
  `VALOUTPFORMAT03` varchar(1000) DEFAULT NULL,
  `VALOUTPFORMAT04` varchar(1000) DEFAULT NULL,
  `VALOUTPFORMAT05` varchar(1000) DEFAULT NULL,
  `LANQKEY01` varchar(20) DEFAULT NULL,
  `VALCONTROLTYP` varchar(256) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=3276 COMMENT='Definition der Attribute';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpartsdefault
DROP TABLE IF EXISTS `stdpartsdefault`;
CREATE TABLE IF NOT EXISTS `stdpartsdefault` (
  `PARTTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PARTARTIKELNO` varchar(128) DEFAULT NULL COMMENT 'Artikel-Nummer',
  `PARTVARIANT` varchar(50) DEFAULT NULL COMMENT 'Artikel-Variante',
  `PARTDRAWINGNO` varchar(255) DEFAULT NULL COMMENT 'Zeichungs-Nummer',
  `PARTDESCRIPTION1` varchar(512) DEFAULT NULL COMMENT 'Bezeichnung 1',
  `PARTDESCRIPTION2` varchar(512) DEFAULT NULL COMMENT 'Bezeichnung 2',
  `PARTDESCRIPTION3` varchar(512) DEFAULT NULL COMMENT 'Bezeichnung 3',
  `PARTMATCHCODE` varchar(128) DEFAULT NULL COMMENT 'Match-Code',
  `PARTUNIT` varchar(12) DEFAULT NULL COMMENT 'Mengen-Einheit',
  `PARTWEIGHT` double DEFAULT NULL COMMENT 'Gewicht',
  `PARTWEIGHTUNIT` varchar(12) DEFAULT NULL COMMENT 'Gewichts-Einheit',
  `PARTPRICE` double DEFAULT NULL COMMENT 'frei (Für Preis vorgesehen)',
  `PARTPRICEDATE` datetime DEFAULT NULL COMMENT 'frei (Für Preisdatum vorgesehen)',
  `PARTCATEGORY` varchar(30) DEFAULT NULL COMMENT 'Artikel-Kategorie',
  `PARTMANUELL` bit(1) DEFAULT NULL COMMENT '0 = Manuell erfasst , 1= importiert',
  `PARTCUSTOMC01` varchar(256) DEFAULT NULL COMMENT 'Standard: EPREIS (ist nicht zwingend Preis)',
  `PARTCUSTOMC02` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC03` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC04` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC05` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC06` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC07` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC08` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC09` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC10` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC11` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC12` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC13` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC14` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC15` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC16` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC17` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC18` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC19` varchar(256) DEFAULT NULL,
  `PARTCUSTOMC20` varchar(256) DEFAULT NULL,
  `PARTCUSTOMN01` double DEFAULT NULL,
  `PARTCUSTOMN02` double DEFAULT NULL,
  `PARTCUSTOMN03` double DEFAULT NULL,
  `PARTCUSTOMN04` double DEFAULT NULL,
  `PARTCUSTOMN05` double DEFAULT NULL,
  `PARTCUSTOMD01` datetime DEFAULT NULL,
  `PARTCUSTOMD02` datetime DEFAULT NULL,
  `PARTCUSTOMD03` datetime DEFAULT NULL,
  `PARTCUSTOMD04` datetime DEFAULT NULL,
  `PARTCUSTOMD05` datetime DEFAULT NULL,
  `PARTCUSTOMB01` bit(1) DEFAULT b'0',
  `PARTCUSTOMB02` bit(1) DEFAULT b'0',
  `PARTCUSTOMB03` bit(1) DEFAULT b'0',
  `PARTCUSTOMB04` bit(1) DEFAULT b'0',
  `PARTCUSTOMB05` bit(1) DEFAULT b'0',
  `PARTGROUP01` varchar(12) DEFAULT NULL,
  `PARTGROUP02` varchar(12) DEFAULT NULL COMMENT 'ERSATZTEIL Kenner',
  `PARTGROUP03` varchar(12) DEFAULT NULL COMMENT 'OBERFLÄCHE Kenner',
  `PARTGROUP04` varchar(12) DEFAULT NULL,
  `PARTGROUP05` varchar(12) DEFAULT NULL,
  `PARTGROUP06` varchar(12) DEFAULT NULL,
  `PARTGROUP07` varchar(12) DEFAULT NULL,
  `PARTGROUP08` varchar(12) DEFAULT NULL,
  `PARTGROUP09` varchar(12) DEFAULT NULL,
  `PARTGROUP10` varchar(12) DEFAULT NULL,
  `PARTSTOREHOUSE` varchar(50) DEFAULT NULL COMMENT 'Lager',
  `PARTSTORELOCATION` varchar(50) DEFAULT NULL COMMENT 'Lagerfach',
  `PARTSTDVENDOR` varchar(50) DEFAULT NULL COMMENT 'Standard-Lieferant',
  `PARTCADPRODUCER` varchar(20) DEFAULT NULL COMMENT 'CAD Hersteller',
  `PARTVENDORTEXT` varchar(1024) DEFAULT NULL COMMENT 'Werkstoff ; Bestellnummer ; Bestelltext',
  `PARTCADVERSION` varchar(10) DEFAULT '0.0' COMMENT 'CAD Version  Major.Minor',
  `PARTNORMTEXT` varchar(254) DEFAULT NULL COMMENT 'CAD Normbezeichnung',
  `PARTCADCATEGORY` varchar(10) DEFAULT NULL COMMENT 'CAD Kennung welcher DEFAULT Artikel bei Neuanlage (speedyPDM: FKZ)',
  `PARTCADUSAGE` varchar(64) DEFAULT NULL COMMENT 'CAD Verwendungstyp',
  `PARTDIMENSION` varchar(64) DEFAULT NULL COMMENT 'CAD Abmessungen',
  `PARTPROPBOX` varchar(64) DEFAULT NULL COMMENT 'CAD Abmessungen (Box)',
  `PARTWERKSTOFF` varchar(64) DEFAULT NULL COMMENT 'CAD Werkstoff',
  `PARTRTF` text DEFAULT NULL COMMENT 'Artikeltext formatiert als RTF',
  `PARTRELEASED` bit(1) DEFAULT b'0' COMMENT 'Artikel freigegeben',
  `PARTRELEASEDDATE` datetime DEFAULT NULL COMMENT 'Freigabe-Datum',
  `PARTRELEASEDUSER` varchar(64) DEFAULT NULL COMMENT 'Freigabe-Benutzer',
  `BOMRELEASED` bit(1) DEFAULT b'0' COMMENT 'Freigabe Stückliste',
  `BOMRELEASEDDATE` datetime DEFAULT NULL COMMENT 'Datum Freigabe Stückliste',
  `PARTDISPO` varchar(50) DEFAULT NULL COMMENT 'Dispo-Art',
  `PARTPRICEUNIT` double DEFAULT NULL COMMENT 'Preis-Einheit',
  `PARTBLOCKED` bit(1) DEFAULT b'0' COMMENT 'Kz gesperrt',
  `PARTDELETED` bit(1) DEFAULT b'0' COMMENT 'Kz gelöscht',
  `PARTPROCUREMENTTYPE` varchar(10) DEFAULT NULL COMMENT 'Beschaffungsart',
  `PARTMINSTOCKLEVEL` double DEFAULT NULL COMMENT 'Mindestbestand',
  `PARTSECSTOCKLEVEL` double DEFAULT NULL COMMENT 'Sicherheitsbestand',
  `PARTLOTSIZE` double DEFAULT NULL COMMENT 'Losgröße',
  `PARTLASTCOSTPRICE` double DEFAULT NULL COMMENT 'letzter Einstandspreis',
  `PARATLASTCOSTPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum letzter Einstandspreis',
  `PARTSTDPRICE` double DEFAULT NULL COMMENT 'Standard-Preis',
  `PARTSTDPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum Standard-Preis',
  `PARTMANUFACTORINGPRICE` double DEFAULT NULL COMMENT 'Herstell-Kosten',
  `PARTMANUFACTORINGPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum Herstell-Kosten',
  `PARTMANUFACTORINGTEXT` varchar(1024) DEFAULT NULL COMMENT 'Text Fertigung',
  `PARTINVENTORYPRICE` double DEFAULT NULL COMMENT 'Inventur-Preis',
  `PARTINVENTORYPRICEDATE` datetime DEFAULT NULL COMMENT 'Datum Inventurpreis',
  `PARTTOOLPROTECT` bit(1) DEFAULT b'0' COMMENT 'Werkzeug geschützt',
  `PARTPRINTTEXT` varchar(1024) DEFAULT NULL COMMENT 'Text für alle externen Dokumente VER',
  `PARTPICKTEXT` varchar(1024) DEFAULT NULL COMMENT 'Kommissionier-Text',
  `PARTEAN` varchar(20) DEFAULT NULL COMMENT 'EAN',
  `PARTCTN` varchar(20) DEFAULT NULL COMMENT 'Zoll-Tarifnummer',
  `PARTINTRAUNIT` varchar(20) DEFAULT NULL COMMENT 'Intrastat abw.  Einheit',
  `PARTINTRAUNITFACTOR` double DEFAULT NULL COMMENT 'Intrastat abw. Einheit, Umrechnungsfaktor zu Lager',
  `PARTVAT` varchar(50) DEFAULT NULL COMMENT 'MwSt.',
  `PARTREVENUEACCOUNT` varchar(50) DEFAULT NULL COMMENT 'Erlös-Konto',
  `PARTREVENUEACCOUNTFOREIGN` varchar(50) DEFAULT NULL COMMENT 'Erlös-Konte Export',
  `PARTCOSTUNIT` varchar(50) DEFAULT NULL COMMENT 'Kostenstelle',
  `PARTCOSTOBJECT` varchar(50) DEFAULT NULL COMMENT 'Kostenträger',
  `PARTPREFERENTIAL` bit(1) DEFAULT b'0' COMMENT 'Präferenzberechtigt',
  `PARTCOUNTRYORIGIN` varchar(50) DEFAULT NULL COMMENT 'Ursprungsland',
  `PARTREGIONINTRA` varchar(50) DEFAULT NULL COMMENT 'Intrastat Region',
  `PARTSALESUNIT` varchar(50) DEFAULT NULL COMMENT 'Verkaufs- Einheit',
  `PARTSALESFUNITACTOR` double DEFAULT NULL COMMENT 'Umrechnungsfaktor Verkaufseinheit zu Lager',
  `PARTSTOCKACCOUNT` varchar(50) DEFAULT NULL COMMENT 'Bestandskonto',
  `PARTBUYER` varchar(50) DEFAULT NULL COMMENT 'Einkäufer',
  `PARTSALESRESPOSIBLE` varchar(50) DEFAULT NULL COMMENT 'Verkäufer',
  `PARTMATERIALPLANER` varchar(50) DEFAULT NULL COMMENT 'Disponent',
  `PARTVENDORDELIVERYTIME` int(11) DEFAULT NULL COMMENT 'Lieferzeit Beschaffung',
  `PARTVENDORTRANSPORTTIME` int(11) DEFAULT NULL COMMENT 'Transport-Zeit Beschaffung',
  `PARTVENDORQUALITYTEXT` varchar(1024) DEFAULT NULL COMMENT 'Qualitäts-Text Wareneingang',
  `PARTMINODERQUANTITY` double DEFAULT NULL COMMENT 'Mindestbestell-Menge',
  `PARTCADCONSTRUCTOR` varchar(20) DEFAULT NULL COMMENT 'CAD Konstrukteur',
  PRIMARY KEY (`PARTTABLEID`),
  UNIQUE KEY `UK_stdpartsdefault_PARTARTIKELNO` (`PARTARTIKELNO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=648 COMMENT='Default Artikel, zum Erstellen von neuen Artikel';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpartspricelist
DROP TABLE IF EXISTS `stdpartspricelist`;
CREATE TABLE IF NOT EXISTS `stdpartspricelist` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `LISTTYPE` varchar(10) DEFAULT '' COMMENT 'Einkauf Verkauf',
  `PRICEGROUPA` varchar(10) DEFAULT '' COMMENT 'Preisgruppe Lief/Kunde',
  `PRICEGROUPB` varchar(10) DEFAULT '' COMMENT 'Preisgruppe Artikel',
  `PARTARTIKELNO` varchar(128) DEFAULT '',
  `VARIANT` varchar(50) DEFAULT '',
  `DATEFROM` datetime DEFAULT NULL,
  `DATETO` datetime DEFAULT NULL,
  `QUANTITY` double DEFAULT 1,
  `QUANTITYUNIT` varchar(10) DEFAULT '',
  `QUANTITYUNITFAKTOR` double DEFAULT 1,
  `PRICE` double DEFAULT 0,
  `CURRENCY` varchar(10) DEFAULT '',
  `PRICEUNIT` double DEFAULT 1,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_stdpartspricelist` (`PRICEGROUPA`,`PRICEGROUPB`,`PARTARTIKELNO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Verkaufspreisliste';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpaymentterms
DROP TABLE IF EXISTS `stdpaymentterms`;
CREATE TABLE IF NOT EXISTS `stdpaymentterms` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PTNAME` varchar(56) DEFAULT '' COMMENT 'Name der Zahlungsbedingung',
  `PTTXTNUMBER` int(11) DEFAULT 0 COMMENT 'not needed !',
  `PTCOMMENT` varchar(255) DEFAULT '' COMMENT 'Zahlungsbedingung zum Drucken',
  `PTPERCENT01` double DEFAULT 0 COMMENT 'Prozent',
  `PTDAYS01` int(11) DEFAULT 0 COMMENT 'bis Tage',
  `PTPERCENT02` double DEFAULT 0,
  `PTDAYS02` int(11) DEFAULT 0,
  `PTPERCENT03` double DEFAULT 0,
  `PTDAYS03` int(11) DEFAULT 0,
  `PTPERCENT04` double DEFAULT 0,
  `PTDAYS04` int(11) DEFAULT 0,
  `PTLANGUAGE` varchar(2) DEFAULT '' COMMENT 'Sprache short',
  `PTTOREPLACE` bit(1) DEFAULT b'0' COMMENT 'ist Text als Pattern angelegt',
  `PTTOREPLPATTERN` varchar(1024) DEFAULT '' COMMENT 'Pattern zu ersetzen',
  `PTTOREPLPATTERNDAYS` varchar(1024) DEFAULT '' COMMENT 'Pattern zu ersetzen mit Tagesdatum',
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `PTNAME` (`PTNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=372;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdprintmanagement
DROP TABLE IF EXISTS `stdprintmanagement`;
CREATE TABLE IF NOT EXISTS `stdprintmanagement` (
  `PRTTABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PRTBUSINESSNO` varchar(50) DEFAULT NULL COMMENT 'Kunden/Lieferanten-Nummer',
  `PRTLEDGERACCOUNTTYP` varchar(50) DEFAULT NULL COMMENT 'Kontokorrent',
  `PRTREPORTNAME` varchar(50) DEFAULT NULL COMMENT 'Dokument',
  `PRTPRINTERFLAG` bit(1) DEFAULT NULL COMMENT 'zu Drucken',
  `PRTPRINTER` varchar(50) DEFAULT NULL COMMENT 'spezieller Drucker',
  `PRTEMAILFLAG` bit(1) DEFAULT NULL COMMENT 'per Email',
  `PRTEMAIL` varchar(256) DEFAULT NULL COMMENT 'Mail-Adresse',
  `PRTEMAILTEXT` text DEFAULT NULL,
  `PRTFAXFLAG` bit(1) DEFAULT NULL COMMENT 'per Fax',
  `PRTFAX` varchar(50) DEFAULT NULL COMMENT 'Fax-Nummer',
  `PRTFILEFLAG` bit(1) DEFAULT NULL COMMENT 'per PDF-Download',
  `PRTFILEFOLDER` varchar(256) DEFAULT NULL COMMENT 'Downloadfolder',
  `PRTEDIFLAG` bit(1) DEFAULT NULL COMMENT 'per EDI',
  `PRTEDICONTROL` varchar(50) DEFAULT NULL COMMENT 'Steuerfeld',
  `PRTEDIFOLDER` varchar(256) DEFAULT NULL COMMENT 'EDI-Folder ',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`PRTTABLEID`),
  UNIQUE KEY `PRTBUSINESSNO` (`PRTBUSINESSNO`,`PRTLEDGERACCOUNTTYP`,`PRTREPORTNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=16384;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpzedef
DROP TABLE IF EXISTS `stdpzedef`;
CREATE TABLE IF NOT EXISTS `stdpzedef` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `BDECOMPANY` varchar(20) DEFAULT '',
  `BDETYPE` varchar(10) DEFAULT '' COMMENT 'Vorgang',
  `FEEDBACKTYPE` varchar(10) DEFAULT '' COMMENT 'Vorgangtyp',
  `POSITION` int(11) DEFAULT 0,
  `FIELDTYPE` varchar(10) DEFAULT '' COMMENT 'TextEdit, DateEdit',
  `FIELDFORMAT` varchar(10) DEFAULT '' COMMENT 'TXT,NUM,DAT',
  `FIELDVISIBLE` varchar(10) DEFAULT '' COMMENT 'NO,INPUT,SHOW',
  `FIELDNAME` varchar(128) DEFAULT '' COMMENT 'Name vom Control',
  `FIELDLABEL` varchar(255) DEFAULT '',
  `FIELDCOLUMN` int(11) DEFAULT 0,
  `FIELDROW` int(11) DEFAULT 0,
  `FIELDSOURCEDEF` varchar(10) DEFAULT '',
  `FIELDSOURCE` varchar(1024) DEFAULT '',
  `FIELDVALUE` varchar(1024) DEFAULT '',
  `FIELDFORMULA` varchar(1024) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_stdpzedef_BDETYPE` (`BDETYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Bde Vorgänge definieren';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpzeemployee
DROP TABLE IF EXISTS `stdpzeemployee`;
CREATE TABLE IF NOT EXISTS `stdpzeemployee` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPOLYEENO` varchar(20) DEFAULT '',
  `EMPLOYEENAME` varchar(50) DEFAULT '',
  `SHIFTTIMENO` varchar(10) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdpzeshift
DROP TABLE IF EXISTS `stdpzeshift`;
CREATE TABLE IF NOT EXISTS `stdpzeshift` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `SHIFTTIMENO` varchar(20) DEFAULT '' COMMENT 'Modellnummer',
  `SHIFT01COMMENT` varchar(64) DEFAULT '' COMMENT 'Bezeichnung',
  `SHIFT01FROMSTART` double DEFAULT 0 COMMENT 'Startzeit Schicht 1 von',
  `SHIFT01FROMEND` double DEFAULT 0 COMMENT 'Startzeit Schicht 1 bis',
  `SHIFT01BREAK01FROM` double DEFAULT 0 COMMENT 'Pause 1 von',
  `SHIFT01BREAK01TO` double DEFAULT 0 COMMENT 'Pause 1 bis',
  `SHIFT01BREAK02FROM` double DEFAULT 0 COMMENT 'Pause 2 von',
  `SHIFT01BREAK02TO` double DEFAULT 0 COMMENT 'Pause 2 bis',
  `SHIFT01BREAK03FROM` double DEFAULT 0 COMMENT 'Pause 3 von',
  `SHIFT01BREAK03TO` double DEFAULT 0 COMMENT 'Pause 3 bis',
  `SHIFT01TOSTART` double DEFAULT 0 COMMENT 'Endezeit Schicht 1 von',
  `SHIFT01TOEND` double DEFAULT 0 COMMENT 'Enezeit Schicht 1 bis',
  `SHIFT02COMMENT` varchar(64) DEFAULT '',
  `SHIFT02FROMSTART` double DEFAULT 0,
  `SHIFT02FROMEND` double DEFAULT 0,
  `SHIFT02BREAK01FROM` double DEFAULT 0,
  `SHIFT02BREAK01TO` double DEFAULT 0,
  `SHIFT02BREAK02FROM` double DEFAULT 0,
  `SHIFT02BREAK02TO` double DEFAULT 0,
  `SHIFT02BREAK03FROM` double DEFAULT 0,
  `SHIFT02BREAK03TO` double DEFAULT 0,
  `SHIFT02TOSTART` double DEFAULT 0,
  `SHIFT02TOEND` double DEFAULT 0,
  `SHIFT03COMMENT` varchar(64) DEFAULT '',
  `SHIFT03FROMSTART` double DEFAULT 0,
  `SHIFT03FROMEND` double DEFAULT 0,
  `SHIFT03BREAK01FROM` double DEFAULT 0,
  `SHIFT03BREAK01TO` double DEFAULT 0,
  `SHIFT03BREAK02FROM` double DEFAULT 0,
  `SHIFT03BREAK02TO` double DEFAULT 0,
  `SHIFT03BREAK03FROM` double DEFAULT 0,
  `SHIFT03BREAK03TO` double DEFAULT 0,
  `SHIFT03TOSTART` double DEFAULT 0,
  `SHIFT03TOEND` double DEFAULT 0,
  `SHIFT04COMMENT` varchar(64) DEFAULT '',
  `SHIFT04FROMSTART` double DEFAULT 0,
  `SHIFT04FROMEND` double DEFAULT 0,
  `SHIFT04BREAK01FROM` double DEFAULT 0,
  `SHIFT04BREAK01TO` double DEFAULT 0,
  `SHIFT04BREAK02FROM` double DEFAULT 0,
  `SHIFT04BREAK02TO` double DEFAULT 0,
  `SHIFT04BREAK03FROM` double DEFAULT 0,
  `SHIFT04BREAK03TO` double DEFAULT 0,
  `SHIFT04TOSTART` double DEFAULT 0,
  `SHIFT04TOEND` double DEFAULT 0,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_stdpzeshift_SHIFTTIMENO` (`SHIFTTIMENO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Arbeitszeitmodelle';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdreports
DROP TABLE IF EXISTS `stdreports`;
CREATE TABLE IF NOT EXISTS `stdreports` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPANY` varchar(10) DEFAULT NULL COMMENT 'fuer welche Company',
  `LANQ` varchar(10) DEFAULT NULL COMMENT 'Sprache des Reports',
  `REPNAME` varchar(32) DEFAULT NULL COMMENT 'Name des Reports',
  `REPDEVFILENAME` varchar(255) DEFAULT NULL COMMENT 'Dateiname der Definitionsdatei',
  `REPOUTFILENAMEXML` varchar(255) DEFAULT NULL COMMENT 'Ausgabedatei des XML für den Report',
  `REPDEVSCRIPTNAME` varchar(255) DEFAULT NULL COMMENT 'CS-Scriptname um die Ausgabedatei zu erzeugen',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci AVG_ROW_LENGTH=1638;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdsalesorderinrules
DROP TABLE IF EXISTS `stdsalesorderinrules`;
CREATE TABLE IF NOT EXISTS `stdsalesorderinrules` (
  `TYPESOURCE` varchar(50) DEFAULT '',
  `TYPEDESTINATION` varchar(50) DEFAULT '',
  `ISALLOWED` bit(1) DEFAULT b'0',
  `RULE1` varchar(255) DEFAULT '',
  `RULE2` varchar(255) DEFAULT '',
  `RULE3` varchar(255) DEFAULT '',
  UNIQUE KEY `UK_stdsalesorderinrules` (`TYPESOURCE`,`TYPEDESTINATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdsearchform
DROP TABLE IF EXISTS `stdsearchform`;
CREATE TABLE IF NOT EXISTS `stdsearchform` (
  `SEANAME` varchar(50) NOT NULL,
  `SEADISPLAYNAME` varchar(50) DEFAULT NULL,
  `SEASQLSTATEMENT` varchar(1024) DEFAULT NULL,
  `SEAORDERBY` varchar(1024) DEFAULT NULL,
  `SEACOLUMNS` varchar(1024) DEFAULT NULL,
  `SEAKEYFIELD` varchar(1024) DEFAULT NULL,
  `SEAEVENTNAME` varchar(1024) DEFAULT NULL,
  `SEAABSOLUTEWHERE` varchar(1024) DEFAULT NULL,
  `SEACLEANINPUT` int(11) DEFAULT 0,
  `SEAONEITEM` int(11) DEFAULT 0,
  PRIMARY KEY (`SEANAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=910;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdstorage
DROP TABLE IF EXISTS `stdstorage`;
CREATE TABLE IF NOT EXISTS `stdstorage` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `STORAGE` int(11) DEFAULT 0 COMMENT 'Lagerort',
  `STORAGEPARENT` int(11) DEFAULT 0 COMMENT 'Lagerfach ',
  `DESCRIPTION` varchar(255) DEFAULT '' COMMENT 'Bezeichnung',
  `RESPONSIBLE` varchar(50) DEFAULT '' COMMENT 'Leiter Lager',
  `ISSTORAGE` bit(1) DEFAULT b'0',
  `TYPE` varchar(50) DEFAULT '' COMMENT 'Platzart',
  `GROUPS` varchar(10) DEFAULT '' COMMENT 'Lagergruppe',
  `PASSIV` bit(1) DEFAULT b'0' COMMENT 'Kz Passivlager',
  `YARDNUMBER` varchar(50) DEFAULT '',
  `YARDLENGTH` double DEFAULT 0 COMMENT 'Lagerplatz Länge',
  `YARDWIDTH` double DEFAULT 0 COMMENT 'Lagerplatz Breite',
  `YARDHIGH` double DEFAULT 0 COMMENT 'Lagerplatz Höhe',
  `YARDMAXWEIGHT` double DEFAULT 0,
  `PICKSORT` varchar(50) DEFAULT '',
  `PARTARTIKELNO` varchar(255) DEFAULT '',
  `PARTVARIANT` varchar(50) DEFAULT '',
  `PARTARTIKELQTY` double DEFAULT 0,
  `PARTARTIKELQTYUNIT` varchar(50) DEFAULT '',
  `CHARGE` varchar(255) DEFAULT '',
  `COSTCENTER` varchar(50) DEFAULT '' COMMENT 'Kostenstelle',
  `DELIVERYSTATION` varchar(50) DEFAULT '' COMMENT 'Anlieferbereich/Bahnhof',
  `BLOCKED` bit(1) DEFAULT b'0' COMMENT 'Sperr-Kennzeichen',
  `LOCATION` varchar(255) DEFAULT '',
  `CUSTOMC01` varchar(256) DEFAULT '',
  `CUSTOMC02` varchar(256) DEFAULT '',
  `CUSTOMC03` varchar(256) DEFAULT '',
  `CUSTOMC04` varchar(256) DEFAULT '',
  `CUSTOMC05` varchar(256) DEFAULT '',
  `CUSTOMN01` double DEFAULT 0,
  `CUSTOMN02` double DEFAULT 0,
  `CUSTOMN03` double DEFAULT 0,
  `CUSTOMN04` double DEFAULT 0,
  `CUSTOMN05` double DEFAULT 0,
  `CUSTOMB01` bit(1) DEFAULT b'0',
  `CUSTOMB02` bit(1) DEFAULT b'0',
  `CUSTOMB03` bit(1) DEFAULT b'0',
  `CUSTOMB04` bit(1) DEFAULT b'0',
  `CUSTOMB05` bit(1) DEFAULT b'0',
  `CUSTOMGROUP01` varchar(20) DEFAULT '',
  `CUSTOMGROUP02` varchar(20) DEFAULT '',
  `CUSTOMGROUP03` varchar(20) DEFAULT '',
  `CUSTOMGROUP04` varchar(20) DEFAULT '',
  `CUSTOMGROUP05` varchar(20) DEFAULT '',
  `LASTBOOKINGDATE` datetime DEFAULT NULL,
  `INVENTORYQUANTITY` double DEFAULT 0,
  `INVENTORYDATE` datetime DEFAULT NULL,
  `ISWITHYARD` int(11) DEFAULT 0 COMMENT 'Verwaltung Lager mit Lagerfächer (0 = nein, 1=ja)',
  `KOMMENTAR` varchar(255) DEFAULT '',
  `STORAGENODETYPE` varchar(10) DEFAULT '' COMMENT 'Systemintern: Dient als Kennzeichnung wenn ohne Fachverwaltung gearbeitet wird',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_stdstorage` (`STORAGE`,`STORAGEPARENT`),
  KEY `IDX_stdstorage2` (`STORAGEPARENT`,`STORAGE`),
  KEY `IDX_stdstorage_PARTARTIKELNO` (`PARTARTIKELNO`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='Lagerplatz Beschreibung';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdstoragemaster
DROP TABLE IF EXISTS `stdstoragemaster`;
CREATE TABLE IF NOT EXISTS `stdstoragemaster` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `STORAGE` varchar(50) DEFAULT NULL COMMENT 'Lagerort',
  `STORAGEYARD` varchar(50) DEFAULT NULL COMMENT 'Lagerfach ',
  `PARTARTIKELNO` varchar(128) DEFAULT NULL COMMENT 'Artikelnummer ',
  `PARTVARIANT` varchar(50) DEFAULT NULL COMMENT 'Variante',
  `CHARGE` varchar(50) DEFAULT NULL COMMENT 'Charge',
  `QUANTITY` double DEFAULT NULL COMMENT 'Lagermenge',
  `RESERVATIONQUANTITY` double DEFAULT NULL COMMENT 'reservierte Menge',
  `QUANTITYUNIT` varchar(20) DEFAULT NULL,
  `PASSIV` bit(1) DEFAULT NULL COMMENT 'Kz Passiv',
  `PASSIVCLASS` varchar(50) DEFAULT NULL COMMENT 'Klassifizierung Passiv ',
  `STOTAKEINGQUANTITY` double DEFAULT NULL,
  `STOTAKEINGDATE` datetime DEFAULT NULL,
  `CUSTMMC01` varchar(256) DEFAULT NULL,
  `CUSTMMC02` varchar(256) DEFAULT NULL,
  `CUSTMMC03` varchar(256) DEFAULT NULL,
  `CUSTMMC04` varchar(256) DEFAULT NULL,
  `CUSTMMC05` varchar(256) DEFAULT NULL,
  `CUSTMMN01` double DEFAULT NULL,
  `CUSTMMN02` double DEFAULT NULL,
  `CUSTMMN03` double DEFAULT NULL,
  `CUSTMMN04` double DEFAULT NULL,
  `CUSTMMN05` double DEFAULT NULL,
  `CUSTMMB01` bit(1) DEFAULT NULL,
  `CUSTMMB02` bit(1) DEFAULT NULL,
  `CUSTMMB03` bit(1) DEFAULT NULL,
  `CUSTMMB04` bit(1) DEFAULT NULL,
  `CUSTMMB05` bit(1) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_stdstoragemaster_PARTARTIKELNO` (`PARTARTIKELNO`),
  KEY `IDX_stdstoragemaster_STORAGE` (`STORAGE`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=546 COMMENT='Lagerstamm';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdtaxkeys
DROP TABLE IF EXISTS `stdtaxkeys`;
CREATE TABLE IF NOT EXISTS `stdtaxkeys` (
  `KEY` int(11) NOT NULL COMMENT 'Zusamenadierter Key aus GEPA und Artikel',
  `PERCENT` double DEFAULT NULL COMMENT 'Steuerprozent',
  `KEYGEPA` int(11) DEFAULT NULL,
  `KEYPART` int(11) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=4096;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdtxtpattern
DROP TABLE IF EXISTS `stdtxtpattern`;
CREATE TABLE IF NOT EXISTS `stdtxtpattern` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nummer vom Text',
  `TXTNUMBER` int(11) DEFAULT NULL,
  `PARTARTIKELNO` varchar(128) DEFAULT '',
  `VARIANT` varchar(128) DEFAULT '',
  `BUSINESSNO` varchar(20) DEFAULT '',
  `TXTLANQAGE` varchar(2) DEFAULT '' COMMENT 'Sprache vom Text',
  `TXTTYPE` varchar(20) DEFAULT '',
  `TXTRTFTEXT` longtext DEFAULT '' COMMENT 'Text als RTF formatiert',
  `TXTPLAINTEXT` varchar(8000) DEFAULT '' COMMENT 'Text Plain ',
  `TXTINTCOMMENT` varchar(255) DEFAULT '' COMMENT 'interner Kommentar',
  PRIMARY KEY (`TABLEID`),
  KEY `UK_stdtxtpattern` (`TXTNUMBER`,`TXTLANQAGE`)
) ENGINE=InnoDB AUTO_INCREMENT=6037 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=17694 COMMENT='text vorlagen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdtxtpattern_4jet
DROP TABLE IF EXISTS `stdtxtpattern_4jet`;
CREATE TABLE IF NOT EXISTS `stdtxtpattern_4jet` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Nummer vom Text',
  `TXTNUMBER` int(11) DEFAULT NULL,
  `PARTARTIKELNO` varchar(128) DEFAULT '',
  `VARIANT` varchar(128) DEFAULT '',
  `BUSINESSNO` varchar(20) DEFAULT '',
  `TXTLANQAGE` varchar(2) DEFAULT '' COMMENT 'Sprache vom Text',
  `TXTTYPE` varchar(20) DEFAULT '',
  `TXTRTFTEXT` longtext DEFAULT '' COMMENT 'Text als RTF formatiert',
  `TXTPLAINTEXT` varchar(8000) DEFAULT '' COMMENT 'Text Plain ',
  `TXTINTCOMMENT` varchar(255) DEFAULT '' COMMENT 'interner Kommentar',
  PRIMARY KEY (`TABLEID`),
  KEY `UK_stdtxtpattern` (`TXTNUMBER`,`TXTLANQAGE`)
) ENGINE=InnoDB AUTO_INCREMENT=6035 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='text vorlagen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdunit2unit
DROP TABLE IF EXISTS `stdunit2unit`;
CREATE TABLE IF NOT EXISTS `stdunit2unit` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `COUNTRY` varchar(5) DEFAULT NULL,
  `UNITFROM` varchar(20) DEFAULT NULL,
  `UNITTO` varchar(20) DEFAULT NULL,
  `UNITFACTOR` double DEFAULT NULL,
  `UNIT2INDESC` varchar(100) DEFAULT NULL,
  `FORMATSCRIPT01` varchar(100) DEFAULT NULL,
  `SQLPROC01` varchar(100) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  KEY `UNITFROM` (`UNITFROM`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=8192;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdunits
DROP TABLE IF EXISTS `stdunits`;
CREATE TABLE IF NOT EXISTS `stdunits` (
  `UNIT` varchar(20) NOT NULL,
  `UNITDESCRIPTION` varchar(50) DEFAULT NULL,
  `UNITMAPPING` varchar(50) DEFAULT NULL,
  `UNITPRECISION` int(11) DEFAULT NULL,
  `SORT` varchar(20) DEFAULT NULL,
  `UNITINTDESC` varchar(256) DEFAULT NULL,
  `LANQKEY` varchar(20) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`UNIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=1820;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdworkcostcentre
DROP TABLE IF EXISTS `stdworkcostcentre`;
CREATE TABLE IF NOT EXISTS `stdworkcostcentre` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `COSTCENTRE` varchar(64) DEFAULT '' COMMENT 'Kostenstelle',
  `COSTCENTRESUB` varchar(64) DEFAULT '' COMMENT 'Kostenstelle Sub',
  `DESCRIPTION` varchar(255) DEFAULT '' COMMENT 'Bezeichnung',
  `TYPE` varchar(10) DEFAULT '' COMMENT 'WRK = Arbeitsgang  , FRD = Fremdarbeitsgang',
  `QUANTITY` double DEFAULT 1 COMMENT 'Anzahl',
  `MULTIMEN` double DEFAULT 1 COMMENT 'Anzahl Menschen',
  `MULTIMACHINE` double DEFAULT 1 COMMENT 'Anzahl Maschinen',
  `PRICE1` double DEFAULT 0 COMMENT 'Kosten1 Mindestens',
  `PRICE2` double DEFAULT 0 COMMENT 'Kosten2 Wunsch',
  `PRICE3` double DEFAULT 0 COMMENT 'Kosten3 Angebot',
  `STDKEY` varchar(10) DEFAULT '0',
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_stdworkcostcentre_COSTCENTRE` (`COSTCENTRE`,`COSTCENTRESUB`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=4096 COMMENT='Kostenstellen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdworkpos
DROP TABLE IF EXISTS `stdworkpos`;
CREATE TABLE IF NOT EXISTS `stdworkpos` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `PARTARTIKELNO` varchar(50) DEFAULT NULL COMMENT 'Artikelnummer',
  `PARTVARIANT` varchar(50) DEFAULT NULL COMMENT 'Artikel-Variante',
  `POS` double DEFAULT NULL COMMENT 'Position',
  `POSSUB` double DEFAULT NULL COMMENT 'UnterPosition',
  `STDKEY` varchar(10) DEFAULT NULL COMMENT 'Key zur Standardposition',
  `POSTYP` varchar(10) DEFAULT NULL COMMENT 'WRK = Arbeitsgang , MAT = Material , FRD = Fremdarbeitsgang',
  `DESCRIPTION1` varchar(2000) DEFAULT NULL COMMENT 'Beschreibung1',
  `DESCRIPTION2` varchar(2000) DEFAULT NULL COMMENT 'Beschreibung2',
  `DESCRIPTION3` varchar(2000) DEFAULT NULL,
  `MULTIMEN` double DEFAULT NULL COMMENT 'MehrMenschBedienung',
  `MULTIMACHINE` double DEFAULT NULL COMMENT 'MehrMaschinenBedienung',
  `UNITTR` varchar(10) DEFAULT NULL COMMENT 'Rüstzeit Einheit (STD/MIN)',
  `UNITTE` varchar(10) DEFAULT NULL COMMENT 'Bearbeitungszeit Einheit (STD/MIN)',
  `COSTCENTRE` varchar(64) DEFAULT NULL COMMENT 'Kostenstelle / Lieferant',
  `COSTCENTRESUB` varchar(64) DEFAULT NULL COMMENT 'Kostenstelle / Lieferant Sub',
  `TIMETR` double DEFAULT NULL COMMENT 'Ruestzeit',
  `TIMETE` double DEFAULT NULL COMMENT 'Bearbeitungszeit',
  `RESPONSENOPIECES` int(11) DEFAULT 0 COMMENT 'Anzahl Rückgemeldeter Teile',
  `RESPONSETIME` double DEFAULT 0 COMMENT 'gleitender Durchschnitt gem Teile',
  `RESPONSELAST` datetime DEFAULT NULL COMMENT 'Letzte Rückmeldung',
  PRIMARY KEY (`TABLEID`),
  KEY `UK_stdworkpos` (`PARTARTIKELNO`,`POS`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=399 COMMENT='Part Work Positionen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.stdworkposstd
DROP TABLE IF EXISTS `stdworkposstd`;
CREATE TABLE IF NOT EXISTS `stdworkposstd` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `STDKEY` varchar(64) DEFAULT NULL,
  `TYP` varchar(10) DEFAULT NULL,
  `DESCRIPTION1` varchar(2000) DEFAULT NULL COMMENT 'WRK = Arbeitsgang  , FRD = Fremdarbeitsgang',
  `DESCRIPTION2` varchar(2000) DEFAULT NULL,
  `COMMENT` varchar(2000) DEFAULT NULL,
  `COSTCENTRE` varchar(64) DEFAULT NULL,
  `COSTCENTRESUB` varchar(64) DEFAULT NULL,
  `UNITTE` varchar(10) DEFAULT 'min',
  `UNITTR` varchar(10) DEFAULT 'min',
  `TIMETR` double DEFAULT 0,
  `TIMETE` double DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_stdworkposstd_STDKEY` (`STDKEY`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=4096;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytbtcfunction
DROP TABLE IF EXISTS `sytbtcfunction`;
CREATE TABLE IF NOT EXISTS `sytbtcfunction` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPANY` varchar(50) DEFAULT NULL,
  `FKTTYPE` varchar(20) DEFAULT NULL,
  `FTKNAME` varchar(50) DEFAULT NULL,
  `FKTSORT` int(11) DEFAULT NULL,
  `FKTDESCIPTIOM` varchar(256) DEFAULT NULL,
  `FKTSCRIPTNAME` varchar(128) DEFAULT NULL,
  `FKTASSEMBLY` varchar(50) DEFAULT NULL,
  `FKTCLASS` varchar(50) DEFAULT NULL,
  `FKTRUNTIME` int(11) DEFAULT NULL,
  `FKTISACTIVE` bit(1) DEFAULT NULL,
  `FKTLASTRUN` datetime DEFAULT NULL,
  `FKTCONNAME01` varchar(50) DEFAULT NULL,
  `FKTCONNAME02` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=3276;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytcaepos01
DROP TABLE IF EXISTS `sytcaepos01`;
CREATE TABLE IF NOT EXISTS `sytcaepos01` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `CAENAME` varchar(128) DEFAULT '',
  `CAECOMPANY` varchar(20) DEFAULT '',
  `POSITION` int(11) DEFAULT 0,
  `FIELDTYPE` varchar(10) DEFAULT '',
  `FIELDFORMAT` varchar(255) DEFAULT '',
  `FIELDNAME` varchar(128) DEFAULT '',
  `FIELDLABEL` varchar(255) DEFAULT '',
  `FIELDCOLUMN` int(11) DEFAULT 0,
  `FIELDROW` int(11) DEFAULT 0,
  `FIELDSOURCEDEF` varchar(10) DEFAULT '',
  `FIELDSOURCE` varchar(1024) DEFAULT '',
  `FIELDVALUE` varchar(1024) DEFAULT '',
  `FIELDFORMULA` varchar(1024) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sytcaepos01` (`CAECOMPANY`,`CAENAME`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='CalcEngine positionen';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytlicbase
DROP TABLE IF EXISTS `sytlicbase`;
CREATE TABLE IF NOT EXISTS `sytlicbase` (
  `TABLEID` int(10) NOT NULL AUTO_INCREMENT,
  `PROJECTNAME` varchar(50) DEFAULT NULL,
  `PROJECTCERT` text DEFAULT NULL,
  `MODULLICENCE` text DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci AVG_ROW_LENGTH=16384;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytlicusers
DROP TABLE IF EXISTS `sytlicusers`;
CREATE TABLE IF NOT EXISTS `sytlicusers` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `USERMODUL` varchar(128) DEFAULT NULL,
  `TIMEPOLL` datetime DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  KEY `UserModul` (`USERMODUL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytlog
DROP TABLE IF EXISTS `sytlog`;
CREATE TABLE IF NOT EXISTS `sytlog` (
  `LOGID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLICATION` varchar(50) DEFAULT NULL,
  `LOGGED` datetime DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `LEVEL` varchar(50) DEFAULT NULL,
  `MESSAGE` longtext DEFAULT NULL,
  `LOGGER` varchar(250) DEFAULT NULL,
  `CALLSITE` longtext DEFAULT NULL,
  `EXCEPTION` longtext DEFAULT NULL,
  PRIMARY KEY (`LOGID`)
) ENGINE=InnoDB AUTO_INCREMENT=5843 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=298;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytparameter
DROP TABLE IF EXISTS `sytparameter`;
CREATE TABLE IF NOT EXISTS `sytparameter` (
  `SYBEREICH` varchar(50) NOT NULL,
  `SYPARNUMMER` int(11) NOT NULL,
  `SYUSERNAME` varchar(50) NOT NULL,
  `SYVALUE` mediumtext DEFAULT NULL,
  `SYDESCRIPTION` text DEFAULT NULL,
  `SYEDITOR` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SYBEREICH`,`SYPARNUMMER`,`SYUSERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=11189;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytparametertemp
DROP TABLE IF EXISTS `sytparametertemp`;
CREATE TABLE IF NOT EXISTS `sytparametertemp` (
  `SYBEREICH` varchar(50) NOT NULL,
  `SYPARNUMMER` int(11) NOT NULL,
  `SYUSERNAME` varchar(50) NOT NULL,
  `SYASSEMBLEYNAME` varchar(50) DEFAULT NULL COMMENT 'executing assembley name',
  `SYVALUE` text DEFAULT NULL,
  `SYDESCRIPTION` varchar(256) DEFAULT NULL,
  `SYEDITOR` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`SYBEREICH`,`SYPARNUMMER`,`SYUSERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=862 COMMENT='Parameterdatei zu Steuerung User Json Daten';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytselects
DROP TABLE IF EXISTS `sytselects`;
CREATE TABLE IF NOT EXISTS `sytselects` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) DEFAULT NULL,
  `COMMENT` varchar(255) DEFAULT NULL,
  `STATEMENT` text DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_sytselects_NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci AVG_ROW_LENGTH=16384;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytsequence
DROP TABLE IF EXISTS `sytsequence`;
CREATE TABLE IF NOT EXISTS `sytsequence` (
  `SQBEREICH` varchar(15) NOT NULL,
  `SQART` varchar(15) NOT NULL,
  `SQSEQUENCE` int(11) DEFAULT 1,
  `SQPREFIX` varchar(11) DEFAULT '',
  `SQBEMERKUNG` varchar(2000) DEFAULT '',
  `SQNUMBERDIGITS` int(11) DEFAULT 0,
  PRIMARY KEY (`SQBEREICH`,`SQART`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=780;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.syttransferdef
DROP TABLE IF EXISTS `syttransferdef`;
CREATE TABLE IF NOT EXISTS `syttransferdef` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(63) DEFAULT NULL COMMENT 'Name der Regel',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT 'Beschreibung der Regel',
  `TYPE` varchar(63) DEFAULT NULL COMMENT 'Typ (Import, Export)',
  `ISACTIVE` bit(1) DEFAULT NULL COMMENT 'REgel aktiv (Y/N)',
  `ONERROR` varchar(63) DEFAULT NULL COMMENT 'Was passiert bei Error? WARNING, CANCEL',
  `COMMENT` text DEFAULT NULL COMMENT 'Ausführliche Beschreibung der Regel',
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=4096;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytuimenuitems
DROP TABLE IF EXISTS `sytuimenuitems`;
CREATE TABLE IF NOT EXISTS `sytuimenuitems` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `NAMEITEM` varchar(50) NOT NULL DEFAULT '' COMMENT 'interner Name',
  `TYPE` varchar(128) DEFAULT '' COMMENT 'RIBBON PAGE GROUP ITEM',
  `IMAGENAME` varchar(128) DEFAULT '' COMMENT 'Name des Images',
  `CONTROLTOCALL` varchar(128) DEFAULT '' COMMENT 'Aufruf aus Assembley',
  `ASSEMBLYNAME` varchar(128) DEFAULT '' COMMENT 'Name der Assemby des Controlls (wenn leer wird gesucht)',
  `MYCOMMENT` varchar(255) DEFAULT '' COMMENT 'interner Kommentar',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sytuimenuitems_NAME` (`NAMEITEM`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytuimenustructure
DROP TABLE IF EXISTS `sytuimenustructure`;
CREATE TABLE IF NOT EXISTS `sytuimenustructure` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `NAMEMENUE` varchar(20) DEFAULT NULL COMMENT 'Name des Menus DEFAULT oder aus Parameter',
  `NAMECONTROL` varchar(50) DEFAULT '' COMMENT 'interner Name des Controls',
  `PARENTCONTROL` varchar(50) DEFAULT '' COMMENT 'interner Name des Mutter Controls',
  `NAMEFRIENDLY` varchar(50) DEFAULT '' COMMENT 'Aufruf Name',
  `TYPEOFCONTROL` varchar(10) DEFAULT '' COMMENT 'RIBBON PAGE GROUP BTNITEM',
  `SORT` int(11) DEFAULT 0 COMMENT 'Sortierung innerhalb der Gruppe',
  `NAMEITEM` varchar(50) DEFAULT '' COMMENT 'Name des zugeh. Button Items',
  `TEXTITEM` varchar(128) DEFAULT '' COMMENT 'Überschrift (caption), wenn leer dann NAMECONTROL',
  `DOCKSTYLELAYOUT` varchar(128) DEFAULT '' COMMENT 'PANEL TABBED',
  `DOCKSTYLESIDE` varchar(128) DEFAULT '' COMMENT 'LEFT REIGHT ..',
  `TAGTOUSERCONTROL` varchar(128) DEFAULT '' COMMENT 'Tag der weitergegeben wird',
  `MYCOMMENT` varchar(255) DEFAULT '' COMMENT 'interner Kommentar',
  `ISNOTACTIVE` bit(1) DEFAULT b'0',
  `USERGROUPS` varchar(4000) DEFAULT '' COMMENT 'Berechtigung für Benutergruppe, wenn leer dann alle',
  `USERS` varchar(4000) DEFAULT '' COMMENT 'Berechtigung für Benuter, wenn leer dann alle',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  `DEVXITEM` int(11) DEFAULT 0,
  `DEVXPARENT` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_sytuimenustructure_NAMEMENUE` (`NAMEMENUE`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytuiwkctltranslate
DROP TABLE IF EXISTS `sytuiwkctltranslate`;
CREATE TABLE IF NOT EXISTS `sytuiwkctltranslate` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTROLNAMEMAIN` varchar(50) DEFAULT NULL,
  `CONTROLNAMEFORM` varchar(100) DEFAULT NULL,
  `CONTROLPATHINFORM` varchar(256) DEFAULT NULL,
  `TRANSCAPTIONORIGIN` varchar(128) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  UNIQUE KEY `UK_sytuiwkctltranslate_CONTROLPATHINFORM` (`CONTROLPATHINFORM`),
  KEY `IDX_sytuiwkctltranslate_CONTROLNAMEMAIN` (`CONTROLNAMEMAIN`)
) ENGINE=InnoDB AUTO_INCREMENT=38480 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=291;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytuiwksdefinition
DROP TABLE IF EXISTS `sytuiwksdefinition`;
CREATE TABLE IF NOT EXISTS `sytuiwksdefinition` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTROLLNAMEMAIN` varchar(100) DEFAULT NULL,
  `CONTROLLNAMEFORM` varchar(255) DEFAULT NULL,
  `COMPANY` varchar(10) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `USERLANQ` varchar(5) DEFAULT NULL,
  `WORKSPACEUSERSTD` bit(1) DEFAULT b'0' COMMENT 'Ist Standard des Users',
  `WORKSPACEDATA` longtext DEFAULT NULL,
  `WORKSPACENAME` varchar(50) DEFAULT '',
  `DEFINITIONS` longtext DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT NULL,
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(20) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(20) DEFAULT NULL,
  `ESROWVERSION` int(11) DEFAULT 0,
  PRIMARY KEY (`TABLEID`),
  KEY `IDX_SYTWKSDEF` (`CONTROLLNAMEMAIN`,`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=595580;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytuiwkstranslate
DROP TABLE IF EXISTS `sytuiwkstranslate`;
CREATE TABLE IF NOT EXISTS `sytuiwkstranslate` (
  `COMPANY` varchar(10) NOT NULL DEFAULT '',
  `LANQ` varchar(20) NOT NULL DEFAULT '',
  `TRANSTYPE` varchar(20) NOT NULL DEFAULT '',
  `TRANSCAPTIONORIGIN` varchar(128) NOT NULL DEFAULT '',
  `TRANSCAPTIONTRANSLATE` varchar(256) DEFAULT NULL,
  `TRANSTOOLTIP` varchar(4000) DEFAULT NULL,
  `TRANSDESCR` varchar(256) DEFAULT NULL,
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TRANSCAPTIONORIGIN`,`LANQ`,`TRANSTYPE`,`COMPANY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=89;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytuiwkstranslatemsg
DROP TABLE IF EXISTS `sytuiwkstranslatemsg`;
CREATE TABLE IF NOT EXISTS `sytuiwkstranslatemsg` (
  `MSGKEY` int(11) NOT NULL DEFAULT 0,
  `COMPANY` varchar(10) NOT NULL DEFAULT '',
  `LANQ` varchar(20) NOT NULL DEFAULT '',
  `TRANSTYPE` varchar(20) NOT NULL DEFAULT '',
  `TRANSCAPTIONHEADER` varchar(256) NOT NULL DEFAULT '',
  `TRANSCAPTIONMSG` varchar(256) DEFAULT NULL,
  `TRANSTOOLTIP` varchar(4000) DEFAULT NULL,
  `TRANSDESCR` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`MSGKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytusers
DROP TABLE IF EXISTS `sytusers`;
CREATE TABLE IF NOT EXISTS `sytusers` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `USERLOGIN` varchar(50) DEFAULT NULL,
  `USERPWD` varchar(50) DEFAULT NULL,
  `ISADMIN` bit(1) DEFAULT b'0',
  `USERDOMAIN` varchar(50) DEFAULT NULL,
  `USERNAME` varchar(256) DEFAULT NULL,
  `USERPHONE` varchar(256) DEFAULT NULL,
  `USERFAX` varchar(256) DEFAULT NULL,
  `USERMAIL` varchar(256) DEFAULT NULL,
  `USERSHORT` varchar(15) DEFAULT NULL,
  `USERLANQUAGE` varchar(2) DEFAULT NULL,
  `USRLOCATION` varchar(255) DEFAULT NULL,
  `USEREXT01` varchar(50) DEFAULT NULL,
  `USEREXT02` varchar(50) DEFAULT NULL,
  `USERGROUP` varchar(20) DEFAULT NULL,
  `USERMOBILE` varchar(50) DEFAULT NULL,
  `USERORDERSOUT` bit(1) DEFAULT NULL COMMENT 'User für Einkauf (Stichwort:Zahlungsbed.)',
  `USERORDERSIN` bit(1) DEFAULT NULL COMMENT 'User für Verkauf (Stichwort:Zahlungsbed.)',
  `COMMENT` varchar(512) DEFAULT NULL,
  `USRISONLINE` bit(1) DEFAULT b'0',
  `USRLASTUPDATE` datetime DEFAULT NULL COMMENT 'Name des Menues für den User, leer = DEFAULT',
  `USRMENUENAME` varchar(50) DEFAULT '',
  PRIMARY KEY (`TABLEID`),
  KEY `IX_SYTUSERS` (`USERLOGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=1820;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytworkflow
DROP TABLE IF EXISTS `sytworkflow`;
CREATE TABLE IF NOT EXISTS `sytworkflow` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `WFNUMBER` int(11) DEFAULT 0 COMMENT 'Nummer aus def',
  `WFDESCRIPTION` varchar(255) DEFAULT '' COMMENT 'Beschreibung Message',
  `WFTEXT` varchar(1024) DEFAULT '' COMMENT 'Text',
  `WFUSERS` varchar(256) DEFAULT '' COMMENT 'Ziel Benutzer',
  `WFGROUPS` varchar(256) DEFAULT '' COMMENT 'Ziel Benutzergruppe',
  `WFREFERENCE` varchar(50) DEFAULT '' COMMENT 'Workflow Referenz',
  `WFCATEGORY` varchar(50) DEFAULT '' COMMENT 'Workflow Kategorie',
  `WFCALLBACK` varchar(50) DEFAULT '' COMMENT 'Workflow Programm-Aufruf',
  `WFCALLBACKKEY` varchar(50) DEFAULT '' COMMENT 'Workflow Key für Programm-Aufruf',
  `WFCALLBACKDATE` datetime DEFAULT NULL COMMENT 'Datum zu erledigen',
  `WFSTATUS` varchar(10) DEFAULT '' COMMENT 'Workflow Status',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytworkflowdef
DROP TABLE IF EXISTS `sytworkflowdef`;
CREATE TABLE IF NOT EXISTS `sytworkflowdef` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `WFNUMBER` int(11) DEFAULT 0 COMMENT 'eindeutige Nummer (über Sequenze)',
  `WFDESCRIPTION` varchar(255) DEFAULT '' COMMENT 'Beschreibung',
  `WFTABLE` varchar(64) DEFAULT '' COMMENT 'trigger auf Tabelle',
  `WFFIELDS` varchar(64) DEFAULT '' COMMENT 'tabellenfelder',
  `WFMODE` varchar(16) DEFAULT '' COMMENT 'Modus (insert update delete)',
  `WFMODE2` varchar(16) DEFAULT '' COMMENT 'before after',
  `WFTEMPLATENAME` varchar(64) DEFAULT '' COMMENT 'Name des benutzten Templates',
  `WFTEMPLATE` varchar(1024) DEFAULT '' COMMENT 'create statement',
  `WFTEXTTARGET` varchar(1024) DEFAULT '' COMMENT 'Text in WF-Tabelle',
  `WFUSERS` varchar(256) DEFAULT '' COMMENT 'Ziel Benutzer',
  `WFGROUPS` varchar(256) DEFAULT '' COMMENT 'Ziel Benutzergruppe',
  `WFMESSAGE` varchar(256) DEFAULT '',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT '',
  `ESUSRMODIFYED` varchar(64) DEFAULT '',
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.sytworkflowtemplate
DROP TABLE IF EXISTS `sytworkflowtemplate`;
CREATE TABLE IF NOT EXISTS `sytworkflowtemplate` (
  `TABLEID` int(11) NOT NULL AUTO_INCREMENT,
  `WFTNAME` varchar(128) DEFAULT '' COMMENT 'eindeutige Nummer (über Sequenze)',
  `WFTDESCRIPTION` varchar(255) DEFAULT '' COMMENT 'Beschreibung',
  `WFTTEXT` varchar(1024) DEFAULT '' COMMENT 'Message für Workflow',
  `WFTMODE` varchar(16) DEFAULT '' COMMENT 'Modus (insert update delete)',
  `WFTMODE2` varchar(16) DEFAULT '' COMMENT 'before after',
  `WFTEMPLATE` text DEFAULT '' COMMENT 'create statement',
  `ESDATEADDED` datetime DEFAULT current_timestamp(),
  `ESDATEMODIFYED` datetime DEFAULT NULL,
  `ESUSRADDED` varchar(64) DEFAULT NULL,
  `ESUSRMODIFYED` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci COMMENT='hinterlegte templates für trigger';

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von Tabelle sso_dev.tally
DROP TABLE IF EXISTS `tally`;
CREATE TABLE IF NOT EXISTS `tally` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iddouble` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci AVG_ROW_LENGTH=36;

-- Daten-Export vom Benutzer nicht ausgewählt

-- Exportiere Struktur von View sso_dev.viewdisposearch
DROP VIEW IF EXISTS `viewdisposearch`;
-- Erstelle temporäre Tabelle, um View-Abhängigkeiten zuvorzukommen
CREATE TABLE `viewdisposearch` (
	`DISPROJECTNO` VARCHAR(50) NULL COMMENT 'Projektnummer' COLLATE 'utf8mb3_uca1400_ai_ci',
	`PROJECTNAME` VARCHAR(128) NULL COMMENT 'Projektname' COLLATE 'utf8mb3_uca1400_ai_ci',
	`DISVENDOR` VARCHAR(256) NULL COMMENT 'Firma' COLLATE 'utf8mb3_uca1400_ai_ci',
	`BUSCONTACTNAME` VARCHAR(256) NULL COMMENT 'Kontakt-Name' COLLATE 'utf8mb3_uca1400_ai_ci',
	`DISFOREIGNREF01` VARCHAR(50) NULL COMMENT 'Anfrage Ref' COLLATE 'utf8mb3_uca1400_ai_ci',
	`DISFOREIGNREF02` VARCHAR(50) NULL COMMENT 'Bestnr Ref' COLLATE 'utf8mb3_uca1400_ai_ci',
	`DISFOREIGNREF03` VARCHAR(50) NULL COMMENT 'Bestät Ref' COLLATE 'utf8mb3_uca1400_ai_ci',
	`DISFOREIGNREF04` VARCHAR(50) NULL COMMENT 'Lieferschein Ref' COLLATE 'utf8mb3_uca1400_ai_ci',
	`DISORDERNO` VARCHAR(10) NULL COMMENT 'Disponummer' COLLATE 'utf8mb3_uca1400_ai_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View sso_dev.viewpuoposstat01
DROP VIEW IF EXISTS `viewpuoposstat01`;
-- Erstelle temporäre Tabelle, um View-Abhängigkeiten zuvorzukommen
CREATE TABLE `viewpuoposstat01` (
	`ORDERNO` VARCHAR(50) NULL COMMENT 'Bestell-Nummer' COLLATE 'utf8mb3_uca1400_ai_ci',
	`COMMISSION` VARCHAR(50) NULL COMMENT 'Projekt / Referenz' COLLATE 'utf8mb3_uca1400_ai_ci',
	`BUSINESSNO` VARCHAR(50) NULL COMMENT 'Lieferanten-Nummer' COLLATE 'utf8mb3_uca1400_ai_ci',
	`BUSCOMPANY` VARCHAR(256) NULL COMMENT 'Lieferant Bezeichnung' COLLATE 'utf8mb3_uca1400_ai_ci',
	`BUSADDRESS1` VARCHAR(256) NULL COMMENT 'Adresse 1' COLLATE 'utf8mb3_uca1400_ai_ci',
	`SALESPRICE` DOUBLE NULL COMMENT 'Preis Hauswährung',
	`QUANTITY` DOUBLE NULL COMMENT 'Bestell-Menge',
	`SDLOOKINTERN` VARCHAR(50) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`REQUESTEDDELIVERYDAY` DATETIME NULL COMMENT 'Liefertermin gewünscht',
	`CAYEAR` INT(11) NULL,
	`CAWEEK` VARCHAR(14) NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`CAQUARTER` VARCHAR(14) NULL COLLATE 'utf8mb4_uca1400_ai_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View sso_dev.viewsalesorderstat01
DROP VIEW IF EXISTS `viewsalesorderstat01`;
-- Erstelle temporäre Tabelle, um View-Abhängigkeiten zuvorzukommen
CREATE TABLE `viewsalesorderstat01` (
	`ORDERNO` VARCHAR(50) NULL COMMENT 'Auftragsnummer' COLLATE 'utf8mb3_uca1400_ai_ci',
	`COMMISSION` VARCHAR(255) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`BUSINESSNO` VARCHAR(50) NULL COMMENT 'Kunden-Nummer' COLLATE 'utf8mb3_uca1400_ai_ci',
	`BUSCOMPANY` VARCHAR(256) NULL COMMENT 'Kurz-Bezeichnung' COLLATE 'utf8mb3_uca1400_ai_ci',
	`BUSADDRESS1` VARCHAR(256) NULL COMMENT 'Firma' COLLATE 'utf8mb3_uca1400_ai_ci',
	`SALESPRICE` DOUBLE NULL COMMENT 'Verkaufspreis Hauswährung',
	`QUANTITY` DOUBLE NULL COMMENT 'Bestell-Menge',
	`SDLOOKINTERN` VARCHAR(50) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`REQUESTEDDELIVERYDAY` DATETIME NULL COMMENT 'gewünschter Liefertermin',
	`CAYEAR` INT(11) NULL,
	`CAWEEK` VARCHAR(14) NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`CAQUARTER` VARCHAR(14) NULL COLLATE 'utf8mb4_uca1400_ai_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von View sso_dev.viewstockstat01
DROP VIEW IF EXISTS `viewstockstat01`;
-- Erstelle temporäre Tabelle, um View-Abhängigkeiten zuvorzukommen
CREATE TABLE `viewstockstat01` (
	`Fach` VARCHAR(255) NULL COMMENT 'Bezeichnung' COLLATE 'utf8mb3_uca1400_ai_ci',
	`Verantwortlich` VARCHAR(50) NULL COMMENT 'Leiter Lager' COLLATE 'utf8mb3_uca1400_ai_ci',
	`Standort` VARCHAR(255) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`Artikelnummer` VARCHAR(255) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`Menge` DOUBLE NULL,
	`Einzelpreis` DOUBLE NULL COMMENT 'frei (Für Preis vorgesehen)',
	`Preis` DOUBLE NULL
) ENGINE=MyISAM;

-- Exportiere Struktur von View sso_dev.viewvariantsearchkcw
DROP VIEW IF EXISTS `viewvariantsearchkcw`;
-- Erstelle temporäre Tabelle, um View-Abhängigkeiten zuvorzukommen
CREATE TABLE `viewvariantsearchkcw` (
	`PARTSARTIKELNO` VARCHAR(128) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`BLaenge` VARCHAR(20) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`Laenge` VARCHAR(50) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`BFarbe` VARCHAR(20) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`Farbe` VARCHAR(50) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`B_AD` VARCHAR(20) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`AD` VARCHAR(50) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`B_ID` VARCHAR(20) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`ID` VARCHAR(50) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`BWandstaerke` VARCHAR(20) NULL COLLATE 'utf8mb3_uca1400_ai_ci',
	`Wandstaerke` VARCHAR(50) NULL COLLATE 'utf8mb3_uca1400_ai_ci'
) ENGINE=MyISAM;

-- Exportiere Struktur von Prozedur sso_dev.sprocBatchFileGet
DROP PROCEDURE IF EXISTS `sprocBatchFileGet`;
DELIMITER //
CREATE PROCEDURE `sprocBatchFileGet`(IN $HOSTNAME varchar(32), OUT $BATCHID int)
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  
  
  
  


  START TRANSACTION;
    
    UPDATE hlpdocstructure
    SET HOSTNAME = $HOSTNAME
    WHERE HOSTNAME IS NULL
    AND MIGRATESTATUS = 0
    ORDER BY TABLEID ASC LIMIT 1;
  COMMIT;

  
  SELECT
    TABLEID INTO $BATCHID
  FROM hlpdocstructure
  WHERE hostname = $HOSTNAME
  AND MIGRATESTATUS = 0 LIMIT 1;


END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocbomprojectdeletemissings
DROP PROCEDURE IF EXISTS `sprocbomprojectdeletemissings`;
DELIMITER //
CREATE PROCEDURE `sprocbomprojectdeletemissings`(IN $PROJECTNUMBER varchar(50))
BEGIN

  DELETE FROM sstbomproject
  WHERE sstbomproject.BOMPOSSTATUS = 'MISSING'
  AND sstbomproject.BOMPROJECT = $PROJECTNUMBER;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocbomprojectstatusupdate
DROP PROCEDURE IF EXISTS `sprocbomprojectstatusupdate`;
DELIMITER //
CREATE PROCEDURE `sprocbomprojectstatusupdate`(IN $PROJECTNUMBER varchar(50), IN $PARTNUMBER varchar(255))
BEGIN

  UPDATE sstbomproject
  JOIN (WITH RECURSIVE bom_cte (
          BOMTABLEID,
          BOMPOSID
        )
      AS
      (SELECT
            sstbomproject.BOMTABLEID,
            sstbomproject.BOMPOSID
          FROM sstbomproject
          WHERE sstbomproject.BOMHEADERNO = $PARTNUMBER
          AND sstbomproject.BOMPROJECT = $PROJECTNUMBER
        UNION ALL
        SELECT
          bom.BOMTABLEID,
          bom.BOMPOSID
        FROM sstbomproject AS bom,
             bom_cte AS cte
        WHERE cte.BOMPOSID = bom.BOMHEADERID
        AND bom.BOMPROJECT = $PROJECTNUMBER)

    SELECT
      *
    FROM bom_cte) AS bomcte
    ON bomcte.BOMTABLEID = sstbomproject.BOMTABLEID

  SET sstbomproject.BOMPOSSTATUS = 'MISSING';

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocCalenderFill
DROP PROCEDURE IF EXISTS `sprocCalenderFill`;
DELIMITER //
CREATE PROCEDURE `sprocCalenderFill`(IN $Startdate date, IN $Stopdate date)
BEGIN

















  DECLARE currentdate date;
  DECLARE capacity int;
  DECLARE holyday varchar(255);
  

  SET currentdate = $Startdate;
 

  WHILE currentdate <= $Stopdate DO

    SET capacity = 0;
    SET holyday = '';

    CASE DAYOFWEEK(currentdate)
      WHEN 7 THEN SET capacity = 0;
      WHEN 1 THEN SET capacity = 0;
      ELSE SET capacity = 100;
    END CASE;

    CASE
      WHEN DAY(currentdate) = 1 AND
        MONTH(currentdate) = 1 THEN SET capacity = 0;
          SET holyday = 'Neujahr';
      WHEN DAY(currentdate) = 31 AND
        MONTH(currentdate) = 12 THEN SET capacity = 50;
          SET holyday = 'Silvester';
      WHEN DAY(currentdate) = 1 AND
        MONTH(currentdate) = 5 THEN SET capacity = 0;
          SET holyday = '1. Mai';  
      WHEN DAY(currentdate) = 3 AND
        MONTH(currentdate) = 10 THEN SET capacity = 0;
          SET holyday = 'Tag der dt Einheit';
      WHEN DAY(currentdate) = 24 AND
        MONTH(currentdate) = 12 THEN SET capacity = 50;
          SET holyday = 'Hl. Abend';
      WHEN DAY(currentdate) = 25 AND
        MONTH(currentdate) = 12 THEN SET capacity = 0;
          SET holyday = '1.Weihnachtstag';
      WHEN DAY(currentdate) = 26 AND
        MONTH(currentdate) = 12 THEN SET capacity = 0;
          SET holyday = '2.Weihnachtstag';
      WHEN DAY(fcEasterSunday(YEAR(currentdate))) = CAST(DAY(currentdate) AS UNSIGNED) AND
        MONTH(fcEasterSunday(YEAR(currentdate))) = CAST(MONTH(currentdate) AS UNSIGNED) THEN SET capacity = 0;
          SET holyday = 'Oster Sonntag';
      WHEN DAY(fcEasterSunday(YEAR(currentdate))) = CAST(DAY(SUBDATE(currentdate, INTERVAL 1 DAY)) AS UNSIGNED) AND
        MONTH(fcEasterSunday(YEAR(currentdate))) = CAST(MONTH(SUBDATE(currentdate, INTERVAL 1 DAY)) AS UNSIGNED) THEN SET capacity = 0;
          SET holyday = 'Oster Montag';
      WHEN DAY(fcEasterSunday(YEAR(currentdate))) = CAST(DAY(ADDDATE(currentdate, INTERVAL 2 DAY)) AS UNSIGNED) AND
        MONTH(fcEasterSunday(YEAR(currentdate))) = CAST(MONTH(ADDDATE(currentdate, INTERVAL 2 DAY)) AS UNSIGNED) THEN SET capacity = 0;
          SET holyday = 'Karfreitag';
      WHEN DAY(fcEasterSunday(YEAR(currentdate))) = CAST(DAY(ADDDATE(currentdate, INTERVAL 3 DAY)) AS UNSIGNED) AND
        MONTH(fcEasterSunday(YEAR(currentdate))) = CAST(MONTH(ADDDATE(currentdate, INTERVAL 3 DAY)) AS UNSIGNED) THEN SET capacity = 0;
          SET holyday = 'Gründonnerstag';
      WHEN DAY(fcEasterSunday(YEAR(currentdate))) = CAST(DAY(SUBDATE(currentdate, INTERVAL 39 DAY)) AS UNSIGNED) AND
        MONTH(fcEasterSunday(YEAR(currentdate))) = CAST(MONTH(SUBDATE(currentdate, INTERVAL 39 DAY)) AS UNSIGNED) THEN SET capacity = 100;
          SET holyday = 'Christi Himmelfahrt';
      WHEN DAY(fcEasterSunday(YEAR(currentdate))) = CAST(DAY(SUBDATE(currentdate, INTERVAL 49 DAY)) AS UNSIGNED) AND
        MONTH(fcEasterSunday(YEAR(currentdate))) = CAST(MONTH(SUBDATE(currentdate, INTERVAL 49 DAY)) AS UNSIGNED) THEN SET capacity = 0;
          SET holyday = 'Pfingstsonntag';
      WHEN DAY(fcEasterSunday(YEAR(currentdate))) = CAST(DAY(SUBDATE(currentdate, INTERVAL 50 DAY)) AS UNSIGNED) AND
        MONTH(fcEasterSunday(YEAR(currentdate))) = CAST(MONTH(SUBDATE(currentdate, INTERVAL 50 DAY)) AS UNSIGNED) THEN SET capacity = 0;
          SET holyday = 'Pfingstmontag';
      ELSE BEGIN
      END;
    END CASE;


    INSERT INTO stdcalender 
    (
    CAIDDATE
    , CAFULLDATE
    , CAYEAR
    , CAMONTH
    , CADAY
    , CAQUATER
    , CAWEEK
    , CADAYOFWEEK
    , CAWEEKENDFLAG
    , CADAYNAME
    , CAMONTHNAME
    , CACOMMENT
    , CAWORKPERCENT
    )
      VALUES
      (
      YEAR(currentdate) * 10000 + MONTH(currentdate) * 100 + DAY(currentdate),
      currentdate,
      YEAR(currentdate), 
      MONTH(currentdate),
      DAY(currentdate),
      QUARTER(currentdate),
      WEEKOFYEAR(currentdate),
      DAYOFWEEK(currentdate),
      CASE DAYOFWEEK(currentdate) 
      WHEN 7 THEN 1 
      WHEN 1 THEN 1 
      ELSE 0 END, 
      DATE_FORMAT(currentdate, '%W', 'de_DE'),
      DATE_FORMAT(currentdate, '%M', 'de_DE'),
      
      holyday,
      
      capacity
      );
    SET currentdate = ADDDATE(currentdate, INTERVAL 1 DAY);
  END WHILE;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocCheckProjectUsage
DROP PROCEDURE IF EXISTS `sprocCheckProjectUsage`;
DELIMITER //
CREATE PROCEDURE `sprocCheckProjectUsage`(IN $PROJECTNR VARCHAR(128), OUT $ERRORMESSAGES TEXT)
    DETERMINISTIC
BEGIN

  
  
  
  
  
  
  
  
  
  

  DECLARE $COUNTER int;
  

  
  SELECT
    $COUNTER = COUNT(*)
  FROM sstpuopos s
  WHERE s.COMMISSION = $PROJECTNR LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Bestellungen');
  END IF;
  SET $COUNTER = 0;

  

  SELECT
    $COUNTER = COUNT(*)
  FROM sstbomproject s
  WHERE s.BOMPROJECT = $PROJECTNR LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Projektstückliste');
  END IF;
  SET $COUNTER = 0;

  

  SELECT
    $COUNTER = COUNT(*)
  FROM sstdispartproof s
  WHERE s.DISPROJECTNO = $PROJECTNR LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Disposition');
  END IF;
  SET $COUNTER = 0;

  

  SELECT
    $COUNTER = COUNT(*)
  FROM stdbom s
  WHERE s.BOMHEADERNO = $PROJECTNR LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Stammstückliste');
  END IF;
  SET $COUNTER = 0;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocgetsstbomproject
DROP PROCEDURE IF EXISTS `sprocgetsstbomproject`;
DELIMITER //
CREATE PROCEDURE `sprocgetsstbomproject`(IN `$PROJECTNUMBER` VARCHAR(50)
)
BEGIN

DECLARE $PARTNUMBER varchar(128);

SELECT s.PROJECTPARTNO INTO $PARTNUMBER  from sstprojects s where s.PROJECTNR = $PROJECTNUMBER LIMIT 1;

WITH RECURSIVE bom_cte (
BOMHEADERID
,BOMPOSID
,BOMTABLEID
,XBRUTTOQT
,XPATH
,XPOS
,XPATHPART
,XLEVEL
) AS
(
  SELECT
    sstbomproject.BOMHEADERID
	,sstbomproject.BOMPOSID
	,sstbomproject.BOMTABLEID
   ,CAST(sstbomproject.BOMQUANTITY AS DOUBLE)
   ,CAST(LPAD(sstbomproject.BOMPOS ,4,'0') AS CHAR(100))
   ,CAST(sstbomproject.BOMPOS AS CHAR(100))
   ,CAST(CONCAT(sstbomproject.BOMHEADERNO,'þ',sstbomproject.BOMPOSNO) AS CHAR(2048))
   ,1 AS xlevel
  FROM sstbomproject WHERE sstbomproject.BOMHEADERNO = $PARTNUMBER AND sstbomproject.BOMPROJECT = $PROJECTNUMBER
    UNION ALL
  SELECT 
       bom.BOMHEADERID
   	,bom.BOMPOSID
   	,bom.BOMTABLEID
   	,cte.xbruttoqt * bom.BOMQUANTITY
  	   ,CONCAT(cte.xpath,'.',LPAD(bom.BOMPOS,4,'0'))
  	   ,CONCAT(cte.xpos,'.',bom.BOMPOS)
  	   ,CONCAT(cte.xpathpart,'þ',bom.BOMPOSNO)
   	,cte.xlevel + 1
      FROM sstbomproject AS bom, bom_cte AS cte WHERE cte.BOMPOSID = bom.BOMHEADERID AND bom.BOMPROJECT = $PROJECTNUMBER
)
SELECT
 cte.XBRUTTOQT
,cte.XPATH
,cte.XPOS
,cte.XPATHPART
,cte.XLEVEL
,bo.*




,SUM(cte.xbruttoqt) OVER (PARTITION BY cte.BOMPOSID) AS XTOTALPERPART
,0 as Devxcounter
,0 as Devxparentid


FROM bom_cte cte 
INNER JOIN sstbomproject bo ON cte.BOMTABLEID = bo.BOMTABLEID




ORDER BY cte.xpath;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocHLPNEWENTITY
DROP PROCEDURE IF EXISTS `sprocHLPNEWENTITY`;
DELIMITER //
CREATE PROCEDURE `sprocHLPNEWENTITY`(IN iTABLENAME VARCHAR(50))
    COMMENT 'erstellt neue Entity fuer Tiraggo'
BEGIN

DECLARE firstOne text;
DECLARE midleOne text;
DECLARE lastOne text;
SET GLOBAL group_concat_max_len = 5000;

SELECT GROUP_CONCAT(
CONCAT
(
IF(c.COLUMN_COMMENT = '','',
CONCAT(
'   // = ' 
,c.COLUMN_COMMENT
,'\r\n'
))

,'// '
,lower(c.TABLE_NAME)
,'.'
,fcHLPCHANGETOPASCALCASE(c.COLUMN_NAME)
,' = "";'
)
SEPARATOR '\r\n\r\n'
)
into midleOne
FROM information_schema.COLUMNS c
WHERE c.table_schema=DATABASE()
AND c.TABLE_NAME = iTABLENAME
ORDER BY c.ORDINAL_POSITION;

SET firstOne = CONCAT
('bo.'
,fcHLPCHANGETOPASCALCASE(iTABLENAME)
,' '
,lower(iTABLENAME)
,' = new bo.'
,fcHLPCHANGETOPASCALCASE(iTABLENAME)
,'(); \r\n'
);
SET lastOne = CONCAT
(
'\r\n'
,'bo.'
,lower(iTABLENAME)
,'.Save()'
,'; \r\n'
);



SELECT  CONCAT(firstOne,midleOne,lastOne) AS OUTPUT;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocHLPNEWENTITYFL
DROP PROCEDURE IF EXISTS `sprocHLPNEWENTITYFL`;
DELIMITER //
CREATE PROCEDURE `sprocHLPNEWENTITYFL`(IN iTABLENAME VARCHAR(50))
    COMMENT 'erstellt net fixed length für Tabelle'
BEGIN
DECLARE firstOne text;
DECLARE midleOne text;
DECLARE lastOne text;

SELECT GROUP_CONCAT(
CONCAT
(
IF(c.COLUMN_COMMENT = '','',
CONCAT(
'        // = ' 
,c.COLUMN_COMMENT
,'\r\n'
))

,'        '
,'[Layout(0, 0)]'
,'\r\n'
,'        public string '
,fcHLPCHANGETOPASCALCASE(c.COLUMN_NAME)
,';'
)
SEPARATOR '\r\n\r\n'
)
into midleOne
FROM information_schema.COLUMNS c
WHERE c.table_schema=DATABASE()
AND c.TABLE_NAME = iTABLENAME
ORDER BY c.ORDINAL_POSITION;  
  
SET firstOne = CONCAT
('    public class '
,'KCW_' 
,fcHLPCHANGETOPASCALCASE(iTABLENAME)
,'\r\n'
,    '    {\r\n'
);


set lastOne = '\r\n    }'
;


SELECT  CONCAT(firstOne,midleOne,lastOne) AS OUTPUT;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocHLPParametersCopy
DROP PROCEDURE IF EXISTS `sprocHLPParametersCopy`;
DELIMITER //
CREATE PROCEDURE `sprocHLPParametersCopy`()
BEGIN

INSERT INTO sytparameter
(
  SYBEREICH
 ,SYPARNUMMER
 ,SYUSERNAME
 ,SYVALUE
 ,SYDESCRIPTION
 ,SYEDITOR
)
SELECT
  SYBEREICH,
  SYPARNUMMER,
  SYUSERNAME,
  SYVALUE,
  SYDESCRIPTION,
  SYEDITOR
FROM sytparameter
WHERE 1 = 0;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocHLPPOCO
DROP PROCEDURE IF EXISTS `sprocHLPPOCO`;
DELIMITER //
CREATE PROCEDURE `sprocHLPPOCO`(IN iTABLENNAME VARCHAR(50))
    DETERMINISTIC
    COMMENT 'erstellt net POCO für Tabelle'
BEGIN

SELECT GROUP_CONCAT(
CONCAT
( 
IF(c.COLUMN_COMMENT = '','',
CONCAT(
'   // = ' 
,c.COLUMN_COMMENT
,'\r\n'
))

,'public '
,fcHLPCHANGETONET(c.DATA_TYPE)
,' '
,fcHLPCHANGETOPASCALCASE(c.COLUMN_NAME)
,' { get; set; } '
)
SEPARATOR '\r\n\r\n') 
FROM information_schema.COLUMNS c
WHERE c.table_schema=DATABASE()
AND c.TABLE_NAME = TRIM(iTABLENNAME)
ORDER BY c.ORDINAL_POSITION;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocHLPPOCOTiraggo
DROP PROCEDURE IF EXISTS `sprocHLPPOCOTiraggo`;
DELIMITER //
CREATE PROCEDURE `sprocHLPPOCOTiraggo`(IN iTABLENNAME VARCHAR(50), IN iPREFIX VARCHAR(50))
    DETERMINISTIC
    COMMENT 'erstellt Select einzelne Columns für Tiraggo'
BEGIN


SELECT GROUP_CONCAT(
CONCAT
( 
IF(c.COLUMN_COMMENT = '','',
CONCAT(
' // = ' 
,c.COLUMN_COMMENT
,'\r\n'
))

, TRIM(iPREFIX)
,'.'
,fcHLPCHANGETOPASCALCASE(c.COLUMN_NAME)
,' = \"; '
)
SEPARATOR '\r\n') 
FROM information_schema.COLUMNS c
WHERE c.table_schema = DATABASE()
AND c.TABLE_NAME = TRIM(iTABLENNAME)
ORDER BY c.ORDINAL_POSITION;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocHLPPOCOTXTIMPORT
DROP PROCEDURE IF EXISTS `sprocHLPPOCOTXTIMPORT`;
DELIMITER //
CREATE PROCEDURE `sprocHLPPOCOTXTIMPORT`(IN iTABLENNAME VARCHAR(50))
    DETERMINISTIC
    COMMENT 'erstellt net POCO für Tabelle und Import File'
BEGIN

SELECT GROUP_CONCAT(
CONCAT
( 
IF(c.COLUMN_COMMENT = '','',
CONCAT(
'   // = ' 
,c.COLUMN_COMMENT
,'\r\n'
))
,'[FieldFixedLength('
,c.CHARACTER_MAXIMUM_LENGTH
,')]  \r\n'
,'[FieldTrim(TrimMode.Both)] \r\n'
,'public '
,fcHLPCHANGETONET(c.DATA_TYPE)
,' '
,c.COLUMN_NAME
,'; '
)
SEPARATOR '\r\n\r\n') 
FROM information_schema.COLUMNS c
WHERE c.table_schema=DATABASE()
AND c.TABLE_NAME = iTABLENNAME
ORDER BY c.ORDINAL_POSITION;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocHLPValiadator
DROP PROCEDURE IF EXISTS `sprocHLPValiadator`;
DELIMITER //
CREATE PROCEDURE `sprocHLPValiadator`(IN iTABLENNAME VARCHAR(50))
    DETERMINISTIC
    COMMENT 'erstellt net Fluent Validator '
BEGIN
SELECT
  CONCAT('using FluentValidation;
          namespace BusinessObjects
{
 public class ',fcHLPCHANGETOPASCALCASE(c.TABLE_NAME),'Validator : AbstractValidator<',fcHLPCHANGETOPASCALCASE(c.TABLE_NAME),'> \r\n   { \r\n '
   'public ', fcHLPCHANGETOPASCALCASE(c.TABLE_NAME),'Validator()  \r\n  { \r\n',
   GROUP_CONCAT(
  CONCAT
  (
  IF(c.COLUMN_COMMENT = '', '',
  CONCAT(
  '   // = '
  , c.COLUMN_COMMENT
  , '\r\n'
  ))

  , '   RuleFor(x => x.'
  , fcHLPCHANGETOPASCALCASE(c.COLUMN_NAME)
  , ').NotEmpty().WithMessage(GetTheMessage(1));    '
  )
  SEPARATOR '\r\n')
  ,
  ' \r\n  }
   private string GetTheMessage(int iMessageNumber)
        {
            return new MessagesForValidation().GetTheMessage(iMessageNumber);
        }
  \r\n } \r\n }')
FROM information_schema.COLUMNS c
WHERE c.table_schema = DATABASE()
AND c.TABLE_NAME = iTABLENNAME
AND c.COLUMN_NAME NOT LIKE 'ES%'
ORDER BY c.ORDINAL_POSITION;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocParameterGet
DROP PROCEDURE IF EXISTS `sprocParameterGet`;
DELIMITER //
CREATE PROCEDURE `sprocParameterGet`(IN iUserName varchar(50),
  IN iBereich  varchar(10),
  IN iParNumber int,
  OUT oParameter varchar (2000))
BEGIN

set oParameter = 'ERROR';

SELECT
   SYVALUE INTO oParameter
   FROM sytparameter
   WHERE SYBEREICH = iBereich AND SYPARNUMMER = iParNumber AND SYUSERNAME = iUserName;

if oParameter = 'ERROR' THEN
  SELECT
    SYVALUE INTO oParameter
   FROM sytparameter
   WHERE SYBEREICH = iBereich AND SYPARNUMMER = iParNumber AND SYUSERNAME = 'DEFAULT';
END IF;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocPartsCopyOneRecord
DROP PROCEDURE IF EXISTS `sprocPartsCopyOneRecord`;
DELIMITER //
CREATE PROCEDURE `sprocPartsCopyOneRecord`(IN $PartArtikleNumberOld VARCHAR(128), IN $PartArtikleNumberNew VARCHAR(128), IN $PartdrawingNumberNew VARCHAR(128), IN $Useradded VARCHAR(128), OUT $TableIdNew INT)
    MODIFIES SQL DATA
    COMMENT 'Kopiert eine Zeile von Parts'
BEGIN

  
  
  
  
  
  

SET @MainStatment = '';
SET @InsertStatment = '';
SET @SelectStatment = '';
SET @WhereClause = '';
SET @ColumnNames= '';
SET @TableIdOld = 0;



SELECT  GROUP_CONCAT(c.COLUMN_NAME)
INTO @ColumnNames
FROM information_schema.COLUMNS c
WHERE 1=1
AND
c.table_schema=DATABASE()
AND 
c.TABLE_NAME = 'stdparts'
AND 
c.EXTRA <> 'auto_increment'
AND
c.COLUMN_NAME NOT LIKE 'ESDATE%'
AND 
c.COLUMN_NAME NOT LIKE 'ESUSRMODIFYED%';


SET @InsertStatment = CONCAT('Insert into stdparts', ' (' , @ColumnNames , ')' ); 


SET @SelectStatment = CONCAT(' Select ', @ColumnNames , ' from stdparts'); 
SET @SelectStatment = REPLACE(@SelectStatment,'PARTARTIKELNO',CONCAT('\'',$PartArtikleNumberNew,'\''));
SET @SelectStatment = REPLACE(@SelectStatment,'PARTDRAWINGNO',CONCAT('\'',$PartdrawingNumberNew,'\''));
SET @SelectStatment = REPLACE(@SelectStatment,'ESROWVERSION','0');
SET @SelectStatment = REPLACE(@SelectStatment,'ESUSRADDED',CONCAT('\'',$Useradded,'\''));


SELECT PARTTABLEID INTO @TableIdOld FROM stdparts s WHERE s.PARTARTIKELNO = $PartArtikleNumberOld LIMIT 1;

SET @WhereClause = CONCAT(' Where PARTTABLEID' , ' = ' , @TableIdOld);

SET @MainStatment = CONCAT(@InsertStatment, '\r\n' , @SelectStatment, '\r\n' , @WhereClause);



EXECUTE IMMEDIATE @MainStatment;
SET $TableIdNew = LAST_INSERT_ID();


END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocPartsDelete
DROP PROCEDURE IF EXISTS `sprocPartsDelete`;
DELIMITER //
CREATE PROCEDURE `sprocPartsDelete`(IN $ARTIKELNUMMER VARCHAR(128), OUT $ERRORMESSAGES TEXT)
    DETERMINISTIC
BEGIN

  
  
  
  
  
  
  
  
  
  

  DECLARE $COUNTER int;
  DECLARE $ERRORTEXTTEMP varchar(255);
  SET $ERRORMESSAGES = '';
  SET $COUNTER = 0;

  

  
  SELECT
     COUNT(*) INTO $COUNTER
  FROM sstpuopos s
  WHERE s.ARTIKELNO = $ARTIKELNUMMER LIMIT 1;
  IF $COUNTER > 0 THEN
    set $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Bestellungen');
  END IF;
  SET $COUNTER = 0;

  

  SELECT
     COUNT(*) INTO $COUNTER
  FROM sstbomproject s
  WHERE s.BOMHEADERNO = $ARTIKELNUMMER LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Projektstückliste');
  END IF;
  SET $COUNTER = 0;

  SELECT
     COUNT(*) INTO $COUNTER
  FROM sstbomproject s
  WHERE s.BOMPOSNO = $ARTIKELNUMMER LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Projektstückliste');
  END IF;
  SET $COUNTER = 0;

  

  SELECT
     COUNT(*) INTO $COUNTER
  FROM sstdispartproof s
  WHERE s.DISPARTNUMBER = $ARTIKELNUMMER LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Disposition');
  END IF;
  SET $COUNTER = 0;

  

  SELECT
     COUNT(*) INTO $COUNTER
  FROM stdbom s
  WHERE s.BOMHEADERNO = $ARTIKELNUMMER LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Stammstückliste');
  END IF;
  SET $COUNTER = 0;

  SELECT
     COUNT(*) INTO $COUNTER
  FROM stdbom s
  WHERE s.BOMPOSNO = $ARTIKELNUMMER LIMIT 1;
  IF $COUNTER > 0 THEN
    SET $ERRORMESSAGES = CONCAT($ERRORMESSAGES, 'þ', 'ist noch in Stammstückliste');
  END IF;
  SET $COUNTER = 0;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocPivot
DROP PROCEDURE IF EXISTS `sprocPivot`;
DELIMITER //
CREATE PROCEDURE `sprocPivot`(IN tbl_name VARCHAR(99),       
    IN base_cols VARCHAR(99),      
    IN pivot_col VARCHAR(64),      
    IN tally_col VARCHAR(64),      
    IN where_clause VARCHAR(99),   
    IN order_by VARCHAR(99)        
    )
    DETERMINISTIC
BEGIN
    
    
    SET @subq = CONCAT('SELECT DISTINCT ', pivot_col, ' AS val ',
                    ' FROM ', tbl_name, ' ', where_clause, ' ORDER BY 1');
    

    SET @cc1 = "CONCAT('SUM(IF(&p = ', &v, ', &t, 0)) AS ', &v)";
    SET @cc2 = REPLACE(@cc1, '&p', pivot_col);
    SET @cc3 = REPLACE(@cc2, '&t', tally_col);
    
    SET @qval = CONCAT("'\"', val, '\"'");
    
    SET @cc4 = REPLACE(@cc3, '&v', @qval);
    

    SET SESSION group_concat_max_len = 10000;   
    SET @stmt = CONCAT(
            'SELECT  GROUP_CONCAT(', @cc4, ' SEPARATOR ",\n")  INTO @sums',
            ' FROM ( ', @subq, ' ) AS top');
     select @stmt;
    PREPARE _sql FROM @stmt;
    EXECUTE _sql;                      
    DEALLOCATE PREPARE _sql;
    
    SET @stmt2 = CONCAT(
            'SELECT ',
                base_cols, ',\n',
                @sums,
                ',\n SUM(', tally_col, ') AS Total'
            '\n FROM ', tbl_name, ' ',
            where_clause,
            ' GROUP BY ', base_cols,
            '\n WITH ROLLUP',
            '\n', order_by
        );
    select @stmt2;                    
    PREPARE _sql FROM @stmt2;
    EXECUTE _sql;                     
    DEALLOCATE PREPARE _sql;
    
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocProjCalcFill
DROP PROCEDURE IF EXISTS `sprocProjCalcFill`;
DELIMITER //
CREATE PROCEDURE `sprocProjCalcFill`(IN $CALCNUMBER VARCHAR(20), IN $PROJECTNUMBER VARCHAR(50), IN $HEADERNO VARCHAR(128), IN $DELETEBEFORE VARCHAR(255))
    DETERMINISTIC
BEGIN
  
  
  

  
  
  
  
      
  
  
  
  

 
 DELETE FROM sstprocalcpos
 WHERE 1=1
 AND CALCNUMBER= $CALCNUMBER
 AND PROJECTNR = $PROJECTNUMBER  
 AND $DELETEBEFORE = 'Y';


INSERT INTO sstprocalcpos
(
  CALCNUMBER
 ,PROJECTNR
 ,HEADERID
 ,POSID
 ,HEADERNO
 ,POS
 ,POSNO
 ,PATHTREE
 ,QUANTITY
 ,QUANTITYLEVEL
 ,QUANTITYUNIT
)
SELECT
  $CALCNUMBER,
  BOMPROJECT,
  BOMHEADERID,
  BOMPOSID,
  BOMHEADERNO,
  BOMPOS,
  BOMPOSNO,
  BOMPATHTREE,
  BOMQUANTITY,
  BOMQUANTITYLEVEL,
  BOMQUANTITYUNIT
FROM sstbomproject
WHERE BOMPROJECT = $PROJECTNUMBER;





END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocPurOrderHistory01
DROP PROCEDURE IF EXISTS `sprocPurOrderHistory01`;
DELIMITER //
CREATE PROCEDURE `sprocPurOrderHistory01`(IN $ORDERNO CHAR(50))
SELECT DISTINCT(ORDERNO) FROM sstpuopos p where p.ORDERNO = (SELECT DISTINCT(ORDERNOBEFORE) FROM sstpuopos s1 where s1.ORDERNO =$ORDERNO) 
UNION
SELECT ORDERNO FROM sstpuoheader s where s.ORDERNO =$ORDERNO
UNION
SELECT ORDERNO FROM sstpuopos p where p.ORDERNOBEFORE =$ORDERNO//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocSequenceGet
DROP PROCEDURE IF EXISTS `sprocSequenceGet`;
DELIMITER //
CREATE PROCEDURE `sprocSequenceGet`(IN psqbereich VARCHAR(15), IN psqart VARCHAR(15), OUT psqnummer VARCHAR(50))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  
  
  

  
  
  
  
  
  

  DECLARE $SEQUENCE int;
  DECLARE $PREFIX varchar(11);
  DECLARE $NODIGITS int;
  DECLARE $RESULT varchar(30);
  SET AUTOCOMMIT = 0;

  START TRANSACTION;
    
    UPDATE sytsequence
    SET SQSEQUENCE = SQSEQUENCE + 1
    WHERE SQBEREICH = psqbereich
    AND SQART = psqart;

    
    SELECT
      SQSEQUENCE,
      SQPREFIX,
      SQNUMBERDIGITS INTO $SEQUENCE, $PREFIX, $NODIGITS
    FROM sytsequence
    WHERE SQBEREICH = psqbereich
    AND SQART = psqart;
  COMMIT;
    
    IF $NODIGITS > 1 THEN
      SET $RESULT = LPAD($SEQUENCE, $NODIGITS, '0');
    ELSE
      SET $RESULT = $SEQUENCE;
    END IF;
    SET psqnummer = CONCAT(IFNULL($PREFIX, ''), $RESULT);

 
  SET autocommit = 1;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocSequenceGetOT
DROP PROCEDURE IF EXISTS `sprocSequenceGetOT`;
DELIMITER //
CREATE PROCEDURE `sprocSequenceGetOT`(IN psqbereich VARCHAR(15), IN psqart VARCHAR(15), OUT psqnummer VARCHAR(50))
    MODIFIES SQL DATA
    DETERMINISTIC
BEGIN
  
  
  

  
  
  
  
  
  
  
  

  DECLARE $SEQUENCE int;
  DECLARE $PREFIX varchar(11);
  DECLARE $NODIGITS int;
  DECLARE $RESULT varchar(30);
 
    
    UPDATE sytsequence
    SET SQSEQUENCE = SQSEQUENCE + 1
    WHERE SQBEREICH = psqbereich
    AND SQART = psqart;

    
    SELECT
      SQSEQUENCE,
      SQPREFIX,
      SQNUMBERDIGITS INTO $SEQUENCE, $PREFIX, $NODIGITS
    FROM sytsequence
    WHERE SQBEREICH = psqbereich
    AND SQART = psqart;
    
    IF $NODIGITS > 1 THEN
      SET $RESULT = LPAD($SEQUENCE, $NODIGITS, '0');
    ELSE
      SET $RESULT = $SEQUENCE;
    END IF;
    SET psqnummer = CONCAT(IFNULL($PREFIX, ''), $RESULT);
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocshowbom
DROP PROCEDURE IF EXISTS `sprocshowbom`;
DELIMITER //
CREATE PROCEDURE `sprocshowbom`(IN $PARTNUMBER CHAR(50), IN $QUANTITY DOUBLE)
WITH RECURSIVE bom_cte (
 BOMHEADERID
,BOMPOSID
,BOMTABLEID
,xbruttoqt
,xpath
,xpathpart
,xlevel
) AS
(
  SELECT
    stdbom.BOMHEADERID
	,stdbom.BOMPOSID
	,stdbom.BOMTABLEID
   ,CAST($QUANTITY * stdbom.BOMQUANTITY AS DOUBLE(15,5))
   ,CAST(LPAD(stdbom.BOMPOS ,4,'0') AS CHAR(100))
   ,CAST(CONCAT(stdbom.BOMHEADERNO,'þ',stdbom.BOMPOSNO) AS CHAR(2048))
   ,1 AS xlevel
  FROM stdbom WHERE stdbom.BOMHEADERNO = $PARTNUMBER
    UNION ALL
  SELECT 
       bom.BOMHEADERID
   	,bom.BOMPOSID
   	,bom.BOMTABLEID
   	,cte.xbruttoqt * bom.BOMQUANTITY
  	   ,CONCAT(cte.xpath,'.',LPAD(bom.BOMPOS,4,'0'))
  	   ,CONCAT(cte.xpathpart,'þ',bom.BOMPOSNO)
   	,cte.xlevel + 1
    FROM stdbom AS bom, bom_cte AS cte WHERE cte.BOMPOSID = bom.BOMHEADERID
)
SELECT
cte.xlevel
,cte.xpath
,cte.xpathpart
,ph.PARTDRAWINGNO AS MUTTER
,ph.PARTDESCRIPTION1 AS MUTTERBESCHREIBUNG
,bo.BOMHEADERID AS MUTTERID
,pp.PARTDRAWINGNO AS KIND
,pp.PARTDESCRIPTION1 AS KINDBESCHREIBUNG
,bo.BOMPOSID AS KINDID

,bo.BOMQUANTITY
,cte.xbruttoqt AS bruttopos
,SUM(cte.xbruttoqt) OVER (PARTITION BY cte.BOMPOSID) AS totalperpart
FROM bom_cte cte 
INNER JOIN stdbom bo ON cte.BOMTABLEID = bo.BOMTABLEID
INNER JOIN stdparts pp ON cte.BOMPOSID = pp.PARTTABLEID
INNER JOIN stdparts ph ON cte.BOMHEADERID  = ph.PARTTABLEID
ORDER BY cte.xpath//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocshowbompartnumber
DROP PROCEDURE IF EXISTS `sprocshowbompartnumber`;
DELIMITER //
CREATE PROCEDURE `sprocshowbompartnumber`(IN $PROJECTNUMBER VARCHAR(50), IN $PARTNUMBER VARCHAR(255))
BEGIN


WITH RECURSIVE bom_cte (
BOMHEADERID
,BOMPOSID
,BOMTABLEID
,XBRUTTOQT
,XPATH
,XPOS
,XPATHPART
,XLEVEL
) AS
(
  SELECT
    sstbomproject.BOMHEADERID
	,sstbomproject.BOMPOSID
	,sstbomproject.BOMTABLEID
   ,CAST(sstbomproject.BOMQUANTITY AS DOUBLE)
   ,CAST(LPAD(sstbomproject.BOMPOS ,4,'0') AS CHAR(100))
   ,CAST(sstbomproject.BOMPOS AS CHAR(100))
   ,CAST(CONCAT(sstbomproject.BOMHEADERNO,'þ',sstbomproject.BOMPOSNO) AS CHAR(2048))
   ,1 AS xlevel
  FROM sstbomproject WHERE sstbomproject.BOMHEADERNO = $PARTNUMBER AND sstbomproject.BOMPROJECT = $PROJECTNUMBER
    UNION ALL
  SELECT 
       bom.BOMHEADERID
   	,bom.BOMPOSID
   	,bom.BOMTABLEID
   	,cte.xbruttoqt * bom.BOMQUANTITY
  	   ,CONCAT(cte.xpath,'.',LPAD(bom.BOMPOS,4,'0'))
  	   ,CONCAT(cte.xpos,'.',bom.BOMPOS)
  	   ,CONCAT(cte.xpathpart,'þ',bom.BOMPOSNO)
   	,cte.xlevel + 1
      FROM sstbomproject AS bom, bom_cte AS cte WHERE cte.BOMPOSID = bom.BOMHEADERID AND bom.BOMPROJECT = $PROJECTNUMBER
)
SELECT
 cte.XBRUTTOQT
,cte.XPATH
,cte.XPOS
,cte.XPATHPART
,cte.XLEVEL
,bo.*
,pp.*



,SUM(cte.xbruttoqt) OVER (PARTITION BY cte.BOMPOSID) AS XTOTALPERPART
,0 as Devxcounter
,0 as Devxparentid
, IfNull(lf.BUSBUSINESSNO,'') AS SUPPLYER
, IfNull(lf.BUSCOMPANY,'') AS SUPPLYERSHORT
FROM bom_cte cte 
INNER JOIN sstbomproject bo ON cte.BOMTABLEID = bo.BOMTABLEID
INNER JOIN stdparts pp ON cte.BOMPOSID = pp.PARTTABLEID
INNER JOIN stdparts ph ON cte.BOMHEADERID  = ph.PARTTABLEID

LEFT JOIN stdbusaccount lf ON pp.PARTSTDVENDOR = lf.BUSBUSINESSNO
ORDER BY cte.xpath;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocshowbomproject
DROP PROCEDURE IF EXISTS `sprocshowbomproject`;
DELIMITER //
CREATE PROCEDURE `sprocshowbomproject`(IN $PROJECTNUMBER VARCHAR(50))
BEGIN

DECLARE $PARTNUMBER varchar(128);

SELECT s.PROJECTPARTNO INTO $PARTNUMBER  from sstprojects s where s.PROJECTNR = $PROJECTNUMBER LIMIT 1;

WITH RECURSIVE bom_cte (
BOMHEADERID
,BOMPOSID
,BOMTABLEID
,XBRUTTOQT
,XPATH
,XPOS
,XPATHPART
,XLEVEL
) AS
(
  SELECT
    sstbomproject.BOMHEADERID
	,sstbomproject.BOMPOSID
	,sstbomproject.BOMTABLEID
   ,CAST(sstbomproject.BOMQUANTITY AS DOUBLE)
   ,CAST(LPAD(sstbomproject.BOMPOS ,4,'0') AS CHAR(100))
   ,CAST(sstbomproject.BOMPOS AS CHAR(100))
   ,CAST(CONCAT(sstbomproject.BOMHEADERNO,'þ',sstbomproject.BOMPOSNO) AS CHAR(2048))
   ,1 AS xlevel
  FROM sstbomproject WHERE sstbomproject.BOMHEADERNO = $PARTNUMBER AND sstbomproject.BOMPROJECT = $PROJECTNUMBER
    UNION ALL
  SELECT 
       bom.BOMHEADERID
   	,bom.BOMPOSID
   	,bom.BOMTABLEID
   	,cte.xbruttoqt * bom.BOMQUANTITY
  	   ,CONCAT(cte.xpath,'.',LPAD(bom.BOMPOS,4,'0'))
  	   ,CONCAT(cte.xpos,'.',bom.BOMPOS)
  	   ,CONCAT(cte.xpathpart,'þ',bom.BOMPOSNO)
   	,cte.xlevel + 1
      FROM sstbomproject AS bom, bom_cte AS cte WHERE cte.BOMPOSID = bom.BOMHEADERID AND bom.BOMPROJECT = $PROJECTNUMBER
)
SELECT
 cte.XBRUTTOQT
,cte.XPATH
,cte.XPOS
,cte.XPATHPART
,cte.XLEVEL
,bo.*
,pp.*



,SUM(cte.xbruttoqt) OVER (PARTITION BY cte.BOMPOSID) AS XTOTALPERPART
,0 as Devxcounter
,0 as Devxparentid
, IfNull(lf.BUSBUSINESSNO,'') AS SUPPLYER
, IfNull(lf.BUSCOMPANY,'') AS SUPPLYERSHORT
FROM bom_cte cte 
INNER JOIN sstbomproject bo ON cte.BOMTABLEID = bo.BOMTABLEID
INNER JOIN stdparts pp ON cte.BOMPOSID = pp.PARTTABLEID
INNER JOIN stdparts ph ON cte.BOMHEADERID  = ph.PARTTABLEID

LEFT JOIN stdbusaccount lf ON pp.PARTSTDVENDOR = lf.BUSBUSINESSNO
ORDER BY cte.xpath;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocshowemptystorage
DROP PROCEDURE IF EXISTS `sprocshowemptystorage`;
DELIMITER //
CREATE PROCEDURE `sprocshowemptystorage`(IN $LOCATION VARCHAR(50))
BEGIN


IF $LOCATION = '' THEN

    WITH RECURSIVE storage_cte (
    CTABLEID,
    CSTORAGEID,
    CSTORAGEIDPARENT,
    CLOCATIONONSTORAGE     
    ) AS
    (
      SELECT
      s.TABLEID,
       s.STORAGE,
       s.STORAGEPARENT,
       s.DESCRIPTION
      FROM stdstorage s WHERE s.PARTARTIKELNO = '' AND s.ISSTORAGE = true
        UNION ALL
      SELECT 
           cte.CTABLEID,
           storage.STORAGE,
           storage.STORAGEPARENT,
           CAST(CONCAT(storage.DESCRIPTION,'.', CLOCATIONONSTORAGE) AS char)
          FROM stdstorage AS storage, storage_cte AS cte WHERE cte.CSTORAGEIDPARENT = storage.STORAGE 
    )
        SELECT
        *
        FROM storage_cte JOIN stdstorage s ON storage_cte.CTABLEID = s.TABLEID
        WHERE CSTORAGEIDPARENT = 0 AND s.BLOCKED = false;

ELSE
 
  WITH RECURSIVE storage_cte (
  CTABLEID,
  CSTORAGEID,
  CSTORAGEIDPARENT,
  CLOCATIONONSTORAGE     
  ) AS
  (
    SELECT
    s.TABLEID,
     s.STORAGE,
     s.STORAGEPARENT,
     s.DESCRIPTION
    FROM stdstorage s WHERE s.PARTARTIKELNO = '' AND s.ISSTORAGE = true
      UNION ALL
    SELECT 
         cte.CTABLEID,
         storage.STORAGE,
         storage.STORAGEPARENT,
         CAST(CONCAT(storage.DESCRIPTION,'.', CLOCATIONONSTORAGE) AS char)
        FROM stdstorage AS storage, storage_cte AS cte WHERE cte.CSTORAGEIDPARENT = storage.STORAGE 
  )
      SELECT
      *
      FROM storage_cte JOIN stdstorage s ON storage_cte.CTABLEID = s.TABLEID
      WHERE CSTORAGEIDPARENT = 0 AND s.LOCATION = $LOCATION AND s.BLOCKED = false;

END IF;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocshowlocationonstorage
DROP PROCEDURE IF EXISTS `sprocshowlocationonstorage`;
DELIMITER //
CREATE PROCEDURE `sprocshowlocationonstorage`(IN $PARTNUMBER VARCHAR(255))
BEGIN


WITH RECURSIVE storage_cte (
CTABLEID,
CSTORAGEID,
CSTORAGEIDPARENT,
CLOCATIONONSTORAGE     
) AS
(
  SELECT
  s.TABLEID,
   s.STORAGE,
   s.STORAGEPARENT,
   s.DESCRIPTION
  FROM stdstorage s WHERE s.PARTARTIKELNO = $PARTNUMBER
    UNION ALL
  SELECT 
       cte.CTABLEID,
       storage.STORAGE,
       storage.STORAGEPARENT,
       CAST(CONCAT(storage.DESCRIPTION,'.', CLOCATIONONSTORAGE) AS char)
      FROM stdstorage AS storage, storage_cte AS cte WHERE cte.CSTORAGEIDPARENT = storage.STORAGE 
)
SELECT
*
FROM storage_cte JOIN stdstorage s ON storage_cte.CTABLEID = s.TABLEID
WHERE CSTORAGEIDPARENT = 0 AND s.BLOCKED = false;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocShowOrderInPosTree
DROP PROCEDURE IF EXISTS `sprocShowOrderInPosTree`;
DELIMITER //
CREATE PROCEDURE `sprocShowOrderInPosTree`(
	IN `iOrderNumber` VARCHAR(255),
	IN `iArtikelNo` VARCHAR(255)
)
BEGIN
DECLARE $RESULT varchar(20);

set @ROW_NUMBER = 0;
SET $RESULT = '';

SELECT
   s.TABLEID INTO $RESULT
   FROM sstsalesorderpos s WHERE s.ORDERNO =  iOrderNumber AND s.ARTIKELNO = iArtikelNo;

IF $Result != '' THEN 

WITH RECURSIVE orderIn_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR,
CLEVEL
) AS
(
  SELECT
   s.TABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO,
   1
   FROM sstsalesorderpos s WHERE s.ORDERNO =  iOrderNumber  AND s.ARTIKELNO = iArtikelNo
    UNION ALL
  SELECT 
       orderin.TABLEID,
       orderin.ORDERNO,
       orderin.ORDERNOBEFORE,
       cte.CORDERARTIKELNR,
       cte.CLEVEL + 1
       FROM sstsalesorderpos AS orderin, orderIn_cte AS cte WHERE cte.CORDERNOBEFORE = orderin.ORDERNO AND orderin.ARTIKELNO = iArtikelNo
)
SELECT 
CORDERNO INTO $RESULT
FROM
(
SELECT 
   (@ROW_NUMBER := @ROW_NUMBER + 1) AS num, 
   CLEVEL, CORDERNO, CORDERARTIKELNR, CORDERNOBEFORE, sp.ARTIKELNO, sp.ORDERNO, sp.ORDERQUANTITY, sp.DELIVERDQUANTITY
FROM orderIn_cte
INNER JOIN sstsalesorderpos sp ON CTABLEID = sp.TABLEID
ORDER BY @ROW_NUMBER DESC LIMIT 1 
) AS TEST;


WITH RECURSIVE orderIn_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR
) AS
(
  SELECT
   s.TABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO
   FROM sstsalesorderpos s WHERE s.ORDERNO = $RESULT and s.ARTIKELNO = iArtikelNo
    UNION ALL
  SELECT 
       orderin.TABLEID,
       orderin.ORDERNO,
       orderin.ORDERNOBEFORE,
       cte.CORDERARTIKELNR
       FROM sstsalesorderpos AS orderin, orderIn_cte AS cte WHERE orderin.ORDERNOBEFORE = cte.CORDERNO AND orderin.ARTIKELNO = cte.CORDERARTIKELNR
)
SELECT 
sp.TABLEID, so.ORDERTYPE
FROM orderIn_cte
INNER JOIN sstsalesorderpos sp ON CTABLEID = sp.TABLEID 
LEFT JOIN sstsalesorder so ON so.ORDERNO = CORDERNO;

END IF;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocShowOrderInTree
DROP PROCEDURE IF EXISTS `sprocShowOrderInTree`;
DELIMITER //
CREATE PROCEDURE `sprocShowOrderInTree`(
	IN `iOrderNumber` VARCHAR(255)
)
BEGIN
DECLARE $RESULT varchar(20);

set @ROW_NUMBER = 0;
SET $RESULT = '';

SELECT
   s.TABLEID INTO $RESULT
   FROM sstsalesorderpos s WHERE s.ORDERNO =  iOrderNumber LIMIT 1;

IF $Result != '' THEN 

WITH RECURSIVE orderIn_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR,
CLEVEL
) AS
(
  SELECT
   s.TABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO,
   1
   FROM sstsalesorderpos s WHERE s.ORDERNO =  iOrderNumber
    UNION ALL
  SELECT 
       orderin.TABLEID,
       orderin.ORDERNO,
       orderin.ORDERNOBEFORE,
       cte.CORDERARTIKELNR,
       cte.CLEVEL + 1
       FROM sstsalesorderpos AS orderin, orderIn_cte AS cte WHERE cte.CORDERNOBEFORE = orderin.ORDERNO AND orderin.ARTIKELNO = cte.CORDERARTIKELNR
)
SELECT 
CORDERNO INTO $RESULT
FROM
(
SELECT 
   (@ROW_NUMBER := @ROW_NUMBER + 1) AS num, 
   CLEVEL, CORDERNO, CORDERARTIKELNR, CORDERNOBEFORE, sp.ARTIKELNO, sp.ORDERNO, sp.ORDERQUANTITY, sp.DELIVERDQUANTITY
FROM orderIn_cte
INNER JOIN sstsalesorderpos sp ON CTABLEID = sp.TABLEID
ORDER BY @ROW_NUMBER DESC LIMIT 1 
) AS TEST;


WITH RECURSIVE orderIn_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR
) AS
(
  SELECT
   s.TABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO
   FROM sstsalesorderpos s WHERE s.ORDERNO = $RESULT
    UNION ALL
  SELECT 
       orderin.TABLEID,
       orderin.ORDERNO,
       orderin.ORDERNOBEFORE,
       cte.CORDERARTIKELNR
       FROM sstsalesorderpos AS orderin, orderIn_cte AS cte WHERE orderin.ORDERNOBEFORE = cte.CORDERNO AND orderin.ARTIKELNO = cte.CORDERARTIKELNR
)
SELECT 
CORDERNO AS Vorgang, CORDERARTIKELNR AS Vorgangsposition, CORDERNOBEFORE AS Vorgänger, sp.ORDERQUANTITY AS Menge, sp.DELIVERDQUANTITY AS 'Menge geliefert'
FROM orderIn_cte
INNER JOIN sstsalesorderpos sp ON CTABLEID = sp.TABLEID;

END IF;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocShowPuoProject
DROP PROCEDURE IF EXISTS `sprocShowPuoProject`;
DELIMITER //
CREATE PROCEDURE `sprocShowPuoProject`(IN iOrderNumber VARCHAR(255))
BEGIN
DECLARE $RESULT varchar(20);

set @ROW_NUMBER = 0;
SET $RESULT = '';

WITH RECURSIVE orderOut_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR,
CLEVEL
) AS
(
  SELECT
   s.POPTABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO,
   1
   FROM sstpuopos s WHERE s.ORDERNO =  iOrderNumber
    UNION ALL
  SELECT 
       orderout.POPTABLEID,
       orderout.ORDERNO,
       orderout.ORDERNOBEFORE,
       cte.CORDERARTIKELNR,
       cte.CLEVEL + 1
       FROM sstpuopos AS orderout, orderOut_cte AS cte WHERE cte.CORDERNOBEFORE = orderout.ORDERNO AND orderout.ARTIKELNO = cte.CORDERARTIKELNR
)
SELECT 
CORDERNO INTO $RESULT
FROM
(
SELECT 
   (@ROW_NUMBER := @ROW_NUMBER + 1) AS num, 
   CLEVEL, CORDERNO, CORDERARTIKELNR, CORDERNOBEFORE, sp.ARTIKELNO, sp.ORDERNO, sp.ORDERQTY, sp.DELIVERYQUANTITY
FROM orderOut_cte
INNER JOIN sstpuopos sp ON CTABLEID = sp.POPTABLEID
ORDER BY @ROW_NUMBER DESC LIMIT 1 
) AS TEST;


WITH RECURSIVE orderOut_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR
) AS
(
  SELECT
   s.POPTABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO
   FROM sstpuopos s WHERE s.ORDERNO = $RESULT
    UNION ALL
  SELECT 
       orderout.POPTABLEID,
       orderout.ORDERNO,
       orderout.ORDERNOBEFORE,
       cte.CORDERARTIKELNR
       FROM sstpuopos AS orderout, orderOut_cte AS cte WHERE orderout.ORDERNOBEFORE = cte.CORDERNO AND orderout.ARTIKELNO = cte.CORDERARTIKELNR
)
SELECT 
CORDERNO AS Vorgang, CORDERARTIKELNR AS Vorgangsposition, CORDERNOBEFORE AS Vorgägnger, sp.ORDERQTY AS Menge, sp.DELIVERYQUANTITY AS 'Menge geliefert'
FROM orderOut_cte
INNER JOIN sstpuopos sp ON CTABLEID = sp.POPTABLEID;

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocShowPuoTree
DROP PROCEDURE IF EXISTS `sprocShowPuoTree`;
DELIMITER //
CREATE PROCEDURE `sprocShowPuoTree`(
	IN `iOrderNumber` VARCHAR(255)
)
BEGIN
DECLARE $RESULT varchar(20);

set @ROW_NUMBER = 0;
SET $RESULT = '';

SELECT
   s.POPTABLEID INTO $RESULT
   FROM sstpuopos s WHERE s.ORDERNO =  iOrderNumber LIMIT 1;

IF $Result != '' THEN 

WITH RECURSIVE orderOut_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR,
CLEVEL
) AS
(
  SELECT
   s.POPTABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO,
   1
   FROM sstpuopos s WHERE s.ORDERNO =  iOrderNumber
    UNION ALL
  SELECT 
       orderout.POPTABLEID,
       orderout.ORDERNO,
       orderout.ORDERNOBEFORE,
       cte.CORDERARTIKELNR,
       cte.CLEVEL + 1
       FROM sstpuopos AS orderout, orderOut_cte AS cte WHERE cte.CORDERNOBEFORE = orderout.ORDERNO AND orderout.ARTIKELNO = cte.CORDERARTIKELNR
)
SELECT 
CORDERNO INTO $RESULT
FROM
(
SELECT 
   (@ROW_NUMBER := @ROW_NUMBER + 1) AS num, 
   CLEVEL, CORDERNO, CORDERARTIKELNR, CORDERNOBEFORE, sp.ARTIKELNO, sp.ORDERNO, sp.ORDERQTY, sp.DELIVERYQUANTITY
FROM orderOut_cte
INNER JOIN sstpuopos sp ON CTABLEID = sp.POPTABLEID
ORDER BY @ROW_NUMBER DESC LIMIT 1 
) AS TEST;


WITH RECURSIVE orderOut_cte (
CTABLEID,
CORDERNO,
CORDERNOBEFORE,
CORDERARTIKELNR
) AS
(
  SELECT
   s.POPTABLEID,
   s.ORDERNO,
   s.ORDERNOBEFORE,
   s.ARTIKELNO
   FROM sstpuopos s WHERE s.ORDERNO = $RESULT
    UNION ALL
  SELECT 
       orderout.POPTABLEID,
       orderout.ORDERNO,
       orderout.ORDERNOBEFORE,
       cte.CORDERARTIKELNR
       FROM sstpuopos AS orderout, orderOut_cte AS cte WHERE orderout.ORDERNOBEFORE = cte.CORDERNO AND orderout.ARTIKELNO = cte.CORDERARTIKELNR
)
SELECT 
CORDERNO AS Vorgang, CORDERARTIKELNR AS Vorgangsposition, CORDERNOBEFORE AS Vorgänger, sp.ORDERQTY AS Menge, sp.DELIVERYQUANTITY AS 'Menge geliefert'
FROM orderOut_cte
INNER JOIN sstpuopos sp ON CTABLEID = sp.POPTABLEID;

END IF;
END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocStockBook01
DROP PROCEDURE IF EXISTS `sprocStockBook01`;
DELIMITER //
CREATE PROCEDURE `sprocStockBook01`(IN iBookType VARCHAR(10), IN iPartNumber VARCHAR(125), IN iQuantity DOUBLE, IN iQuantityunit VARCHAR(10), IN iStorage VARCHAR(50), IN iStorageYard VARCHAR(50), IN iProject VARCHAR(50), IN iBookingType VARCHAR(10), IN iBookingNumber VARBINARY(20), IN iBookingPos INT, IN iComment VARCHAR(255), OUT oError VARCHAR(255), IN iPrice DOUBLE, IN iBookingDate DATETIME, IN iUserName VARCHAR(25))
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Buchen Lagerbestand'
sproc_leave:
BEGIN

  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


  
  DECLARE xStockQuantityCurrent double DEFAULT 0;
  
  DECLARE xStockMain varchar(20) DEFAULT 'MAINSTOCK';
  
  DECLARE xStockWithMain varchar(20) DEFAULT 'Y';

  
  DECLARE xParStockIsProject varchar(20) DEFAULT 'N';
  
  DECLARE xParStockWithYards varchar(20) DEFAULT 'N';

  
  DECLARE xStockQuantityBooking double DEFAULT 0;
  DECLARE xStockQuantityUnit varchar(20) DEFAULT 0;

  
  DECLARE xStockPriceCurrent double DEFAULT 0;

  
  
  DECLARE xStockDateCurrent datetime DEFAULT DATE(CURDATE());

  
  
  DECLARE xStockDateTakeingCurrent datetime DEFAULT DATE(CURDATE());

  
  DECLARE xStockStorage varchar(50) DEFAULT xStockMain;
  DECLARE xStockStorageYards varchar(50) DEFAULT '';

  
  
  

  
  CALL sprocParameterGet(iUserName, 'STOCK', 1, xStockWithMain);
  IF xStockWithMain <> 'Y' THEN
      SET oError = 'not Implemented';
      LEAVE sproc_leave;
    END IF;
  
  
  
   CALL sprocParameterGet(iUserName, 'STOCK', 2, xStockMain);

  
  CALL sprocParameterGet(iUserName, 'STOCK', 3, xParStockWithYards);

  
  CALL sprocParameterGet(iUserName, 'STOCK', 10, xParStockIsProject);

  
  SELECT
    IFNULL(SUM(s.QUANTITY), 0) INTO xStockQuantityCurrent
  FROM stdstoragemaster s
  WHERE 1 = 1
  AND s.PARTARTIKELNO = iPartNumber;
  
  
  
  SET xStockQuantityBooking = ABS(iQuantity);

  
  SET xStockPriceCurrent = iPrice;
  IF xStockPriceCurrent = 0 THEN
    SELECT
     s.PARTPRICE INTO  xStockPriceCurrent
    FROM stdparts s
    WHERE 1 = 1
    AND s.PARTARTIKELNO = iPartNumber;
  END IF;

  
  

  

  
  
  
  IF (TRIM(COALESCE(iStorage, '') <> '')) THEN
    SET xStockMain = iStorage;
  END IF;

  
  IF (xParStockIsProject = 'Y') THEN
    SET xStockMain = iProject;
  END IF;

  
  IF NOT EXISTS (SELECT
        'X'
      FROM stdstoragemaster s
      WHERE s.PARTARTIKELNO = iPartNumber
      AND s.STORAGE = xStockMain) THEN
    INSERT INTO stdstoragemaster (STORAGE
    , STORAGEYARD
    , PARTARTIKELNO
    , PARTVARIANT
    , CHARGE
    , QUANTITY
    , RESERVATIONQUANTITY
    , PASSIV
    , PASSIVCLASS
    , STOTAKEINGQUANTITY
    , STOTAKEINGDATE
    , ESDATEADDED
    , ESDATEMODIFYED
    , ESUSRADDED
    , ESUSRMODIFYED
    , ESROWVERSION)
      VALUES (xStockMain, '', iPartNumber, '', '', 0, 0, FALSE, '', 0, DATE('1900-01-01'), NOW(), NOW(), iUserName, iUserName, 0);
  END IF;

  

  
  UPDATE stdstoragemaster
  SET QUANTITY =
  CASE iBookType
    WHEN 'ADD' THEN QUANTITY + xStockQuantityBooking 
    WHEN 'SUB' THEN QUANTITY + (ABS(xStockQuantityBooking) * -1) 
    WHEN 'MUST' THEN xStockQuantityBooking END
  ,ESROWVERSION = ESROWVERSION + 1
  ,ESDATEMODIFYED = NOW()
  ,ESUSRMODIFYED = iUserName
  WHERE PARTARTIKELNO = iPartNumber
  AND STORAGE = xStockMain;

  

  INSERT INTO sststoragetransaction (STORAGEB
  , STORAGEYARDB
  , PARTARTIKELNO
  , VARIANT
  , CHARGE
  , BOOKINGDATE
  , BOOKINGQUANTITY
  , BOOKINGKIND
  , STOREQUANTITYB
  , STOREQUANTITYA
  , BOOKINGPRICE
  , ESDATEADDED
  , ESDATEMODIFYED
  , ESUSRADDED
  , ESUSRMODIFYED
  , COMMENT
  , PROJECT
  , BOOKINGTYPE
  , BOOKINGNUMBER
  , BOOKINGPOS)
    SELECT
      STORAGE,
      STORAGEYARD,
      PARTARTIKELNO,
      PARTVARIANT,
      CHARGE,
      NOW(),
      CASE iBookType
       WHEN 'ADD' THEN xStockQuantityBooking 
       WHEN 'SUB' THEN ABS(xStockQuantityBooking) * -1 
       WHEN 'MUST' THEN xStockQuantityBooking 
      END,
      iBookType,
      xStockQuantityCurrent,
      QUANTITY,
      iPrice,
      ESDATEADDED,
      ESDATEMODIFYED,
      ESUSRADDED,
      ESUSRMODIFYED,
      iComment,
      iProject,
      iBookingType,
      iBookingNumber,
      iBookingPos
    FROM stdstoragemaster
    WHERE PARTARTIKELNO = iPartNumber
    AND STORAGE = xStockMain;


  
  
  
  
  IF (xParStockIsProject = 'Y' OR xParStockWithYards = 'N') THEN
    DELETE
      FROM stdstoragemaster
    WHERE PARTARTIKELNO = iPartNumber
      AND STORAGE = xStockMain
      AND QUANTITY = 0;
  END IF;
 
  SET oError = 'nothing';

END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocStockBookWiStorage01
DROP PROCEDURE IF EXISTS `sprocStockBookWiStorage01`;
DELIMITER //
CREATE PROCEDURE `sprocStockBookWiStorage01`(IN iBookType varchar(10), IN iPartNumber varchar(125), IN iQuantity double, IN iQuantityunit varchar(10), IN iStorage varchar(50), IN iStorageYard varchar(50), IN iProject varchar(50), IN iBookingType varchar(10), IN iBookingNumber varbinary(20), IN iBookingPos int, IN iComment varchar(255), OUT oError varchar(255), IN iPrice double, IN iBookingDate datetime, IN iUserName varchar(25))
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Buchen Lagerbestand mit FW'
sproc_leave:
  BEGIN

    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    
    DECLARE xPROJECTCOUNTNODES int DEFAULT 0;

    
    DECLARE xStockQuantityCurrent double DEFAULT 0;

    
    DECLARE xStockMain varchar(20) DEFAULT 'MAINSTOCK';

    
    DECLARE xParStockIsProject varchar(20) DEFAULT 'Y';

    
    DECLARE xStockQuantityBooking double DEFAULT 0;
    DECLARE xStockQuantityUnit varchar(20) DEFAULT 0;

    
    DECLARE xStockPriceCurrent double DEFAULT 0;

    
    
    DECLARE xStockDateCurrent datetime DEFAULT DATE(CURDATE());

    
    
    DECLARE xStockDateTakeingCurrent datetime DEFAULT DATE(CURDATE());

    
    DECLARE xStockStorage varchar(50) DEFAULT xStockMain;
    DECLARE xStockStorageYards varchar(50) DEFAULT '';


    
    DECLARE xStockProjectNode int DEFAULT 0;
    DECLARE xStockInsertNode int DEFAULT 0;

    
    DECLARE xStorageNr int DEFAULT 0;

    SELECT
      s.STORAGE INTO xStockProjectNode
    FROM stdstorage s
    WHERE STORAGEPARENT = 0
    AND s.STORAGENODETYPE = 'PROJECT';

    
    CALL sprocParameterGet(iUserName, 'STOCK', 2, xStockMain);

    
    
    

    
    SELECT
      IFNULL(s.PARTARTIKELQTY, 0) INTO xStockQuantityCurrent
    FROM stdstorage s
    WHERE 1 = 1
    AND s.STORAGE = iStorage;

    
    
    SET xStockQuantityBooking = ABS(iQuantity);

    
    SET xStockPriceCurrent = iPrice;
    IF xStockPriceCurrent = 0 THEN
      SELECT
        s.PARTPRICE INTO xStockPriceCurrent
      FROM stdparts s
      WHERE 1 = 1
      AND s.PARTARTIKELNO = iPartNumber;
    END IF;

    
    

    
    IF iProject != xStockMain THEN
      SET xStockInsertNode = xStockProjectNode;
    END IF;


    IF iProject != xStockMain THEN
      
      
      IF NOT EXISTS (SELECT
            'X'
          FROM stdstorage
          WHERE DESCRIPTION = iProject
          AND STORAGEPARENT = xStockInsertNode) THEN

        CALL sprocSequenceGet('STOCK', 'STORAGENR', xStorageNr);

        INSERT INTO stdstorage (STORAGE
        , STORAGEPARENT
        , DESCRIPTION
        , RESPONSIBLE
        , ISSTORAGE
        , TYPE
        , GROUPS
        , PASSIV
        , YARDNUMBER
        , YARDLENGTH
        , YARDWIDTH
        , YARDHIGH
        , YARDMAXWEIGHT
        , PICKSORT
        , PARTARTIKELNO
        , PARTVARIANT
        , PARTARTIKELQTY
        , PARTARTIKELQTYUNIT
        , CHARGE
        , COSTCENTER
        , DELIVERYSTATION
        , BLOCKED
        , LOCATION
        , CUSTOMC01
        , CUSTOMC02
        , CUSTOMC03
        , CUSTOMC04
        , CUSTOMC05
        , CUSTOMN01
        , CUSTOMN02
        , CUSTOMN03
        , CUSTOMN04
        , CUSTOMN05
        , CUSTOMB01
        , CUSTOMB02
        , CUSTOMB03
        , CUSTOMB04
        , CUSTOMB05
        , CUSTOMGROUP01
        , CUSTOMGROUP02
        , CUSTOMGROUP03
        , CUSTOMGROUP04
        , CUSTOMGROUP05
        , LASTBOOKINGDATE
        , INVENTORYQUANTITY
        , INVENTORYDATE
        , ISWITHYARD
        , KOMMENTAR
        , STORAGENODETYPE
        , ESDATEADDED
        , ESDATEMODIFYED
        , ESUSRMODIFYED
        , ESUSRADDED
        , ESROWVERSION)
          VALUES (xStorageNr 
          , xStockInsertNode 
          , iProject 
          , '' 
          , 1 
          , 'FIX' 
          , '' 
          , 0 
          , '' 
          , 0 
          , 0 
          , 0 
          , 0 
          , '' 
          , '' 
          , '' 
          , 0 
          , '' 
          , '' 
          , '' 
          , '' 
          , 0 
          , '' 
          , '' 
          , '' 
          , '' 
          , '' 
          , '' 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , '' 
          , '' 
          , '' 
          , '' 
          , '' 
          , NOW() 
          , 0 
          , NOW() 
          , 0 
          , '' 
          , '' 
          , NOW() 
          , NOW() 
          , '' 
          , '' 
          , 0 
          );
        SET xStockInsertNode = xStorageNr;
      ELSE
        SELECT
          STORAGE INTO xStockInsertNode
        FROM stdstorage
        WHERE DESCRIPTION = iProject
        AND STORAGEPARENT = xStockInsertNode;
      END IF;

      
      IF NOT EXISTS (SELECT
            'X'
          FROM stdstorage
          WHERE DESCRIPTION = iPartNumber
          AND STORAGEPARENT = xStockInsertNode) THEN


        CALL sprocSequenceGet('STOCK', 'STORAGENR', xStorageNr);
        INSERT INTO stdstorage (STORAGE
        , STORAGEPARENT
        , DESCRIPTION
        , RESPONSIBLE
        , ISSTORAGE
        , TYPE
        , GROUPS
        , PASSIV
        , YARDNUMBER
        , YARDLENGTH
        , YARDWIDTH
        , YARDHIGH
        , YARDMAXWEIGHT
        , PICKSORT
        , PARTARTIKELNO
        , PARTVARIANT
        , PARTARTIKELQTY
        , PARTARTIKELQTYUNIT
        , CHARGE
        , COSTCENTER
        , DELIVERYSTATION
        , BLOCKED
        , LOCATION
        , CUSTOMC01
        , CUSTOMC02
        , CUSTOMC03
        , CUSTOMC04
        , CUSTOMC05
        , CUSTOMN01
        , CUSTOMN02
        , CUSTOMN03
        , CUSTOMN04
        , CUSTOMN05
        , CUSTOMB01
        , CUSTOMB02
        , CUSTOMB03
        , CUSTOMB04
        , CUSTOMB05
        , CUSTOMGROUP01
        , CUSTOMGROUP02
        , CUSTOMGROUP03
        , CUSTOMGROUP04
        , CUSTOMGROUP05
        , LASTBOOKINGDATE
        , INVENTORYQUANTITY
        , INVENTORYDATE
        , ISWITHYARD
        , KOMMENTAR
        , STORAGENODETYPE
        , ESDATEADDED
        , ESDATEMODIFYED
        , ESUSRMODIFYED
        , ESUSRADDED
        , ESROWVERSION)
          VALUES (xStorageNr 
          , xStockInsertNode 
          , iPartNumber 
          , '' 
          , 0 
          , 'FIX' 
          , '' 
          , 0 
          , '' 
          , 0 
          , 0 
          , 0 
          , 0 
          , '' 
          , '' 
          , '' 
          , 0 
          , '' 
          , '' 
          , '' 
          , '' 
          , 0 
          , '' 
          , '' 
          , '' 
          , '' 
          , '' 
          , '' 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , 0 
          , '' 
          , '' 
          , '' 
          , '' 
          , '' 
          , NOW() 
          , 0 
          , NOW() 
          , 0 
          , iStorage 
          , '' 
          , NOW() 
          , NOW() 
          , '' 
          , '' 
          , 0 
          );
      ELSE
        SELECT
          STORAGE INTO xStorageNr
        FROM stdstorage
        WHERE DESCRIPTION = iPartNumber
        AND STORAGEPARENT = xStockInsertNode;
      END IF;

    
    ELSE

      
      SET xStorageNr = iStorage;

    END IF;
    
    
    UPDATE stdstorage
    SET PARTARTIKELQTY =
        CASE iBookType WHEN 'ADD' THEN PARTARTIKELQTY + xStockQuantityBooking WHEN 'SUB' THEN PARTARTIKELQTY + (ABS(xStockQuantityBooking) * -1) WHEN 'MUST' THEN xStockQuantityBooking END,
        ESROWVERSION = ESROWVERSION + 1,
        ESDATEMODIFYED = NOW(),
        ESUSRMODIFYED = iUserName
    WHERE STORAGE = xStorageNr;




    

    INSERT INTO sststoragetransaction (STORAGEB
    , PARTARTIKELNO
    , VARIANT
    , CHARGE
    , BOOKINGDATE
    , BOOKINGQUANTITY
    , BOOKINGKIND
    , STOREQUANTITYB
    , STOREQUANTITYA
    , BOOKINGPRICE
    , ESDATEADDED
    , ESDATEMODIFYED
    , ESUSRADDED
    , ESUSRMODIFYED
    , COMMENT
    , PROJECT
    , BOOKINGTYPE
    , BOOKINGNUMBER
    , BOOKINGPOS)
      SELECT
        iStorageYard,
        PARTARTIKELNO,
        PARTVARIANT,
        CHARGE,
        NOW(),
        CASE iBookType WHEN 'ADD' THEN xStockQuantityBooking WHEN 'SUB' THEN ABS(xStockQuantityBooking) * -1 WHEN 'MUST' THEN xStockQuantityBooking END,
        iBookType,
        xStockQuantityCurrent,
        PARTARTIKELQTY,
        iPrice,
        ESDATEADDED,
        ESDATEMODIFYED,
        ESUSRADDED,
        ESUSRMODIFYED,
        iComment,
        iProject,
        iBookingType,
        iBookingNumber,
        iBookingPos
      FROM stdstorage
      WHERE STORAGE = xStorageNr;


    
    
    
    
    IF (xParStockIsProject = 'Y') THEN
      DELETE
        FROM stdstorage
      WHERE STORAGE = xStorageNr
        AND PARTARTIKELQTY = 0;

      
      DELETE
        FROM stdstorage
      WHERE (SELECT
            COUNT(*)
          FROM stdstorage
          WHERE STORAGEPARENT = xStockInsertNode) = 0
        AND STORAGEPARENT = xStockProjectNode;

    ELSE

      
      UPDATE stdstorage s
      SET s.PARTARTIKELNO = ''
      WHERE s.TYPE = 'CHAOS'
      AND s.PARTARTIKELQTY = 0
      AND s.STORAGE = iStorage;

    END IF;

    SET oError = 'nothing';

  END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocStockBookWoStorage01
DROP PROCEDURE IF EXISTS `sprocStockBookWoStorage01`;
DELIMITER //
CREATE PROCEDURE `sprocStockBookWoStorage01`(
	IN `iBookType` varchar(10),
	IN `iPartNumber` varchar(125),
	IN `iQuantity` double,
	IN `iQuantityunit` varchar(10),
	IN `iStorage` varchar(50),
	IN `iStorageYard` varchar(50),
	IN `iProject` varchar(50),
	IN `iBookingType` varchar(10),
	IN `iBookingNumber` varbinary(20),
	IN `iBookingPos` int,
	IN `iComment` varchar(255),
	OUT `oError` varchar(255),
	IN `iPrice` double,
	IN `iBookingDate` datetime,
	IN `iUserName` varchar(25)

)
    MODIFIES SQL DATA
    DETERMINISTIC
    COMMENT 'Buchen Lagerbestand ohne FW'
sproc_leave:
  BEGIN

    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    
    DECLARE xPROJECTCOUNTNODES int DEFAULT 0;

    
    DECLARE xStockQuantityCurrent double DEFAULT 0;

    
    DECLARE xStockMain varchar(20) DEFAULT 'MAINSTOCK';

    
    DECLARE xParStockIsProject varchar(20) DEFAULT 'Y';

    
    DECLARE xStockQuantityBooking double DEFAULT 0;
    DECLARE xStockQuantityUnit varchar(20) DEFAULT 0;

    
    DECLARE xStockPriceCurrent double DEFAULT 0;

    
    
    DECLARE xStockDateCurrent datetime DEFAULT DATE(CURDATE());

    
    
    DECLARE xStockDateTakeingCurrent datetime DEFAULT DATE(CURDATE());

    
    DECLARE xStockStorage varchar(50) DEFAULT xStockMain;
    DECLARE xStockStorageYards varchar(50) DEFAULT '';


    
    DECLARE xStockStorageNode int DEFAULT 0;
    DECLARE xStockProjectNode int DEFAULT 0;
    DECLARE xStockInsertNode int DEFAULT 0;

    
    DECLARE xStorageNr int DEFAULT 0;

    
    DECLARE xStorageNodeType varchar(20) DEFAULT '';

    SELECT
      s.STORAGE INTO xStockStorageNode
    FROM stdstorage s
    WHERE STORAGEPARENT = 0
    AND s.STORAGENODETYPE = 'STORAGE';
    SELECT
      s.STORAGE INTO xStockProjectNode
    FROM stdstorage s
    WHERE STORAGEPARENT = 0
    AND s.STORAGENODETYPE = 'PROJECT';

    
    CALL sprocParameterGet(iUserName, 'STOCK', 2, xStockMain);

    
    IF IFNULL(iStorage, '') = '' THEN
      CALL sprocParameterGet(iUserName, 'STOCK', 4, iStorage);
    END IF;
      

    
    
    
    

    
    SELECT
      IFNULL(SUM(s.PARTARTIKELQTY), 0) INTO xStockQuantityCurrent
    FROM stdstorage s
    WHERE 1 = 1
    AND s.PARTARTIKELNO = iPartNumber
    AND s.STORAGEPARENT = xStockStorageNode
    AND s.Description = iStorage;

    
    
    SET xStockQuantityBooking = ABS(iQuantity);

    
    SET xStockPriceCurrent = iPrice;
    IF IFNULL(xStockPriceCurrent,0) = 0 THEN
      SELECT
        s.PARTPRICE INTO xStockPriceCurrent
      FROM stdparts s
      WHERE 1 = 1
      AND s.PARTARTIKELNO = iPartNumber;
    END IF;

    
    

    
    IF iProject = xStockMain THEN
      
      SET xStockInsertNode = xStockStorageNode;
      SET xStorageNr = xStockStorageNode;
      SET xStorageNodeType = 'STORAGE';
    ELSE
      
      SET xStockInsertNode = xStockProjectNode;
      SET xStorageNodeType = 'PROJECT';
    END IF;


IF iProject != xStockMain THEN
  

    
    IF NOT EXISTS (SELECT
          'X'
        FROM stdstorage
        WHERE DESCRIPTION = iPROJECT AND STORAGEPARENT = xStockInsertNode) THEN

      CALL sprocSequenceGet('STOCK', 'STORAGENR', xStorageNr);

      INSERT INTO stdstorage (STORAGE
      , STORAGEPARENT
      , DESCRIPTION
      , RESPONSIBLE
      , ISSTORAGE
      , TYPE
      , GROUPS
      , PASSIV
      , YARDNUMBER
      , YARDLENGTH
      , YARDWIDTH
      , YARDHIGH
      , YARDMAXWEIGHT
      , PICKSORT
      , PARTARTIKELNO
      , PARTVARIANT
      , PARTARTIKELQTY
      , PARTARTIKELQTYUNIT
      , CHARGE
      , COSTCENTER
      , DELIVERYSTATION
      , BLOCKED
      , LOCATION
      , CUSTOMC01
      , CUSTOMC02
      , CUSTOMC03
      , CUSTOMC04
      , CUSTOMC05
      , CUSTOMN01
      , CUSTOMN02
      , CUSTOMN03
      , CUSTOMN04
      , CUSTOMN05
      , CUSTOMB01
      , CUSTOMB02
      , CUSTOMB03
      , CUSTOMB04
      , CUSTOMB05
      , CUSTOMGROUP01
      , CUSTOMGROUP02
      , CUSTOMGROUP03
      , CUSTOMGROUP04
      , CUSTOMGROUP05
      , LASTBOOKINGDATE
      , INVENTORYQUANTITY
      , INVENTORYDATE
      , ISWITHYARD
      , KOMMENTAR
      , STORAGENODETYPE
      , ESDATEADDED
      , ESDATEMODIFYED
      , ESUSRMODIFYED
      , ESUSRADDED
      , ESROWVERSION)
        VALUES (xStorageNr 
        , xStockInsertNode 
        , iProject 
        , '' 
        , 1 
        , 'FIX' 
        , '' 
        , 0 
        , '' 
        , 0 
        , 0 
        , 0 
        , 0 
        , '' 
        , '' 
        , '' 
        , 0 
        , '' 
        , '' 
        , '' 
        , '' 
        , 0 
        , '' 
        , '' 
        , '' 
        , '' 
        , '' 
        , '' 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , '' 
        , '' 
        , '' 
        , '' 
        , '' 
        , NOW() 
        , 0 
        , NOW() 
        , 0 
        , '' 
        , '' 
        , NOW() 
        , NOW() 
        , '' 
        , '' 
        , 0 
        );
        SET xStockInsertNode = xStorageNr;
    ELSE
      SELECT
        STORAGE INTO xStockInsertNode
      FROM stdstorage
      WHERE DESCRIPTION = iPROJECT AND STORAGEPARENT = xStockInsertNode;
    END IF;

END IF;

    
    IF NOT EXISTS (SELECT
          'X'
        FROM stdstorage
        WHERE PARTARTIKELNO = iPartNumber
        AND STORAGEPARENT = xStockInsertNode AND DESCRIPTION = iStorage) THEN


      CALL sprocSequenceGet('STOCK', 'STORAGENR', xStorageNr);
      INSERT INTO stdstorage (STORAGE
      , STORAGEPARENT
      , DESCRIPTION
      , RESPONSIBLE
      , ISSTORAGE
      , TYPE
      , GROUPS
      , PASSIV
      , YARDNUMBER
      , YARDLENGTH
      , YARDWIDTH
      , YARDHIGH
      , YARDMAXWEIGHT
      , PICKSORT
      , PARTARTIKELNO
      , PARTVARIANT
      , PARTARTIKELQTY
      , PARTARTIKELQTYUNIT
      , CHARGE
      , COSTCENTER
      , DELIVERYSTATION
      , BLOCKED
      , LOCATION
      , CUSTOMC01
      , CUSTOMC02
      , CUSTOMC03
      , CUSTOMC04
      , CUSTOMC05
      , CUSTOMN01
      , CUSTOMN02
      , CUSTOMN03
      , CUSTOMN04
      , CUSTOMN05
      , CUSTOMB01
      , CUSTOMB02
      , CUSTOMB03
      , CUSTOMB04
      , CUSTOMB05
      , CUSTOMGROUP01
      , CUSTOMGROUP02
      , CUSTOMGROUP03
      , CUSTOMGROUP04
      , CUSTOMGROUP05
      , LASTBOOKINGDATE
      , INVENTORYQUANTITY
      , INVENTORYDATE
      , ISWITHYARD
      , KOMMENTAR
      , STORAGENODETYPE
      , ESDATEADDED
      , ESDATEMODIFYED
      , ESUSRMODIFYED
      , ESUSRADDED
      , ESROWVERSION)
        VALUES (xStorageNr 
        , xStockInsertNode 
        , iStorage 
        , '' 
        , 0 
        , 'FIX' 
        , '' 
        , 0 
        , '' 
        , 0 
        , 0 
        , 0 
        , 0 
        , '' 
        , iPartNumber 
        , '' 
        , 0 
        , '' 
        , '' 
        , '' 
        , '' 
        , 0 
        , '' 
        , '' 
        , '' 
        , '' 
        , '' 
        , '' 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , 0 
        , '' 
        , '' 
        , '' 
        , '' 
        , '' 
        , NOW() 
        , 0 
        , NOW() 
        , 0 
        , iStorage 
        , xStorageNodeType 
        , NOW() 
        , NOW() 
        , '' 
        , '' 
        , 0 
        );
    ELSE
      SELECT
        STORAGE INTO xStorageNr
      FROM stdstorage
      WHERE PARTARTIKELNO = iPartNumber
      AND STORAGEPARENT = xStockInsertNode
      AND Description = iStorage ;
    END IF;

    

    
    
    UPDATE stdstorage
    SET PARTARTIKELQTY =
        CASE iBookType WHEN 'ADD' THEN PARTARTIKELQTY + xStockQuantityBooking WHEN 'SUB' THEN PARTARTIKELQTY + (ABS(xStockQuantityBooking) * -1) WHEN 'MUST' THEN xStockQuantityBooking END,
        ESROWVERSION = ESROWVERSION + 1,
        ESDATEMODIFYED = NOW(),
        ESUSRMODIFYED = iUserName
    WHERE STORAGE = xStorageNr;


    

    INSERT INTO sststoragetransaction (
      STORAGEA
    , PARTARTIKELNO
    , VARIANT
    , CHARGE
    , BOOKINGDATE
    , BOOKINGQUANTITY
    , BOOKINGKIND
    , STOREQUANTITYB
    , STOREQUANTITYA
    , BOOKINGPRICE
    , ESDATEADDED
    , ESDATEMODIFYED
    , ESUSRADDED
    , ESUSRMODIFYED
    , COMMENT
    , PROJECT
    , BOOKINGTYPE
    , BOOKINGNUMBER
    , BOOKINGPOS)
      SELECT
        iStorage,
        PARTARTIKELNO,
        PARTVARIANT,
        CHARGE,
        NOW(),
        CASE iBookType WHEN 'ADD' THEN xStockQuantityBooking WHEN 'SUB' THEN ABS(xStockQuantityBooking) * -1 WHEN 'MUST' THEN xStockQuantityBooking END,
        iBookType,
        xStockQuantityCurrent,
        PARTARTIKELQTY,
        iPrice,
        ESDATEADDED,
        ESDATEMODIFYED,
        ESUSRADDED,
        ESUSRMODIFYED,
        iComment,
        iProject,
        iBookingType,
        iBookingNumber,
        iBookingPos
      FROM stdstorage
      WHERE STORAGE = xStorageNr;


    
    
    
    
    IF (xParStockIsProject = 'Y') THEN
      DELETE
        FROM stdstorage
      WHERE STORAGE = xStorageNr
        AND PARTARTIKELQTY = 0;
    END IF;


    
    DELETE FROM stdstorage WHERE (SELECT COUNT(*) FROM stdstorage WHERE STORAGEPARENT = xStockInsertNode) = 0 AND STORAGEPARENT = xStockProjectNode AND DESCRIPTION = iProject;

    SET oError = 'nothing';

  END//
DELIMITER ;

-- Exportiere Struktur von Prozedur sso_dev.sprocupdatebomproject
DROP PROCEDURE IF EXISTS `sprocupdatebomproject`;
DELIMITER //
CREATE PROCEDURE `sprocupdatebomproject`(IN $PROJECTNUMBER VARCHAR(50))
BEGIN

DECLARE $PARTNUMBER varchar(128);

SELECT s.PROJECTPARTNO INTO $PARTNUMBER  from sstprojects s where s.PROJECTNR = $PROJECTNUMBER LIMIT 1;


DROP TABLE IF EXISTS `MYINSERT`;
CREATE TEMPORARY TABLE MYINSERT(BOMTABLEID INT,XLEVEL INT, XPATHPART VARCHAR(1024),XBOMSTATUS varchar(10));


INSERT INTO MYINSERT(BOMTABLEID,XLEVEL,XPATHPART,XBOMSTATUS)

WITH RECURSIVE bom_cte (
 BOMHEADERID
,BOMPOSID
,BOMTABLEID
,XBRUTTOQT
,XPATH
,XPOS
,XPATHPART
,XLEVEL
,XBOMSTATUS
) AS
(
  SELECT
    sstbomproject.BOMHEADERID
	,sstbomproject.BOMPOSID
	,sstbomproject.BOMTABLEID
   ,CAST(sstbomproject.BOMQUANTITY AS DOUBLE)
   ,CAST(LPAD(sstbomproject.BOMPOS ,4,'0') AS CHAR(100))
   ,CAST(sstbomproject.BOMPOS AS CHAR(100))
   ,CAST(CONCAT(sstbomproject.BOMHEADERNO,'þ',sstbomproject.BOMPOSNO) AS  CHAR(1024))
   ,1 AS xlevel
   ,IFNULL(sstbomproject.BOMPOSSTATUS,'')
  FROM sstbomproject WHERE sstbomproject.BOMHEADERNO = $PARTNUMBER AND sstbomproject.BOMPROJECT = $PROJECTNUMBER
    UNION ALL
  SELECT 
     bom.BOMHEADERID
   	,bom.BOMPOSID
   	,bom.BOMTABLEID
   	,cte.xbruttoqt * bom.BOMQUANTITY
  	,CONCAT(cte.xpath,'.',LPAD(bom.BOMPOS,4,'0'))
  	,CONCAT(cte.xpos,'.',bom.BOMPOS)
  	,CONCAT(cte.xpathpart,'þ',bom.BOMPOSNO)
   	,cte.xlevel + 1
    
    ,IF (IFNULL(cte.XBOMSTATUS,'') = '',
        bom.BOMPOSSTATUS,cte.XBOMSTATUS)

   
    
    FROM sstbomproject AS bom, bom_cte AS cte WHERE cte.BOMPOSID = bom.BOMHEADERID AND bom.BOMPROJECT = $PROJECTNUMBER
)
SELECT BOMTABLEID,XLEVEL,XPATHPART,XBOMSTATUS FROM bom_cte;


UPDATE sstbomproject p
INNER JOIN MYINSERT i ON p.BOMTABLEID = i.BOMTABLEID
SET p.BOMPATHTREEBEFORE = p.BOMPATHTREE
   ,p.BOMPATHTREE = i.XPATHPART
   ,p.BOMLEVEL = i.XLEVEL
   ,p.BOMPOSSTATUS = i.XBOMSTATUS
  ;

  
  SELECT * FROM MYINSERT i
  WHERE NOT EXISTS(SELECT 'x' FROM sstbomproject s WHERE s.BOMPROJECT=$PROJECTNUMBER AND s.BOMPATHTREE=i.XPATHPART AND IFNULL(s.BOMPOSSTATUS, '') != 'MISSING');
END//
DELIMITER ;

-- Exportiere Struktur von Funktion sso_dev.fcEasterSunday
DROP FUNCTION IF EXISTS `fcEasterSunday`;
DELIMITER //
CREATE FUNCTION `fcEasterSunday`(inYear YEAR) RETURNS date
    DETERMINISTIC
BEGIN
   








    DECLARE a, b, c, d, e, f, g, h, i, k, l, m, n, p INT;

    DECLARE es DATE;

    SET a = MOD(inYear, 19);
    SET b = FLOOR(inYear / 100);
    SET c = MOD(inYear, 100);
    SET d = FLOOR(b / 4);
    SET e = MOD(b, 4);
    SET f = FLOOR((b + 8) / 25);
    SET g = FLOOR((b - f + 1) / 3);
    SET h = MOD((19 * a + b - d - g + 15), 30);
    SET i = FLOOR(c / 4);
    SET k = MOD(c, 4);
    SET l = MOD((32 + 2 * e + 2 * i - h - k), 7);
    SET m = FLOOR((a + 11 * h + 22 * l) / 451);
    SET n = FLOOR((h + l - 7 * m + 114) / 31);
    SET p = MOD((h + l - 7 * m + 114), 31) + 1;

    SET es = CONCAT_WS('-', inYear, n, p);

    RETURN es;
END//
DELIMITER ;

-- Exportiere Struktur von Funktion sso_dev.fcHLPCHANGETONET
DROP FUNCTION IF EXISTS `fcHLPCHANGETONET`;
DELIMITER //
CREATE FUNCTION `fcHLPCHANGETONET`(iVALUETYPE VARCHAR(200)) RETURNS varchar(200) CHARSET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci
    NO SQL
    COMMENT 'Ändert Wertyp in Nettyp'
BEGIN
DECLARE RESULT varchar(200) DEFAULT iVALUETYPE;

 
CASE iVALUETYPE 

WHEN 'VARCHAR' THEN SET RESULT = 'string';
WHEN 'CHAR'    THEN SET RESULT = 'string';
WHEN 'TEXT'    THEN SET RESULT = 'string';
WHEN 'mediumtext'    THEN SET RESULT = 'string';

WHEN 'date'    THEN SET RESULT = 'DateTime';
WHEN 'datetime'    THEN SET RESULT = 'DateTime';

WHEN 'bit' THEN SET RESULT = 'bool';

ELSE SET RESULT = iVALUETYPE;

END CASE;

RETURN RESULT;

END//
DELIMITER ;

-- Exportiere Struktur von Funktion sso_dev.fcHLPCHANGETOPASCALCASE
DROP FUNCTION IF EXISTS `fcHLPCHANGETOPASCALCASE`;
DELIMITER //
CREATE FUNCTION `fcHLPCHANGETOPASCALCASE`(SSOCOLUMNNAME VARCHAR(200)) RETURNS varchar(200) CHARSET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci
    DETERMINISTIC
BEGIN

DECLARE xNew VARCHAR(200);
 SET xNew = CONCAT(UPPER(SUBSTRING(SSOCOLUMNNAME,1,1)),LOWER(SUBSTRING(SSOCOLUMNNAME,2)));
 RETURN xNew;
 
END//
DELIMITER ;

-- Exportiere Struktur von Funktion sso_dev.ISNUMERIC
DROP FUNCTION IF EXISTS `ISNUMERIC`;
DELIMITER //
CREATE FUNCTION `ISNUMERIC`(inputValue varchar(50)) RETURNS int(11)
BEGIN
  IF (inputValue REGEXP ('^[0-9]+$')) THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END//
DELIMITER ;

-- Exportiere Struktur von Ereignis sso_dev.CLEARLOGTABLE
DROP EVENT IF EXISTS `CLEARLOGTABLE`;
DELIMITER //
CREATE EVENT `CLEARLOGTABLE` ON SCHEDULE EVERY 1 DAY STARTS '2021-08-17 23:59:00' ON COMPLETION PRESERVE DISABLE DO BEGIN
  TRUNCATE TABLE sytlog;
  INSERT INTO sytlog(APPLICATION,LOGGED,USERNAME,LEVEL ,MESSAGE)
    VALUES
           ('SYSTEM' 
           ,NOW() 
           ,'SYTEM' 
           ,'INFO' 
           ,'Cleared logtable by event');
 END//
DELIMITER ;

-- Exportiere Struktur von Trigger sso_dev.trg_BDENOInsertHdr
DROP TRIGGER IF EXISTS `trg_BDENOInsertHdr`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER trg_BDENOInsertHdr
BEFORE INSERT
ON sstwroheader
FOR EACH ROW
BEGIN

  
  
  
  
  
  
  

  
  DECLARE xWithBde varchar(10) DEFAULT 'Y';
  
  DECLARE xBdeNo varchar(10) DEFAULT 0;

  
  CALL sprocParameterGet('DEFAULT', 'SSO', 60, xWithBde);

  IF xWithBde = 'Y' THEN
    CALL sprocSequenceGetOT('PROD', 'BDE', xBdeNo);
    SET NEW.WROBDENR = xBdeNo;
  END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Exportiere Struktur von Trigger sso_dev.trg_BDENOInsertPos
DROP TRIGGER IF EXISTS `trg_BDENOInsertPos`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER trg_BDENOInsertPos
	BEFORE INSERT
	ON sstwropos
	FOR EACH ROW
BEGIN
   
    
    
    
    
    
    

  
    DECLARE xWithBde varchar(10) DEFAULT 'Y';
      
    DECLARE xBdeNo varchar(10) DEFAULT 0;

  
    CALL sprocParameterGet('DEFAULT', 'SSO', 60, xWithBde);

    IF xWithBde = 'Y' THEN
       CALL sprocSequenceGetOT('PROD', 'BDE', xBdeNo);
      set NEW.WROBDENR = xBdeNo;
    END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Exportiere Struktur von Trigger sso_dev.WF14
DROP TRIGGER IF EXISTS `WF14`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER WF14
AFTER INSERT
   ON stdparts FOR EACH ROW

BEGIN


INSERT INTO sytworkflow
(
  WFNUMBER
 ,WFDESCRIPTION
 ,WFTEXT
 ,WFUSERS
 ,WFGROUPS
 ,WFREFERENCE
 ,WFCATEGORY
 ,WFCALLBACK
 ,WFCALLBACKKEY
 ,WFCALLBACKDATE
 , WFSTATUS

)
VALUES
(
  14
 ,'Beschreibung Workflow 1'
 ,''
 ,'MaxMusterman'
 ,'USER01'
 ,''
 ,''
 ,''
 ,'' 
 ,NOW()
 ,'NEW'
);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Exportiere Struktur von View sso_dev.viewdisposearch
DROP VIEW IF EXISTS `viewdisposearch`;
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `viewdisposearch`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewdisposearch` AS select distinct `s`.`DISPROJECTNO` AS `DISPROJECTNO`,`s3`.`PROJECTNAME` AS `PROJECTNAME`,`s1`.`BUSADDRESS1` AS `DISVENDOR`,`s1`.`BUSCONTACTNAME` AS `BUSCONTACTNAME`,`s`.`DISFOREIGNREF01` AS `DISFOREIGNREF01`,`s`.`DISFOREIGNREF02` AS `DISFOREIGNREF02`,`s`.`DISFOREIGNREF03` AS `DISFOREIGNREF03`,`s`.`DISFOREIGNREF04` AS `DISFOREIGNREF04`,`s`.`DISORDERNO` AS `DISORDERNO` from ((`sso_dev`.`sstdispartproof` `s` left join `sso_dev`.`stdbusaccount` `s1` on(`s`.`DISVENDOR` = `s1`.`BUSBUSINESSNO`)) left join `sso_dev`.`sstprojects` `s3` on(`s`.`DISPROJECTNO` = `s3`.`PROJECTNR`)) where `s3`.`PROJECTSTATUS` = 'WORK' or `s3`.`PROJECTSTATUS` = 'OPEN' ;

-- Exportiere Struktur von View sso_dev.viewpuoposstat01
DROP VIEW IF EXISTS `viewpuoposstat01`;
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `viewpuoposstat01`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewpuoposstat01` AS select `sso_dev`.`sstpuopos`.`ORDERNO` AS `ORDERNO`,`sso_dev`.`sstpuopos`.`COMMISSION` AS `COMMISSION`,`sso_dev`.`sstpuoheader`.`BUSINESSNO` AS `BUSINESSNO`,`sso_dev`.`sstpuoheader`.`BUSCOMPANY` AS `BUSCOMPANY`,`sso_dev`.`sstpuoheader`.`BUSADDRESS1` AS `BUSADDRESS1`,`sso_dev`.`sstpuopos`.`SALESPRICE` AS `SALESPRICE`,`sso_dev`.`sstpuopos`.`ORDERQTY` AS `QUANTITY`,`sso_dev`.`stdlookup`.`SDLOOKINTERN` AS `SDLOOKINTERN`,`sso_dev`.`sstpuopos`.`REQUESTEDDELIVERYDAY` AS `REQUESTEDDELIVERYDAY`,`sso_dev`.`stdcalender`.`CAYEAR` AS `CAYEAR`,concat(`sso_dev`.`stdcalender`.`CAYEAR`,'.',lpad(`sso_dev`.`stdcalender`.`CAWEEK`,2,'0')) AS `CAWEEK`,concat(`sso_dev`.`stdcalender`.`CAYEAR`,'.',lpad(`sso_dev`.`stdcalender`.`CAQUATER`,2,'0')) AS `CAQUARTER` from (((`sso_dev`.`sstpuopos` left join `sso_dev`.`sstpuoheader` on(`sso_dev`.`sstpuopos`.`ORDERNO` = `sso_dev`.`sstpuoheader`.`ORDERNO`)) left join `sso_dev`.`stdcalender` on(`sso_dev`.`sstpuopos`.`REQUESTEDDELIVERYDAY` = `sso_dev`.`stdcalender`.`CAFULLDATE`)) left join `sso_dev`.`stdlookup` on(`sso_dev`.`stdlookup`.`SDLOOKTYPE` = 'PURORDERSTAT' and `sso_dev`.`stdlookup`.`SDLOOKKEY` = `sso_dev`.`sstpuopos`.`STATUS`)) where `sso_dev`.`sstpuoheader`.`ORDERTYPE` = 'PURORDER' and `sso_dev`.`sstpuoheader`.`STATUS` <> 'DEL' ;

-- Exportiere Struktur von View sso_dev.viewsalesorderstat01
DROP VIEW IF EXISTS `viewsalesorderstat01`;
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `viewsalesorderstat01`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewsalesorderstat01` AS select `p`.`ORDERNO` AS `ORDERNO`,`p`.`COMMISSION` AS `COMMISSION`,`s`.`BUSINESSNO` AS `BUSINESSNO`,`b`.`BUSCOMPANY` AS `BUSCOMPANY`,`b`.`BUSADDRESS1` AS `BUSADDRESS1`,`p`.`SALESPRICE` AS `SALESPRICE`,`p`.`ORDERQUANTITY` AS `QUANTITY`,`l`.`SDLOOKINTERN` AS `SDLOOKINTERN`,`p`.`REQUESTEDDELIVERYDAY` AS `REQUESTEDDELIVERYDAY`,`c`.`CAYEAR` AS `CAYEAR`,concat(`c`.`CAYEAR`,'.',lpad(`c`.`CAWEEK`,2,'0')) AS `CAWEEK`,concat(`c`.`CAYEAR`,'.',lpad(`c`.`CAQUATER`,2,'0')) AS `CAQUARTER` from ((((`sso_dev`.`sstsalesorderpos` `p` left join `sso_dev`.`sstsalesorder` `s` on(`p`.`ORDERNO` = `s`.`ORDERNO`)) left join `sso_dev`.`stdbusaccount` `b` on(`b`.`BUSBUSINESSNO` = `s`.`BUSINESSNO`)) left join `sso_dev`.`stdcalender` `c` on(`p`.`REQUESTEDDELIVERYDAY` = `c`.`CAFULLDATE`)) left join `sso_dev`.`stdlookup` `l` on(`l`.`SDLOOKTYPE` = 'SALORDERSTAT' and `l`.`SDLOOKKEY` = `p`.`STATUS`)) where `s`.`STATUS` <> 'DEL' ;

-- Exportiere Struktur von View sso_dev.viewstockstat01
DROP VIEW IF EXISTS `viewstockstat01`;
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `viewstockstat01`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewstockstat01` AS select `s`.`DESCRIPTION` AS `Fach`,`s`.`RESPONSIBLE` AS `Verantwortlich`,`s`.`LOCATION` AS `Standort`,`s`.`PARTARTIKELNO` AS `Artikelnummer`,`s`.`PARTARTIKELQTY` AS `Menge`,`s1`.`PARTPRICE` AS `Einzelpreis`,`s1`.`PARTPRICE` * `s`.`PARTARTIKELQTY` AS `Preis` from (`sso_dev`.`stdstorage` `s` left join `sso_dev`.`stdparts` `s1` on(`s`.`PARTARTIKELNO` = `s1`.`PARTARTIKELNO`)) ;

-- Exportiere Struktur von View sso_dev.viewvariantsearchkcw
DROP VIEW IF EXISTS `viewvariantsearchkcw`;
-- Entferne temporäre Tabelle und erstelle die eigentliche View
DROP TABLE IF EXISTS `viewvariantsearchkcw`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `viewvariantsearchkcw` AS select distinct `l`.`PARTSARTIKELNO` AS `PARTSARTIKELNO`,`l`.`ATTDEFNO` AS `BLaenge`,`l`.`VALUE01` AS `Laenge`,`f`.`ATTDEFNO` AS `BFarbe`,`f`.`VALUE01` AS `Farbe`,`a`.`ATTDEFNO` AS `B_AD`,`a`.`VALUE01` AS `AD`,`i`.`ATTDEFNO` AS `B_ID`,`i`.`VALUE01` AS `ID`,`w`.`ATTDEFNO` AS `BWandstaerke`,`w`.`VALUE01` AS `Wandstaerke` from (((((`sso_dev`.`stdpartsattrib` `o` join `sso_dev`.`stdpartsattrib` `l` on(`o`.`PARTSARTIKELNO` = `l`.`PARTSARTIKELNO` and `l`.`ATTDEFNO` = 'LA')) join `sso_dev`.`stdpartsattrib` `f` on(`o`.`PARTSARTIKELNO` = `f`.`PARTSARTIKELNO` and `f`.`ATTDEFNO` = 'FA')) join `sso_dev`.`stdpartsattrib` `a` on(`o`.`PARTSARTIKELNO` = `a`.`PARTSARTIKELNO` and `a`.`ATTDEFNO` = 'AD')) join `sso_dev`.`stdpartsattrib` `i` on(`o`.`PARTSARTIKELNO` = `i`.`PARTSARTIKELNO` and `i`.`ATTDEFNO` = 'ID')) join `sso_dev`.`stdpartsattrib` `w` on(`o`.`PARTSARTIKELNO` = `w`.`PARTSARTIKELNO` and `w`.`ATTDEFNO` = 'WS')) ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
