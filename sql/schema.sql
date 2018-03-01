# Schema for saving

CREATE DATABASE IF NOT EXISTS Chrono ;
USE Chrono;

DROP TABLE IF EXISTS T_Marques;
CREATE TABLE T_Marques
(
	id				INT UNSIGNED			NOT NULL PRIMARY KEY AUTO_INCREMENT,
	nom			VARCHAR(40)			NOT NULL UNIQUE
);

DROP TABLE IF EXISTS T_Concurrents;
CREATE TABLE T_Concurrents
(
	id				BIGINT UNSIGNED			NOT NULL PRIMARY KEY AUTO_INCREMENT,
	numero		INT UNSIGNED 				NOT NULL,
	nom			VARCHAR(80)				NOT NULL,
	prenom		VARCHAR(80)				NOT NULL,
	moto			INT UNSIGNED				,
	npa			VARCHAR(10)				,
	ville			VARCHAR(80)				,
	adresse		TINYTEXT						,
	pays			CHAR(3)						,
	telephone	VARCHAR(20)				,
	urgence		TINYTEXT						,
	bithday		DATE							,
	licences		TINYTEXT						,
	remarques	TEXT
);

# Liste pays iso
#DROP TABLE IF EXISTS T_Pays;
CREATE TABLE IF NOT EXISTS   T_Pays
(
	id				CHAR(3)						NOT NULL PRIMARY KEY,
	numero		INT							,
	nom			VARCHAR(100)			,
	display		BIT(1) 						NOT NULL DEFAULT FALSE

);

# Liste Code postal
#DROP TABLE IF EXISTS Chrono.T_Ville;
CREATE TABLE IF NOT EXISTS   Chrono.T_Ville
(
	id				CHAR(3)						NOT NULL,
	nom			VARCHAR(50)				NOT NULL,
	npa			VARCHAR(10)				NOT NULL,
	canton		VARCHAR(50)				NOT NULL

);
