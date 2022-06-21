USE MASTER
GO
CREATE DATABASE Instituto
ON PRIMARY
(NAME =  Instituto_Dat, FILENAME='E:\DATA\Instituto_Dat.mdf', 
 SIZE = 5MB, MAXSIZE = 200, FILEGROWTH = 1 )
LOG ON
(NAME = Instituto_log, FILENAME ='E:\DATA\Instituto_log.ldf',
 SIZE = 1MB, MAXSIZE = 100, FILEGROWTH= 1MB)
GO
GO
USE Instituto
GO


-- Creaci�n de las Tablas 
-- -----------------------------------------

CREATE TABLE Alumno (
       IdAlumno             char(5) NOT NULL,
       ApeAlumno            varchar(30) NOT NULL,
       NomAlumno            varchar(30) NOT NULL,
       DirAlumno            varchar(50) NULL,
       TelAlumno            varchar(12) NULL,
       EmailAlumno          varchar(50) NULL
)
go





CREATE TABLE Ciclo (
       IdCiclo              char(7) NOT NULL,
       FecInicio            datetime NULL,
       FecTermino           datetime NULL
)
go


CREATE TABLE Curso (
       IdCurso              char(4) NOT NULL,
       IdTarifa             char(1) NOT NULL,
       NomCurso             varchar(50) NOT NULL
)
go


CREATE TABLE CursoProgramado (
       IdCursoProg          int IDENTITY,
       IdCurso              char(4) NOT NULL,
       IdCiclo              char(7) NOT NULL,
       IdProfesor           char(4) NULL,
       Vacantes             tinyint NOT NULL DEFAULT 20,
       PreCursoProg         money NOT NULL,
       Horario              varchar(24) NOT NULL,
       Activo               bit DEFAULT 1,
       Matriculados         tinyint NOT NULL DEFAULT 0
)
go


CREATE TABLE Empleado (
       IdEmpleado           char(6) NOT NULL,
       Password             char(6) NOT NULL,
       ApeEmpleado          varchar(30) NOT NULL,
       NomEmpleado          varchar(30) NOT NULL,
       Cargo                varchar(25) NOT NULL,
       DirEmpleado          varchar(50) NULL,
       TelEmpleado          varchar(12) NULL,
       EmailEmpleado        varchar(50) NULL
)
go


CREATE TABLE Matricula (
       IdCursoProg          int NOT NULL,
       IdAlumno             char(5) NOT NULL,
       FecMatricula         datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
       ExaParcial           real NULL,
       ExaFinal             real NULL,
       Promedio             real NULL,
       Subsanacion          bit DEFAULT 0,
       ExaSub               real NULL
)
go


CREATE TABLE Parametro (
       Campo                varchar(10) NOT NULL,
       Contador             int NOT NULL
)
go


CREATE TABLE Profesor (
       IdProfesor           char(4) NOT NULL,
       ApeProfesor          varchar(30) NOT NULL,
       NomProfesor          varchar(30) NOT NULL,
       DirProfesor          varchar(50) NULL,
       TelProfesor          varchar(12) NULL,
       EmailProfesor        varchar(50) NULL
)
go


CREATE TABLE Tarifa (
       IdTarifa             char(1) NOT NULL,
       PreTarifa            money NOT NULL,
       Descripcion          varchar(50) NULL
)
go

/*
	Ingresando datos de prueba
*/

USE Instituto
GO


-- Agragar Datos a la Tabla Tarifa
-- ===============================

Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('A',200,'Herramientas de Oficina')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('B',250,'SoftWare de Desarrollo - Basico')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('C',300,'SoftWare de Desarrollo - Intermedio/Avanzado')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('D',350,'Sistemas Operativos - Intermedio/Avanzado')
Insert Into Tarifa(IdTarifa,PreTarifa,Descripcion) Values('E',350,'Administradores de Bases de Datos')


