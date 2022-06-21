/***********************************************************
   RESOLVER EL EXAMEN AL FINAL DE ESTE SCRIPT
--------------------------------------*/
USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'IdentificaPagos')
  DROP DATABASE [IdentificaPagos]   
GO

/***********************************************************
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
GO




/***********************************************************
   INICIAR LA SOLUCION DEL EXAMEN DESDE AQUI
--------------------------------------*/
-- En la base de datos creada, desarrolle lo siguiente:
-- 1. Ingrese por lo menos tres registros en cada tabla

INSERT INTO Banco(NombreBanco,SiglaBanco)
VALUES('Banco Pichincha', 'BPP'),
      ('Banco de Credito','BCP'),
	  ('Banco SCOTIABANK','SC');

INSERT INTO CuentaBancaria(NombreCuenta,NumeroCuenta,MonedaCuenta,BancoID)
VALUES('Tarjeta de debito','198324823432','Sol',1),
      ('Tarjeta de credito','19938345434534','Dol',1),
	  ('Tarjeta de debito','00190084234534','Sol',2);


INSERT INTO MovimientoBancario(CuentaBancariaID,FechaProceso,FechaMovimiento,MontoMovimiento,NumeroOperacion)
VALUES(1,'20200405','20200408',12000,'1000000'),
      (1,'20200708','20200709',15000,'1000001'),
	  (2,'20200101','20200606',18000,'1000002');

INSERT INTO MovimientoBancario(CuentaBancariaID,FechaProceso,FechaMovimiento,MontoMovimiento,NumeroOperacion)
VALUES(3,'20200405','20200408',12000,'1000000'),
      (4,'20200708','20200709',15000,'1000001'),
	  (5,'20200101','20200606',18000,'1000002');

INSERT INTO TipoPago(NombreTipoPago)
VALUES ('Tranferencia Bancaria'),
       ('Pago en Efectivo'),
	   ('Tarjeta credito');


--2. Desarrollo las siguientes consultas:
--a. Una consulta que use JOIN para unir 3 tablas

SELECT *FROM MovimientoBancario mb 
INNER JOIN CuentaBancaria cb 
ON mb.CuentaBancariaID = cb.CuentaBancariaID
INNER JOIN Banco b 
ON cb.BancoID = b.BancoID
GO

--b. Dos consultas usando =, > o <, BETWEEN y LIKE

SELECT * FROM MovimientoBancario WHERE FechaMovimiento BETWEEN '2020-06-01' AND '2020-07-31'
SELECT * FROM Banco WHERE SiglaBanco LIKE '%C%'

SELECT *FROM Banco;
SELECT *FROM CuentaBancaria;
SELECT *FROM MovimientoBancario;
SELECT *FROM TipoPago;


-- 3. Cree dos vistas
CREATE VIEW 

-- 4. Cree un procedimiento almacenado de consulta de datos para la tabla CuentaBancaria

SELECT *FROM CuentaBancaria;














-- 5. Cree un procedimiento almacenado de ingreso de datos para la tabla Banco

CREATE  PROCEDURE InsertBanco
@NombreBanco	varchar(100),
@SiglaBanco	varchar(5)
AS 

INSERT INTO Banco(NombreBanco,SiglaBanco)
VALUES(@NombreBanco,@SiglaBanco)
GO

EXEC InsertBanco 'Banco Bilbao Vizcaya Argentaria','BBVA'


-- 6. Cree una rutina de copia de seguridad para la base de datos
