USE master
GO

--Creación de la BD en modo simple
CREATE DATABASE AlquilerCoche
GO

USE AlquilerCoche
GO

--Creación de tablas
CREATE TABLE Cliente
(IdCliente INT NOT NULL,
 NomCliente VARCHAR(80),
 DNICli CHAR(8),
 DirCli VARCHAR(90),
 TefCli VARCHAR(20),
     CONSTRAINT PK_Cliente PRIMARY KEY(IdCliente))
GO

CREATE TABLE Agencia
(IdAgencia INT NOT NULL IDENTITY,
 DirAgencia VARCHAR(90),
 TefAgencia VARCHAR(20),
     CONSTRAINT PK_Agencia PRIMARY KEY(IdAgencia))
GO

CREATE TABLE Reserva
(IdReserva INT NOT NULL,
 FechaInicio DATETIME NOT NULL,
 IdCliente INT NOT NULL,
 FechaTermino DATETIME NOT NULL,
 IdAgencia INT NULL,
    CONSTRAINT PK_Reserva PRIMARY KEY(IdReserva))
GO 

CREATE TABLE DetalleReserva
(IdReserva INT NOT NULL, 
 IdCoche INT NOT NULL, 
 PrecioAlq DECIMAL(10,2),
 DescuentoAlq DECIMAL(10,2),
    CONSTRAINT PK_DetalleReserva PRIMARY KEY(IdReserva, IdCoche))
GO

CREATE TABLE Coche
(IdCoche INT NOT NULL,
 NroPlaca VARCHAR(20) NOT NULL,
 Marca VARCHAR(50) NOT NULL,
 Modelo VARCHAR(50) NOT NULL,
 Descripcion VARCHAR(100) NOT NULL,
 Color VARCHAR(20) NULL,
 IdGaraje INT NOT NULL,
    CONSTRAINT PK_Coche PRIMARY KEY(IdCoche))
GO

CREATE TABLE Garaje
(IdGaraje INT NOT NULL,
 DirGaraje VARCHAR(90),
 TefGaraje VARCHAR(20),
    CONSTRAINT PK_Garaje PRIMARY KEY(IdGaraje))
GO

--Creación de constraints (REGLAS) de la base de datos
--El DNI del cliente no se puede repetir
ALTER TABLE Cliente
ADD CONSTRAINT UN_DNI UNIQUE(DNICli)
GO

SP_HELPCONSTRAINT Cliente
GO

--La fecha de inicio de reserva debe ser por defecto la decha del momento
ALTER TABLE Reserva
ADD CONSTRAINT DF_FechaInicio DEFAULT (GETDATE()) FOR FechaInicio
GO

SP_HELPCONSTRAINT Reserva
GO

--QUÉ ES GETDATE
SELECT GETDATE()

--Precio de venta no puede ser negativo
ALTER TABLE DetalleReserva
ADD CONSTRAINT CK_Precio CHECK(PrecioAlq>=0)
GO

SP_HELPCONSTRAINT DetalleReserva
GO

--Creación de llaves foráneas
--FK Cliente Reserva
ALTER TABLE Reserva
ADD CONSTRAINT FK_Reserva_Cliente
FOREIGN KEY (IdCliente)
REFERENCES Cliente(IdCliente)
GO

--FK Agencia Reserva
ALTER TABLE Reserva
ADD CONSTRAINT FK_Reserva_Agencia
FOREIGN KEY (IdAgencia)
REFERENCES Agencia(IdAgencia)
GO

--FK Reserva DetalleReserva
ALTER TABLE DetalleReserva
ADD CONSTRAINT FK_DetalleReserva_Reserva
FOREIGN KEY (IdReserva)
REFERENCES Reserva(IdReserva)
GO

--FK Coche DetalleReserva
ALTER TABLE DetalleReserva
ADD CONSTRAINT FK_DetalleReserva_Coche
FOREIGN KEY (IdCoche)
REFERENCES Coche(IdCoche)
GO

