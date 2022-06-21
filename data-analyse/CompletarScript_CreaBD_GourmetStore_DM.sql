/* Script para desplegar la base de datos dimensional
GourmetStore_DM
*/
USE master;

CREATE DATABASE GourmetStore_DM;
go

USE GourmetStore_DM;

-- Creación de la tabla de dimensión ProductoDIM
CREATE TABLE ProductoDIM(
	skProducto integer IDENTITY(1,1) PRIMARY KEY,
	idProducto integer not null,
	nomProducto nvarchar(50) not null,
	presentacion nvarchar(30) not null,
	precioUnitario money not null,
	skCategoria integer not null,
	nomCategoria nvarchar(25) not null );


