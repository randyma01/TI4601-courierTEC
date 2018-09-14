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
CREATE TABLE Cliente(
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

-- Tabla de los Empleados --
CREATE TABLE Empleado(
	IdEmpleado INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Cedula INT NOT NULL,
	IdSucursal INT NOT NULL,
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)
);
GO

-- Tabla de los Administradores --
CREATE TABLE Administrador(
	IdAdmin INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Cedula INT NOT NULL,
	IdSucursal INT NOT NULL,
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)
);
GO

-- Tabla de las Sucursales --
CREATE TABLE Sucursal(
	IdSucursal NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Correo VARCHAR(25) NOT NULL
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
	EstadoPaquete VARCHAR (20) NOT NULL 		--(en camino, en sucursal, retirado)
);
GO

-- Tabla de los Cliente por Sucursal --
CREATE TABLE Cliente_Sucursal(
	IdCliente INT NOT NULL,
	IdSucursal INT NOT NULL,
	FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)
);
GO

-- Tabla de los Clientes por Paquete --
CREATE TABLE Cliente_Paquete(
	IdCliente INT NOT NULL,
	IdPaquete INT NOT NULL,
	FOREIGN KEY (IdCliente) REFERENCES Cliente(IdCliente),
	FOREIGN KEY (IdPaquete) REFERENCES Paquete(IdPaquete)
);
GO

-- Tabla de los Paquetes por Sucursal --
CREATE TABLE Paquete_Sucursal(
	IdSucursal INT NOT NULL,
	IdPaquete INT NOT NULL,
	FOREIGN KEY (IdPaquete) REFERENCES Paquete(IdPaquete),
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)
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
INSERT INTO Administrador(Nombre, Apellido, Cedula, IdSucursal) VALUES
('Hazel', 'Arias', 123456378, 1),
('Karla', 'Araya', 178540922, 2),
('Paula', 'Ramírez', 177339922, 1),
('Randy', 'Martínez', 100729944, 2);
GO

-- Llenando tabla de Clientes --
INSERT INTO Cliente (Cedula, Nombre, Apellido, Telefono, Tipo, FechaNacimiento, IdProvincia) VALUES
(89894527, 'Max', 'Green', '89815637', 'bronce', GETDATE(), 2),
(56473829, 'Xav', 'Red', '89815637', 'oro', GETDATE(), 3),
(12344321, 'Tim', 'Blue', '89815637', 'platino', GETDATE(), 5),
(89765739, 'Sen', 'Yell', '89815637', 'bronce', GETDATE(), 1);
GO

-- Llenado tabla  de los Empleado --
INSERT INTO Empleado(Nombre, Apellido, Cedula, IdSucursal) VALUES
('Sof', 'Cor', 112233444),
('Est', 'Sol', 888775553),
('Dan', 'Car', 908909889),
('Ang', 'Rod', 098734122);
GO

-- Llenado tabla de los Sucursal --
INSERT INTO Sucursal (Nombre, Telefono, Correo) VALUES
(,'Sede San Jose', 78764532, 'csj@couriertec.com' ),
(,'Sede Cartago', 23432123, 'cca@couriertec.com'),

-- Llenado tablas de los Paquetes --
INSERT INTO Sucursarl (FechaIngreso, Tipo, Descripcion, Peso, Precio, Monto, EstadoPaquete) VALUES
(GETDATE(), 'Ropa', 'Tennis corredor', 2, 35000, 50000, 'Camino'),
(GETDATE(), 'Juegos', 'Juego de mesa', 1, 15000, 30000, 'Sucursar'),
(GETDATE(), 'Ropa', 'Jeans', 4, 30000, 80000, 'Sucursal'),
(GETDATE(), 'Electronico', 'Pantalla', 20, 1000000, 400000, 'Retirado');
GO

-- Llenado tabla de los Clientes por Sucursal --
INSET INTO Cliente_Sucursal (IdCliente, IdSucursal) VALUES
(1,1), (2,1), (3,2), (4,2);
GO

-- Llenado tabla de los Clientes por Paquetes --
INSET INTO Cliente_Sucursal (IdCliente, IdSucursal) VALUES
(1,1), (2,2), (3,3), (4,4);
GO

-- Llenado tabla de los Paquetes por Sucursal --
INSET INTO Paquete_Sucursal (IdPaquete, IdSucursal) VALUES
(1,1), (2,1), (3,2), (4,2);
GO
