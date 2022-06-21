/************************************************************************
   EJECUTAR ESTE SCRIP PARA CREAR LA BD PARA LA UNIDAD DE APRENDIZAJE 2
------------------------------------------------------------------------*/
USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'IdentificaPagos')
  DROP DATABASE [IdentificaPagos]   
GO

/***************************************
   BASE DE DATOS
--------------------------------------*/
USE master
GO

CREATE DATABASE [IdentificaPagos]
GO

USE IdentificaPagos
GO
--Tablas funcionales
CREATE TABLE dbo.Banco (
BancoID tinyint IDENTITY(1,1) NOT NULL CONSTRAINT PK_Banco PRIMARY KEY,
NombreBanco varchar(100) NOT NULL,
SiglaBanco varchar(5) NOT NULL)

CREATE TABLE dbo.CuentaBancaria (
CuentaBancariaID smallint IDENTITY(1,1) NOT NULL CONSTRAINT PK_CuentaBancaria PRIMARY KEY,
NombreCuenta varchar(100) NOT NULL,
NumeroCuenta varchar(100) NOT NULL,
MonedaCuenta char(3) NOT NULL,
BancoID tinyint NOT NULL)

ALTER TABLE dbo.CuentaBancaria 
ADD CONSTRAINT FK_Banco_CuentaBancaria
FOREIGN KEY(BancoID) 
REFERENCES dbo.Banco(BancoID)

CREATE TABLE dbo.MovimientoBancario (
MovimientoBancarioID int IDENTITY(1,1) NOT NULL,
CuentaBancariaID smallint NOT NULL,
FechaProceso date NOT NULL, 
FechaMovimiento date NOT NULL,
MontoMovimiento decimal (15, 2) NOT NULL,
NumeroOperacion varchar (100) NOT NULL)

ALTER TABLE dbo.MovimientoBancario 
ADD CONSTRAINT PK_MovimientoBancario 
PRIMARY KEY (MovimientoBancarioID)

ALTER TABLE dbo.MovimientoBancario 
ADD CONSTRAINT FK_CuentaBancaria_MovimientoBancario
FOREIGN KEY(CuentaBancariaID) 
REFERENCES dbo.CuentaBancaria(CuentaBancariaID)

CREATE TABLE dbo.TipoPago (
TipoPagoID tinyint IDENTITY(1,1) NOT NULL CONSTRAINT PK_TipoPago PRIMARY KEY,
NombreTipoPago varchar(100) NOT NULL)