-- Agragar Datos a la Tabla Curso
-- ==============================

Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C001','A','Windows 8')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C002','B','MS Visual Basic.Net - Fundamentos')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C003','C','MS Visual Basic.Net - Bases de Datos')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C004','C','MS Visual Basic.Net - Componentes')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C005','B','Modelamiento de Datos')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C006','C','Dise�o de Sistemas con UML')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C007','C','Taller de Sistemas')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C008','C','SQL Server IV - BI')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C009','B','SQL Server I')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C010','C','SQL Server II - Programaci�n')
Insert Into Curso(IdCurso,IdTarifa,NomCurso) Values('C011','C','SQL Server III - Administracion')


-- Agragar Datos a la Tabla Ciclo
-- ==============================

Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-01','20120115','20120220')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-02','20120220','20120325')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-03','20120405','20120510')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-04','20120515','20120620')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-05','20120621','20120722')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-06','20120801','20120830')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-07','20120905','20121005')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-08','20121006','20121108')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2012-09','20121110','20121212')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2013-01','20130110','20130215')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2013-02','20130218','20130320')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2013-03','20130322','20130425')
Insert Into Ciclo(IdCiclo,FecInicio,FecTermino) Values('2013-04','20130426','20130528')


-- Agragar Datos a la Tabla Profesor
-- =================================

Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P001','Valencia Morales','Pedro Hugo','Magdalena','None','hugovm@terra.com.pe')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P002','Coronel Castillo','Eric Gustavo','Los Olivos','None','gcoronel@uni.edu.pe')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P003','Diaz Vilela','Pedro Pablo','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P004','Matsukawa Maeda','Sergio','Bella Vista','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P005','Bustamante Gutierrez','Cesar Augusto','Lince','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P006','Henostroza Macedo','Guino','Los Olivos','None','guino@telematic.edu.pe')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P007','Flores Manco','Julio Enrrique','Los Olivos','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P008','Bardon Mayta','Julio Cesar','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P009','Allauca Paucar','Juan Jose','Los Olivos','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P010','Serna Jherry','Jose Luis','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P011','Chuco Barrera','Raul','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P012','Alegre Mendoza','Jose','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P013','Quispe Tineo','Cesar','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P014','Ramirez Salvador','Julio','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P015','Chuquin Espinoza','Willian','Lince','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P016','Rosas Ayala','Dario','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P017','Rodriguez Villacorta','Manuel','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P018','Zegarra Zavaleta','Tereza','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P019','Guzman Azcurra','Manuel','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P020','Zegarra Zavaleta','Daniel','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P021','Cueva Contreras','Martin','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P022','Lostaunau Navarro','Alberto','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P023','Condor Ortiz','Saul','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P024','Ganoza Zelada','David','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P025','Fabian Avila','Dionicio','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P026','Quintana Saenz','Jorge','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P027','Yupanqui Villegas','Juan','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P028','Yupanqui Villegas','Julio','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P029','Alcantara Cerna','Violeta','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P030','Oceda Samaniego','Cesar Miguel','San Miguel','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P031','Becerra Flores','Ursula','San Miguel','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P032','Marcelo Villalobos','Marvin','Lince','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P033','Narvaez Garcia','Victor','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P034','Reynoso Zarate','Jose','Los Olivos','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P035','Suarez Valenzuela','Misael','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P036','Carrasco Mu�oz','Joel','','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P037','Salcedo Martinez','Percy','Lima','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P038','Vasquez Valenzuela','Javier','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P039','Herrera Huanca','Javier','Comas','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P040','Marcelo Villalobos','Ricardo','SMP','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P041','Quiroz Villon','Edgar','Rimac','None','None')
Insert Into Profesor(IdProfesor,ApeProfesor,NomProfesor,DirProfesor,TelProfesor,EmailProfesor)
	Values ('P042','Veliz','Fortumato','La Molina','None','None')



