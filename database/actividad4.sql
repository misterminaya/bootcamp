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



--=================================================================================================================
/***********************************************************
   INICIAR LA SOLUCION DEL EXAMEN DESDE AQUI
--------------------------------------*/
-- En la base de datos creada, desarrolle lo siguiente:
-- 1. Ingrese por lo menos tres registros en cada tabla


--*********************** Banco ******************************************
INSERT INTO Banco(NombreBanco,SiglaBanco)
VALUES('Banco Pichincha', 'BPP'),
      ('Banco de Credito','BCP'),
	  ('Banco SCOTIABANK','SC');

--*********************** Cuenta Bancaria *********************************
INSERT INTO CuentaBancaria(NombreCuenta,NumeroCuenta,MonedaCuenta,BancoID)
VALUES('Tarjeta de debito','198324823432','Sol',1),
      ('Tarjeta de credito','19938345434534','Dol',1),
	  ('Tarjeta de debito','00190084234534','Sol',2);

--*********************** MovimientoBancario *********************************
INSERT INTO MovimientoBancario(CuentaBancariaID,FechaProceso,FechaMovimiento,MontoMovimiento,NumeroOperacion)
VALUES(1,'20200405','20200408',12000,'1000000'),
      (1,'20200708','20200709',15000,'1000001'),
	  (2,'20200101','20200606',18000,'1000002');

--***************************** TipoPago ***************************************
INSERT INTO TipoPago(NombreTipoPago)
VALUES ('Tranferencia Bancaria'),
       ('Pago en Efectivo'),
	   ('Tarjeta credito');

--================================================================================================================
--2. Desarrollo las siguientes consultas:
--****************Una consulta que use JOIN para unir 3 tablas *****************
SELECT *FROM MovimientoBancario mb 
INNER JOIN CuentaBancaria cb 
ON mb.CuentaBancariaID = cb.CuentaBancariaID
INNER JOIN Banco b 
ON cb.BancoID = b.BancoID
GO

-- ************ Dos consultas usando =, > o <, BETWEEN y LIKE ******************

SELECT * FROM MovimientoBancario WHERE FechaMovimiento BETWEEN '2020-06-01' AND '2020-07-31'
SELECT * FROM Banco WHERE SiglaBanco LIKE '%C%'

--==================================================================================================================
-- 3. Cree dos vistas

--************************** primera vista **********************************************
CREATE VIEW view_HistorialmovimientoBancario
AS
SELECT mb.NumeroOperacion,cb.NombreCuenta, cb.NumeroCuenta,cb.MonedaCuenta,
mb.CuentaBancariaID,mb.FechaProceso,mb.FechaMovimiento, mb.MontoMovimiento
FROM MovimientoBancario mb 
INNER JOIN CuentaBancaria cb 
ON mb.CuentaBancariaID = cb.CuentaBancariaID ;
GO

SELECT *FROM view_HistorialmovimientoBancario;
GO

--************************ segunda vista ************************************************
CREATE VIEW view_transacciones
AS
SELECT b.NombreBanco,cb.MonedaCuenta,cb.NombreCuenta,mb.FechaMovimiento FROM MovimientoBancario mb 
INNER JOIN CuentaBancaria cb 
ON mb.CuentaBancariaID = cb.CuentaBancariaID
INNER JOIN Banco b 
ON cb.BancoID = 1;
GO

SELECT *FROM view_transacciones;
GO
-- ===================================================================================================================
-- 4. Cree un procedimiento almacenado de consulta de datos para la tabla CuentaBancaria


CREATE PROCEDURE buscarbanco
@idbanco INT, @Nombrebanco VARCHAR(40) OUTPUT
AS
SELECT @Nombrebanco = NombreBanco FROM Banco
WHERE BancoID = @idbanco;
GO

DECLARE @Nombrebanco VARCHAR(40)
EXEC buscarbanco 1, @Nombrebanco OUTPUT
PRINT 'El nombre del banco es ' + @Nombrebanco
GO

-- ===================================================================================================================

-- 5. Cree un procedimiento almacenado de ingreso de datos para la tabla Banco

CREATE  PROCEDURE InsertBanco
@NombreBanco	varchar(100),
@SiglaBanco	varchar(5)
AS 

INSERT INTO Banco(NombreBanco,SiglaBanco)
VALUES(@NombreBanco,@SiglaBanco)
GO

EXEC InsertBanco 'Banco Bilbao Vizcaya Argentaria','BBVA'

-- ===================================================================================================================

-- 6. Cree una rutina de copia de seguridad para la base de datos
--copia de seguridad

-- ****************** Backup Full *****************************************
BACKUP DATABASE IdentificaPagos
TO DISK = 'C:\backup\20200721_FULL_IdentificaPagos.bak'
WITH INIT
GO

-- ****************** Backup Diferential *********************************
BACKUP DATABASE IdentificaPagos
TO DISK = 'C:\backup\20200721_DIFF_IdentificaPagos.bak'
WITH INIT, DIFFERENTIAL
GO

-- ****************** Backup Transactional ********************************
BACKUP LOG IdentificaPagos
TO DISK = 'C:\backup\20200721_LOG_IdentificaPagos.trn'
WITH INIT
GO

-- ************************************************************************
RESTORE HEADERONLY FROM DISK = 'C:\backup\20200721_FULL_IdentificaPagos.bak'
GO

-- ======================================================================================================================