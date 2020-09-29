
-- crear base de datos
CREATE DATABASE bdalumno;

-- Usar base de datos
USE bdalumno;

--crear tabla
CREATE TABLE alumno
(id INT AUTO_INCREMENT PRIMARY KEY,
 codigo CHAR(5) NOT NULL,
 nombre VARCHAR(30) NOT NULL,
 distrito VARCHAR(30) NOT NULL,
 nacimiento DATETIME  NOT NULL,
 nota1 INT NOT NULL,
 nota2 INT NOT NULL,
 nota3 INT NOT NULL
 );


 -- Insert data 

INSERT INTO alumno (codigo, nombre,distrito, nacimiento, nota1,nota2, nota3)
 VALUES('a0001','juan','lince', 20000101,14,15,16),
       ('a0002','pedro','surco', 19980101,15,16,17),
       ('a0003','maria','san isidro', 19990101,16,14,18),
       ('a0004','yuli','miraflores', 19990101,16,17,19),
       ('a0005','jose','molina', 19970101,18,17,20);
 


-- Crear una función que permita determinar la edad del alumno

DELIMITER $$

CREATE PROCEDURE sp_calcularedad(xname VARCHAR(30))
BEGIN
SELECT nombre, YEAR(CURDATE())-YEAR(nacimiento)  
AS edad FROM alumno WHERE nombre = xname;

END$$

DELIMITER ;


-- Crear una función que permita crear el promedio de notas
DELIMITER $$

CREATE PROCEDURE sp_promedio(xname VARCHAR(30))
BEGIN
SELECT nombre, ((nota1 + nota2 + nota3)/3)  
AS PromedioNotas FROM alumno WHERE nombre = xname;
END$$

DELIMITER ;

-- Crear una función que permita mostrar la nota mayor obtenida por cada alumno.
DELIMITER $$

CREATE PROCEDURE sp_mayornota()
BEGIN
SELECT codigo,nombre,GREATEST(nota1,nota2,nota3) as mayornota FROM alumno;
END$$

DELIMITER ;

-- Crear una función que permita mostrar la nota menor obtenida por cada alumno.


DELIMITER $$

CREATE PROCEDURE sp_menornota()
BEGIN
SELECT codigo,nombre,LEAST(nota1,nota2,nota3) as menornota FROM alumno;
END$$

DELIMITER ;


-- Crear una función que permita mostrar un mensaje si está aprobado o desaprobado mediante su promedio.

DELIMITER $$

CREATE PROCEDURE sp_estado(xname VARCHAR(30))
BEGIN
SELECT codigo,nombre,if(((AVG(nota1 + nota2 + nota3))>15), "Usted aprobo el curso","Usted desaprobo el curso") 
AS estado  FROM alumno WHERE nombre = xname;
END$$

DELIMITER ;



