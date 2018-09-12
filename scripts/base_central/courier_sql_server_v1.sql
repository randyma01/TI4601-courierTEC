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

-- Tabla de las Provincias --
CREATE TABLE Provincia(
	IdProvincia INT NOT NULL IDENTITY(1,1) PRIMARY KEY
	Nombre VARCHAR (12)
);
GO

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
	IdSucursal NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Correo VARCHAR(25) NOT NULL,
);
GO

-- Tabla de los Administradores por Sucurscal --
CREATE TABLE Admi_Sucursal(
	IdAdmin INT NOT NULL,
	IdSucursal INT NOT NULL,
	FOREIGN KEY (IdAdmin) REFERENCES Administrador(IdAdmin),
	FOREIGN KEY (IdAdmin) REFERENCES Sucursal(IdSucursal),
);
GO

-- Tabla de los CLientes --
CREATE TABLE Clientes(
	IdCliente INT NOT NULL PRIMARY KEY,
	Cedula INT NOT NULL, 						-- esta prodria ser la llave primaria ¿?
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	-- Tipo VARCHAR(11) NOT NULL 		-- Puede ser un emun(bronce, oro, platino)
	FechaNacimiento DATE NOT NULL,
	IdPronvincia INT NOT NULL,
	FOREIGN KEY (IdProvincia) REFERENCES Provincia(IdProvincia)
);
GO
