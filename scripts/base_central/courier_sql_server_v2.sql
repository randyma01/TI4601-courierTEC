/*
Proyecto I: courierTEC (SQL Server 2017)

Bases de Datos Avanzados, Área Acádemica de Administración de Tecnología de Información

Semestre II, 2018

Miembros:
	Karla Araya Corrales
	Maria Paula Ramírez Ortiz
	Hazel Arias Abarca
	Randy Martínez Sandí

Índice:
		1- Creación de las tablas.
    2- Llenado de Datos.
*/

--------------------------------------------------------
--------------Creación de la base de datos--------------
--------------------------------------------------------

CREATE DATABASE couriertecDB;
GO

--------------------------------------------------
--------------Creación de las tablas--------------
--------------------------------------------------

-- Tabla de las Provincias --
CREATE TABLE Provincia(
	IdProvincia INT NOT NULL IDENTITY(1,1) PRIMARY KEY
	Nombre VARCHAR (12)
);
GO

-- Tabla de los CLientes --
CREATE TABLE Clientes(
	IdCliente INT NOT NULL PRIMARY KEY,
	Cedula INT NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Tipo VARCHAR(11) NOT NULL, 					-- puede ser (bronce, oro, platino)
	FechaNacimiento DATE NOT NULL,
	IdPronvincia INT NOT NULL,
	FOREIGN KEY (IdProvincia) REFERENCES Provincia(IdProvincia)
);
GO

-- Tabla de los Administradores --
CREATE TABLE Administrador(
	IdAdmin INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Cedula INT NOT NULL,
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

-- Tabla de los Paquetes --
CREATE TABLE Paquete(
	IdPaquete INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FechaIngreso DATE NOT NULL,
	Tipo VARCHAR(30) NOT NULL 				--(ropa, juegetes, herramientas, etc).
	Descripcion VARCHAR(1000) NOT NULL,
	Peso INT NOT NULL,
	Precio INT NOT NULL,
	Monto INT NOT NULL,
	EstadoPaquete VARCHAR (20) NOT NULL, 		--(en camino, en sucursal, retirado)
);
GO

-- Tabla de los Clientes por Paquete --
CREATE TABLE Cliente_Paquete(
	IdCliente INT NOT NULL,
	IdPaquete INT NOT NULL,
	FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
	FOREIGN KEY (IdPaquete) REFERENCES Paquete(IdPaquete),
);
GO

-- Tabla de los Paquetes por Sucursal --
CREATE TABLE Paquete_Sucursal(
	IdSucursal INT NOT NULL,
	IdPaquete INT NOT NULL,
	FOREIGN KEY (IdPaquete) REFERENCES Paquete(IdPaquete),
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal),
);
GO

-- Tabla de los Administradores por Sucurscal --
CREATE TABLE Admi_Sucursal(
	IdAdmin INT NOT NULL,
	IdSucursal INT NOT NULL,
	FOREIGN KEY (IdAdmin) REFERENCES Administrador(IdAdmin),
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal),
);
GO

---------------------------------------------------
---------------Llenado de las tablas---------------
---------------------------------------------------

-- LLenado tabla de las Pronvicias --
INSERT INTO Provincia (Nombre) VALUES
('Heredia'),('San José'),('Cartago'),('Alajuela'),('Limón'),('Puntarenas'),('Guanacaste');
GO

-- Llenado tabla  de los Administradores --
INSERT INTO Administrador(Nombre, Apellido, Cedula) VALUES
('Hazel', 'Arias', 123456378),
('Karla', 'Araya', 178540922),
('Paula', 'Ramírez', 177339922),
('Randy', 'Martínez', 100729944);
GO

-- Llenado tabla de los Clientes --
INSERT INTO Clientes (Cedula, Nombre, Apellido, Telefono, Tipo, FechaNacimiento, IdProvincia) VALUES
('489765422','Andy','Quesada','00000000','Oro', TODAY, ),
