/* Script de creación de GourmetStore_Stg */
USE master;

CREATE DATABASE GourmetStore_Stg;
go

USE GourmetStore_Stg;

CREATE TABLE Categoria_Stg(
	skCategoria integer not null IDENTITY(1,1) PRIMARY KEY,
	idCategoria integer not null,
	nomCategoria nvarchar(20) not null );

CREATE TABLE Producto_Stg(
	skProducto integer not null IDENTITY(1,1) PRIMARY KEY,
	idProducto integer not null,
	nomProducto nvarchar(60) not null,
	presentacion nvarchar(25) not null,
	precioUnitario money not null,
	skCategoria integer not null FOREIGN KEY REFERENCES Categoria_Stg);

CREATE TABLE Proveedor_Stg(
	skProveedor integer not null IDENTITY(1,1) PRIMARY KEY,
	idProveedor integer not null,
	nomProveedor nvarchar(40) not null,
	ciudad nvarchar(20) not null,
	pais nvarchar(20) not null );

CREATE TABLE Empleado_Stg(
	skEmpleado integer not null IDENTITY(1,1) PRIMARY KEY,
	idEmpleado integer not null,
	nomEmpleado nvarchar(50) not null );

CREATE TABLE Transportista_Stg(
	skTransportista integer not null IDENTITY(1,1) PRIMARY KEY,
	idTransportista integer not null,
	nomTransportista nvarchar(40) not null );

CREATE TABLE Cliente_Stg(
	skCliente integer not null IDENTITY(1,1) PRIMARY KEY,
	idCliente nchar(5) not null,	
	nomCliente nvarchar(40) not null,
	ciudad nvarchar(20) not null,
	pais nvarchar(20) not null );

CREATE TABLE Tiempo_Stg(
	skTiempo integer not null IDENTITY(1,1) PRIMARY KEY,
	fecha date not null,
	dia smallint not null,
	mes smallint not null,
	trimestre smallint not null,
	año smallint not null,
	nomMes nvarchar(10) null,
	nomTrimestre nvarchar(15) null );

CREATE TABLE Ventas_Stg(
	skVenta integer not null IDENTITY(1,1) PRIMARY KEY,
	skProducto integer not null FOREIGN KEY
		REFERENCES Producto_Stg,
	skCliente integer not null FOREIGN KEY
		REFERENCES Cliente_Stg,
	skProveedor integer not null FOREIGN KEY
		REFERENCES Proveedor_Stg,
	skEmpleado integer not null FOREIGN KEY
		REFERENCES Empleado_Stg,
	skTransportista integer not null FOREIGN KEY
		REFERENCES Transportista_Stg,
	skTiempo integer not null FOREIGN KEY
		REFERENCES Tiempo_Stg,
	fecha date not null,
	unidadesVendidas integer not null,
	precioVenta money not null,
	montoVendido money not null );
