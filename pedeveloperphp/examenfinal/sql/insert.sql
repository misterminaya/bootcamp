
-- crear base de datos
CREATE DATABASE bdventa;

--crear tabla
CREATE TABLE producto
(id INT AUTO_INCREMENT PRIMARY KEY,
 codigo CHAR(5) NOT NULL,
 producto VARCHAR(30) NOT NULL,
 precio DOUBLE(7,2) NOT NULL,
 stock INT(10) NOT NULL,
 fabricacion INT NOT NULL,
 foto VARCHAR(20) NULL
 )

-- Insert data

INSERT INTO producto (codigo, producto, precio, stock, fabricacion, foto)
 VALUES('p0001','disco',400, 10,2017,'disco.jpg'),
       ('p0002','case',200, 20,2018,'case.jpg'),
       ('p0003','memoria',150, 8,2019,'memoria.jpg'),
       ('p0004','microprocesador',800, 5,2020,'microprocesador.jpg'),
       ('p0005','placa',700, 5,2020,'placa.jpg');


-- insertar el quinto dato
INSERT INTO producto (codigo, producto, precio, stock, fabricacion, foto)
 VALUES('p0006','Cargador 5ANM',200, 20,2001,'cargador.jpg');