-- Agregar Datos a la Tabla Alumno
-- ===============================

Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0001','Donayre Mena','Christian')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0002','Ortiz Rodriguez','Freddy')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0003','Silva Mejia','Ruth Ketty')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0004','Melendez Noriega','Liliana')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0005','Huerta Leon','Silvia')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0006','Carranza Fuentes','Maria Elena')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0007','Prado Castro','Gabriela')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0008','Atuncar Mesias','Juan')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0009','Aguilar Zavala','Patricia Elena')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0010','Rodruigez Trujillo','Rub�n Eduardo')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0011','Canales Ruiz','Gino Leonel')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0012','Ruiz Quispe','Edgar')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0013','PanduroTerrazas','Omar')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0014','Zita Padilla','Peter Wilmer')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0015','Ternero Ubill�s','Luis')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0016','Rivera Garc�a','Ra�l Joel')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0017','Pomar Garc�a','Ana')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0018','Palomares Venegas','Mercedes')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0019','Ruiz Venegaz','Luis Alberto')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0020','Tejada Bernal','Janet')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0021','Sotelo Canales','Juan Carlos')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0022','LLosa Montalvan','Karla')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0023','Galarza Torres','Hugo')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0024','Valverde Jaramillo','Saul')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0025','Cipriano Avila','Roxana')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0026','Rodriguez Quispe','Luis Alberto')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0027','Huerta Leon','Marco Antonio')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0028','Ortiz Fuentes','Ana Mar�a')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0029','Rivera Jaramillo','Martha')
Insert Into alumno(IdAlumno,ApeAlumno,NomAlumno) Values('A0030','Bustamante Campos','Guino')


-- Agregar Datos a la Tabla Empleado
-- =================================

Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('psalce','psalce','Salcedo Banderas','Percy','Gerente Ventas')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('lcastr','lcastr','Castro Escobar','Lidia Rosa','Secretaria General')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('jmanrr','jmanrr','Manrique Diaz','Jos� Luis','Coordinador Academico')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('jramir','jramir','Ramirez Salvador','Julio Cesar','Administrador General')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('acampo','acampo','Campos Huapaya','Alberto','Jefe de Seguridad')
Insert Into Empleado(IdEmpleado,Password,ApeEmpleado,NomEmpleado,Cargo) 
	Values('beteta','beteta','Beteta Bustamante','Cesar','Gerente General')


-- Agregar Datos a la Tabla Parametro
-- ==================================

Insert Into Parametro(Campo,Contador) Values('Anno',2013)
Insert Into Parametro(Campo,Contador) Values('NroCiclo',5)
Insert Into Parametro(Campo,Contador) Values('IdCurso',12)
Insert Into Parametro(Campo,Contador) Values('IdProfesor',43)
Insert Into Parametro(Campo,Contador) Values('IdAlumno',31)



-- Agregar Datos a la Tabla CursoProgramado
-- ========================================

-- Ciclo: 2012-01

Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C001','P003','Lu y Mi 19-22 Horas',10,10,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C002','P002','Mi y Vi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C003','P005','Ma y Ju 19-22 Horas',10,10,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C004','P001','Ju y Sa 19-22 Horas',10,10,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C005','P001','Lu y Mi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-01','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)


-- 2012-02
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C001','P003','Lu y Mi 19-22 Horas',10,10,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C002','P002','Mi y Vi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C003','P005','Ma y Ju 19-22 Horas',10,10,0,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C004','P001','Ju y Sa 19-22 Horas',10,10,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C005','P001','Lu y Mi 19-22 Horas',10,10,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-02','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)



-- 2012-03
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C001','P003','Lu y Mi 19-22 Horas',20,0,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C002','P002','Mi y Vi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C003','P005','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C004','P001','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C005','P001','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-03','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)


