
create database isilalgoritmos
go
use isilalgoritmos
go
create table alumno(
id int identity(1,1) primary key,
nombre varchar(30) not null,
apellido varchar(30) not null,
dni varchar(30) not null,
correo varchar(30) not null
)
go
select * from alumno