/*
Proyecto I: courierTEC (SQL Server 2017)

Bases de Datos Avanzados, Área Acádemica de Administración de Tecnología de Información

Semestre II, 2018

Miembros:
	Karla -
	Maria Paula -
	Hazel -
	Randy Martínez Sandí - 2014047395

Índice:
		1- Creación de las tablas
    2- Declaración de los sp, triggers.
*/

--------------------------------------------------------
----------Inicio: Creación de la base de datos----------
--------------------------------------------------------

CREATE DATABASE couriertecDB;
GO

--------------------------------------------------
----------Inicio: Creación de las tablas----------
--------------------------------------------------

-- Tabla de los Administradores --
CREATE TABLE Administrador(
	IdAdmin INT IDENTITY PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Cedula INT NOT NULL,							-- esta prodria ser la llave primaria ¿?
);
GO

-- Tabla de las Sucursales --
CREATE TABLE Sucursal(
	IdSucursalINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(30)
	Telefono VARCHAR(11),
	Correo VARCHAR(25),
	CantidadPaquetes,

);
GO