-- 2012-04
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C001','P003','Lu y Mi 19-22 Horas',20,0,1,200)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C002','P002','Mi y Vi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C003','P005','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C004','P001','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C005','P001','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C006','P002','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C007','P004','Mi y Vi 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C008','P004','Ma y Ju 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C009','P002','Lu y Mi 19-22 Horas',20,0,1,250)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C010','P002','Ju y Sa 19-22 Horas',20,0,1,300)
Insert Into CursoProgramado( IdCiclo,IdCurso,IdProfesor,Horario,Vacantes,Matriculados,Activo,PreCursoProg )
	Values( '2012-04','C011','P002','Lu y Mi 19-22 Horas',20,0,1,300)




-- Agregar Datos a la Tabla Matricula
-- ==================================

-- Ciclo: 2012-01     Curso: C001

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 1,'A0001','20120103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0002','20120103',10,14,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0003','20120103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0004','20120103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0005','20120103',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0006','20120104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 1,'A0007','20120104',07,09,08 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0008','20120104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0009','20120104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 1,'A0010','20120104',12,16,14 )


-- Ciclo: 2012-01     Curso: C002

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0011','20120103',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0012','20120103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0013','20120103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0014','20120103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0015','20120103',08,10,09 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0016','20120104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0017','20120104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0018','20120104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0019','20120104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 2,'A0020','20120104',13,15,14 )


-- Ciclo: 2012-01     Curso: C003

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0021','20120103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0022','20120103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0023','20120103',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0024','20120103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0025','20120103',05,17,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0026','20120104',09,15,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0027','20120104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0028','20120104',13,17,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0029','20120104',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 3,'A0030','20120104',18,14,16 )


-- Ciclo: 2012-01     Curso: C004

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0001','20120103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0003','20120103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0005','20120103',16,12,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0007','20120103',14,12,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0009','20120103',18,12,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0011','20120104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0013','20120104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0015','20120104',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0017','20120104',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 4,'A0019','20120104',09,15,12 )


-- Ciclo: 2012-01     Curso: C005

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0002','20120103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0004','20120103',15,13,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0006','20120103',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0008','20120103',08,14,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0010','20120103',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0012','20120104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0014','20120104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0016','20120104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0018','20120104',13,11,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 5,'A0020','20120104',12,16,14 )


-- Ciclo: 2012-02     Curso: C001

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 12,'A0001','20120103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0002','20120103',10,14,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0003','20120103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0004','20120103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0005','20120103',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0006','20120104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio ) 
	Values( 12,'A0007','20120104',07,09,08 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0008','20120104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0009','20120104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 12,'A0010','20120104',12,16,14 )


-- Ciclo: 2012-02     Curso: C002

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0011','20120103',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0012','20120103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0013','20120103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0014','20120103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0015','20120103',08,10,09 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0016','20120104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0017','20120104',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0018','20120104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0019','20120104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 13,'A0020','20120104',13,15,14 )


-- Ciclo: 2012-02     Curso: C003

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0021','20120103',09,11,10 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0022','20120103',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0023','20120103',11,13,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0024','20120103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0025','20120103',05,17,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0026','20120104',09,15,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0027','20120104',14,16,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0028','20120104',13,17,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0029','20120104',15,19,17 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 14,'A0030','20120104',18,14,16 )


-- Ciclo: 2012-02     Curso: C004

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0001','20120103',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0003','20120103',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0005','20120103',16,12,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0007','20120103',14,12,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0009','20120103',18,12,15 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0011','20120104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0013','20120104',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0015','20120104',10,16,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0017','20120104',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 15,'A0019','20120104',09,15,12 )


-- Ciclo: 2012-02     Curso: C005

Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0002','20120103',12,14,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0004','20120103',15,13,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0006','20120103',12,16,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0008','20120103',08,14,11 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0010','20120103',11,15,13 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0012','20120104',13,15,14 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0014','20120104',15,17,16 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0016','20120104',17,19,18 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0018','20120104',13,11,12 )
Insert Into Matricula( IdCursoProg,IdAlumno,FecMatricula,ExaParcial,ExaFinal,Promedio )
	Values( 16,'A0020','20120104',12,16,14 )


