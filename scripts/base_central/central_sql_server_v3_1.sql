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
	2- Llenado de datos.
	3 - Triggers para los nodos.
*/

--------------------------------------------------------
--------------Creación de la base de datos--------------
--------------------------------------------------------

CREATE DATABASE couriertecDB;
GO

---------------------------------------------------
--------------Uso de la base de datos--------------
---------------------------------------------------

USE couriertecDB;
GO

--------------------------------------------------
--------------Creación de las tablas--------------
--------------------------------------------------

-- Tabla de las Provincias --
CREATE TABLE Provincia(
	IdProvincia INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR (12)
);
GO

-- Tabla de los CLientes --
CREATE TABLE Cliente(
	IdCliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Cedula INT NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Tipo VARCHAR(11) NOT NULL, 					-- puede ser (bronce, oro, platino)
	FechaNacimiento DATE NOT NULL,
	IdProvincia INT NOT NULL,
	FOREIGN KEY (IdProvincia) REFERENCES Provincia(IdProvincia)
);
GO

-- Tabla de las Sucursales --
CREATE TABLE Sucursal(
	IdSucursal INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Correo VARCHAR(25) NOT NULL
);
GO

-- Tabla de los Empleados --
CREATE TABLE Empleado(
	IdEmpleado INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Cedula INT NOT NULL,
	IdSucursal INT NOT NULL,
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)
);
GO

-- Tabla de los Administradores --
CREATE TABLE Administrador(
	IdAdmin INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Cedula INT NOT NULL,
	IdSucursal INT NOT NULL,
	FOREIGN KEY (IdSucursal) REFERENCES Sucursal(IdSucursal)
);
GO

-- Tabla de los Paquetes --
CREATE TABLE Paquete(
	IdPaquete INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FechaIngreso DATE NOT NULL,
	Tipo VARCHAR(30) NOT NULL, 				--(ropa, juegetes, herramientas, etc).
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
	IdSucursal INT NOT NULL
);
GO

-- Tabla de los Clientes por Paquete --
CREATE TABLE Cliente_Paquete(
	IdCliente INT NOT NULL,
	IdPaquete INT NOT NULL
);
GO

-- Tabla de los Paquetes por Sucursal --
CREATE TABLE Paquete_Sucursal(
	IdSucursal INT NOT NULL,
	IdPaquete INT NOT NULL
);
GO

---------------------------------------------------
---------------Llenado de las tablas---------------
---------------------------------------------------

-- LLenado tabla de las Pronvicias --
INSERT INTO Provincia (Nombre) VALUES
('Heredia'),('San José'),('Cartago'),('Alajuela'),('Limón'),('Puntarenas'),('Guanacaste');
GO

-- Llenado tabla de los Sucursal --
INSERT INTO Sucursal (Nombre, Telefono, Correo) VALUES
('Sede San Jose', 78764532, 'csj@couriertec.com' ),
('Sede Cartago', 23432123, 'cca@couriertec.com');
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
('Sof', 'Cor', 112233444, 1),
('Est', 'Sol', 888775553, 2),
('Dan', 'Car', 908909889, 2),
('Ang', 'Rod', 098734122, 1);
GO

-- Llenado tablas de los Paquetes --
INSERT INTO Paquete (FechaIngreso, Tipo, Descripcion, Peso, Precio, Monto, EstadoPaquete) VALUES
(GETDATE(), 'Ropa', 'Tennis corredor', 2, 35000, 50000, 'Camino'),
(GETDATE(), 'Juegos', 'Juego de mesa', 1, 15000, 30000, 'Sucursal'),
(GETDATE(), 'Ropa', 'Jeans', 4, 30000, 80000, 'Sucursal'),
(GETDATE(), 'Electronico', 'Pantalla', 20, 1000000, 400000, 'Retirado');
GO

-- Llenado tabla de los Clientes por Sucursal --
INSERT INTO Cliente_Sucursal (IdCliente, IdSucursal) VALUES
(1,1), (2,1), (3,2), (4,2);
GO

-- Llenado tabla de los Clientes por Paquetes --
INSERT INTO Cliente_Paquete (IdCliente, IdPaquete) VALUES
(1,1), (2,2), (3,3), (4,4);
GO

-- Llenado tabla de los Paquetes por Sucursal --
INSERT INTO Paquete_Sucursal (IdPaquete, IdSucursal) VALUES
(1,1), (2,1), (3,2), (4,2);
GO

--------------------------------------------------------
--------------trigger para el auto llenado--------------
--------------------------------------------------------

/*
CREATE TRIGGER nuevoPaqueteCartago
ON [couriertecDB].[dbo].[Paquete]
AFTER UPDATE, INSERT
AS
BEGIN
	PRINT 'Insertando paquete nuevo a Cartago.'

	INSERT INTO couriertecCartagoDB.dbo.Paquete_Cartago
	SELECT TOP 1 Paquete.IdPaquete, FechaIngreso, Tipo, Descripcion, Peso, Precio, Monto, EstadoPaquete
	FROM [couriertecDB].[dbo].[Paquete]
	INNER JOIN Paquete_Sucursal ON Paquete.IdPaquete = Paquete_Sucursal.IdPaquete
	WHERE [Paquete_Sucursal].IdSucursal= 2
	ORDER BY [couriertecDB].[dbo].[Paquete].[IdPaquete] DESC;
	PRINT 'Paquete insertado en el nodo Cartago.'

END
GO
*/

/*
CREATE TRIGGER nuevoPaqueteSanJose
ON [couriertecDB].[dbo].[Paquete]
AFTER UPDATE, INSERT
AS
BEGIN
	PRINT 'Insertando paquete nuevo a San Jose.'

	INSERT INTO couriertecSanJoseDB.dbo.Paquete_SanJose
	SELECT TOP 1 Paquete.IdPaquete,FechaIngreso, Tipo, DESCRIPCION, Peso, Precio, Monto, EstadoPaquete
	FROM [couriertecDB].[dbo].[Paquete]
	INNER JOIN Paquete_Sucursal ON Paquete.IdPaquete = Paquete_Sucursal.IdPaquete
	WHERE [Paquete_Sucursal].IdSucursal= 1
	ORDER BY [couriertecDB].[dbo].[Paquete].[IdPaquete] DESC;
	PRINT 'Paquete insertado en el nodo San Jose.'

END
GO
*/
