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




-- 1. Procedimiento almacenado de inserción de datos en la tabla Banco.

CREATE  PROCEDURE InsertBanco
@NombreBanco	varchar(100),
@SiglaBanco	varchar(5)
AS 

INSERT INTO Banco(NombreBanco,SiglaBanco)
VALUES(@NombreBanco,@SiglaBanco)
GO

EXEC InsertBanco 'Banco Bilbao Vizcaya Argentaria','BBVA'
EXEC InsertBanco 'Banco de Credito','BCP'
EXEC InsertBanco 'Banco Pichincha','BP'


-- 2. Procedimiento almacenado de inserción de datos en la tabla CuentaBancaria.

CREATE PROCEDURE InsertCuentabancaria
@NombreCuenta	varchar(100),
@NumeroCuenta	varchar(100),
@MonedaCuenta	char(3),
@BancoID	tinyint
AS

INSERT INTO CuentaBancaria(NombreCuenta,NumeroCuenta,MonedaCuenta,BancoID)
VALUES(@NombreCuenta,@NumeroCuenta,@MonedaCuenta,@BancoID)
GO

EXEC InsertCuentabancaria 'Tarjeta de debito','198324823432','Soles',1
EXEC InsertCuentabancaria 'Tarjeta de credito','19938345434534','Dolar',1
EXEC InsertCuentabancaria 'Tarjeta de debito','00190084234534','Soles',2
GO

-- 3. Procedimiento almacenado de inserción de datos en la tabla TipoPago.

CREATE PROCEDURE Insertpago
@NombreTipoPago	varchar(100)
AS

INSERT INTO TipoPago(NombreTipoPago)
VALUES(@NombreTipoPago)
GO

EXEC Insertpago 'Tranferencia Bancaria'
EXEC Insertpago 'Pago en Efectivo'
EXEC Insertpago 'Tarjeta credito'


-- inserte registros directamente con el comando INSERT INTO en la tabla MovimientoBancario y 
-- cree un procedimiento almacenado que consulte los movimientos bancarios. La consulta debe unir 
-- (INNER JOIN) la tabla MovimientoBancario con las demás tablas, para mostrar el nombre del banco,
--- el nombre de la cuenta bancaria y el nombre del tipo de pago.

SELECT *FROM MovimientoBancario;

INSERT INTO MovimientoBancario(CuentaBancariaID,FechaProceso,FechaMovimiento,MontoMovimiento,NumeroOperacion)
VALUES(1,'20200405','20200408',12000,'1000000'),
      (1,'20200708','20200709',15000,'1000001'),
	  (2,'20200101','20200606',18000,'1000002');



SELECT *FROM MovimientoBancario mb 
INNER JOIN CuentaBancaria cb 
ON mb.CuentaBancariaID = cb.CuentaBancariaID
INNER JOIN Banco b 
ON cb.BancoID = b.BancoID
GO
