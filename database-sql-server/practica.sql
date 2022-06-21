CREATE DATABASE Store
GO

USE Store

CREATE TABLE Alumnos(
 id INT NOT NULL ,
 Nombre VARCHAR(20) NOT NULL,
 Apellido VARCHAR(20) NOT NULL,
 Edad INT NOT NULL,
 Puesto VARCHAR(20) NOT NULL,
 NivelAcademico VARCHAR(30) NOT NULL,
 Profesion VARCHAR(30) NOT NULL,
 Dni INT NOT NULL,
 CONSTRAINT PK_Alumnos PRIMARY KEY(Id)
)
GO


INSERT INTO Alumnos(id,Nombre,Apellido,Edad,Puesto,NivelAcademico,Profesion,Dni)
VALUES(1,'joel','bobadilla',20, 'Estudiantes','2 ciclo','software',23432423);
GO



CREATE TABLE Productos(
 id INT NOT NULL,
 Nombre VARCHAR(20) NOT NULL,
 Categoria VARCHAR(20) NOT NULL,
 Descripcion VARCHAR(40) NOT NULL,
 Marca VARCHAR(20) NOT NULL,
 Precio DECIMAL(10) NOT NULL,
 Stock INT NOT NULL
 CONSTRAINT PK_Productos PRIMARY KEY(Id)
)
GO



INSERT INTO Productos(id,Nombre,Categoria,Descripcion,Marca,Precio,Stock)
VALUES(1,'drone', 'electronico','drone blue','droneio', 100,3);


SELECT *FROM Productos;
SELECT *FROM Alumnos;