-- Create Database
CREATE DATABASE dbventa

-- Create Table
CREATE TABLE Producto(
id INT(5) NOT NULL AUTO_INCREMENT,
codigo CHAR(5) NOT NULL,
nombre VARCHAR(50) NOT NULL,
marca VARCHAR(20) NOT NULL,
modelo VARCHAR(20) NOT NULL,
precio DOUBLE(7,2) NOT NULL,
stock  INT NOT NULL,
fabricacion INT NULL,
foto VARCHAR(20) NULL,
CONSTRAINT PK_Producto PRIMARY KEY(id)
)

-- Insert Data Producto
INSERT INTO producto(codigo,nombre,marca,modelo,precio,stock,fabricacion,foto)
VALUES('TAX98','Sweaters','Sybilla','BSCPLS455NI',100,20,20190518,'casacas.jpg'),
       ('MOU34','Mountain Sweaters','Mountain Gear','PK.W.PAD.W20',200,30,20200119,'sweater.jpg'),
       ('DIA43','Buzo','Diadora','BC.W.SPORT.W20',149,40,20001220,'diadora.jpg');



-- Exercises 1:
CREATE PROCEDURE sp_listar()
SELECT *FROM producto;

-- Exercises 2:
CREATE PROCEDURE sp_buscar(xcodigo CHAR(5))
SELECT *FROM producto WHERE codigo=xcodigo;

-- Exercises 3:
CREATE PROCEDURE sp_stock(x INT, y INT)
SELECT *FROM producto WHERE stock IN (x,y);

-- Exercises 4:
CREATE PROCEDURE sp_cantidaddeproducto()
SELECT COUNT(codigo) AS totalproducto  FROM producto 

-- Exercises 5:
CREATE PROCEDURE sp_preciomaximo(out xprecio DOUBLE(7,2))
SELECT MAX(precio) INTO xprecio FROM producto

-- Exercises 6:
CREATE PROCEDURE sp_preciominimo(out xprecio DOUBLE(7,2))
SELECT MIN(precio) INTO xprecio FROM producto;

-- Exercises 7:
CREATE PROCEDURE sp_totalstock(xcodigo CHAR(5))
SELECT codigo,nombre,stock FROM producto WHERE codigo=xcodigo;