--FK Garaje Coche
ALTER TABLE Coche
ADD CONSTRAINT FK_Coche_Garaje
FOREIGN KEY (IdGaraje)
REFERENCES Garaje(IdGaraje)
GO

--Añadir una nueva columna
ALTER TABLE Cliente
ADD FecNac DATE 
GO

SP_HELP Cliente
GO

--Ingresar datos y probar el constraint
--Tabla Cliente
INSERT INTO Cliente (IdCliente, NomCliente, DNICli, DirCli, TefCli, FecNac)	
VALUES (100, 'Miguel', '12345678', 'Su Casa', '501-1740', '20010421')
GO
SELECT * FROM Cliente

--registros múltiples
INSERT INTO Cliente (IdCliente, NomCliente, DNICli, DirCli, TefCli, FecNac)	
VALUES (200, 'Ana', '87654321', 'Su Casa 2', '502-1750', '20020521'),
       (300, 'José', '45612378', 'Su Casa 3', '503-1760', '20020621'),
	   (400, 'Eva', '32165498', 'Su Casa 4', '504-1770', '20020721')
GO
--Prueba de CONSTRAINT UNIQUE en el nro de DNI
SELECT * FROM Cliente
INSERT INTO Cliente (IdCliente, NomCliente, DNICli, DirCli, TefCli, FecNac)	
VALUES (500, 'Rodrigo', '12345678', 'La casa de su tio', '401-1234', '20020821')
GO

--Actualizar dirección del tercer cliente
UPDATE Cliente
SET DirCli = 'Calle 1 384 Ate'
WHERE IdCliente = 300
GO

SELECT * FROM Cliente

--Eliminar el cuarto cliente
DELETE Cliente
WHERE IdCLiente = 400
GO

SELECT * FROM Cliente

--Tabla Agencia
INSERT INTO Agencia (DirAgencia, TefAgencia)
VALUES ('Av. Argentina 1840 Lima', '324-7896')
GO

SELECT * FROM Agencia

--Tabla Reserva
INSERT INTO Reserva (IdReserva, FechaInicio, FechaTermino, IdCliente, IdAgencia)
VALUES (1, '20200420', '20200425', 300, 1)
GO

SELECT * FROM Reserva

--Tabla Reserva
--Prueba del constraint Default
INSERT INTO Reserva (IdReserva, FechaTermino, IdCliente, IdAgencia)
VALUES (2, '20200425', 200, 1)
GO


--Tabla Garaje
INSERT INTO Garaje (IdGaraje, DirGaraje, TefGaraje)
VALUES (1, 'Calle Los Alamos 358 Lince', '456-9874')
GO

SELECT * FROM Garaje

--Tabla Coche
INSERT INTO Coche (IdCoche, NroPlaca, Marca, Modelo, Descripcion, Color, IdGaraje)
VALUES (1, 'ABC-100', 'Hyundai', 'Elantra', 'Sedán de 4 puertas', 'Azul', 1)
GO

SELECT * FROM Coche
GO

--Tabla DetalleReserva
INSERT INTO DetalleReserva (IdReserva, IdCoche, PrecioAlq, DescuentoAlq)
VALUES (1, 1, 100, 0)
GO

SELECT * FROM DetalleReserva

--Probar constraint Check
INSERT INTO DetalleReserva (IdReserva, IdCoche, PrecioAlq, DescuentoAlq)
VALUES (2, 1, -2, 10)
GO

--Prueba de llave foranea
SELECT * FROM Reserva
SELECT * FROM Agencia

--error porque agencia 1 ya se usó en Reserva 1 y 2
DELETE Agencia WHERE IdAgencia = 1

--Si lo borra porque agencia 2 no se ha usado en ningna reserva
DELETE Agencia WHERE IdAgencia = 2

INSERT INTO Agencia (DirAgencia, TefAgencia)
VALUES ('cALLE 3 lINCE', '123-6547')
GO

SELECT * FROM Agencia

