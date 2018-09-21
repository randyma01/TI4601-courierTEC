/*
Proyecto I: courierTEC (SQL Server 2017)

Bases de Datos Avanzados, Área Acádemica de Administración de Tecnología de Información

Semestre II, 2018

Miembros:
	Karla Araya Corrales
	Maria Paula Ramírez Ortiz
	Hazel Arias Abarca
	Randy Martínez Sandí

Nota:
	Este es el script para la distribución del nodo San José de la base
	central courierTEC.

Índice:
		1- Creación de las tablas.
		2- Fragmentación de las tablas de couriertecDB.
*/

--------------------------------------------------------
----------Inicio: Creación de la base de datos----------
--------------------------------------------------------

CREATE DATABASE couriertecSanJoseDB;
GO

---------------------------------------------------
--------------Uso de la base de datos--------------
---------------------------------------------------

USE couriertecSanJoseDB;
GO

--------------------------------------------------
----------Inicio: Creación de las tablas----------
--------------------------------------------------

-- Tabla de los CLientes de SanJose --
CREATE TABLE Cliente_SanJose(
	IdCliente INT NOT NULL PRIMARY KEY,
	Cedula INT NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Tipo VARCHAR(11) NOT NULL,
	FechaNacimiento DATE NOT NULL,
);
GO

-- Tabla de la Sucursal de SanJose --
CREATE TABLE Sucursal_SanJose(
	IdSucursal INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(30) NOT NULL,
	Telefono VARCHAR(11) NOT NULL,
	Correo VARCHAR(25) NOT NULL,
	Recaudado INT,
);
GO

-- Tabla de los Empleados --
CREATE TABLE Empleado_SanJose(
	IdEmpleado INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(15) NOT NULL,
	Apellido VARCHAR(15) NOT NULL,
	Cedula INT NOT NULL,
);
GO

-- Tabla de los Paquetes --
CREATE TABLE Paquete_SanJose(
	IdPaquete INT NOT NULL  PRIMARY KEY,
	FechaIngreso DATE NOT NULL,
	Tipo VARCHAR(30) NOT NULL, 				--(ropa, juegetes, herramientas, etc).
	Descripcion VARCHAR(1000) NOT NULL,
	Peso INT NOT NULL,
	Precio INT NOT NULL,
	Monto INT NOT NULL,
	EstadoPaquete VARCHAR (20) NOT NULL 		--(en camino, en sucursal, retirado)
);
GO

-- Tabla de los Clientes por Paquete --
CREATE TABLE Cliente_Paquete_SanJose(
	IdCliente INT NOT NULL,
	IdPaquete INT NOT NULL,
);
GO

---------------------------------------------------
---------------Llenado de las Tablas---------------
------------------(Frgamentación)------------------
---------------------------------------------------

-- Llenando tabla de la Sucursal de SanJose --
INSERT INTO couriertecSanJoseDB.dbo.Sucursal_SanJose
SELECT TT1.* ,TT2.* FROM
(SELECT IdSucursal  AS 'IdSucursal', Nombre AS 'Nombre', Telefono AS 'Telefono', Correo AS 'Correo'
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Sucursal]
 WHERE Sucursal.IdSucursal = 1) AS [TT1],

(SELECT SUM(Monto) AS 'Recaudado'
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Paquete]
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Paquete_Sucursal] ON Paquete.IdPaquete = Paquete_Sucursal.IdPaquete
WHERE Paquete_Sucursal.IdSucursal = 1) AS [TT2];
GO

-- Llenado tabla de los Empleados SanJose --
INSERT INTO couriertecSanJoseDB.dbo.Empleado_SanJose
SELECT Empleado.IdEmpleado, Nombre, Apellido, Cedula
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Empleado]
WHERE Empleado.IdSucursal = 1;
GO

-- Llenado tabla de los Paquetes de SanJose --
INSERT INTO couriertecSanJoseDB.dbo.Paquete_SanJose
SELECT Paquete.IdPaquete, FechaIngreso, Tipo, Descripcion ,Peso, Precio ,Monto, EstadoPaquete
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Paquete]
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Paquete_Sucursal] ON Paquete.IdPaquete = Paquete_Sucursal.IdPaquete
WHERE Paquete_Sucursal.IdSucursal = 1;

-- Llenado tabla de los Paquetes por Cliente de SanJose --
INSERT INTO couriertecSanJoseDB.dbo.Cliente_Paquete_SanJose
SELECT Cliente_Paquete.IdCliente, Cliente_Paquete.IdPaquete
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente_Paquete]
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente] ON Cliente.IdCliente = Cliente_Paquete.IdCliente
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente_Sucursal] ON Cliente.IdCliente = Cliente_Sucursal.IdCliente
WHERE Cliente_Sucursal.IdSucursal = 1;


-- Llenando tabla de los Clientes de SanJose --
INSERT INTO couriertecSanJoseDB.dbo.Cliente_SanJose
SELECT Cliente.IdCliente, Cedula, Nombre,
Apellido,  Telefono, Tipo, FechaNacimiento
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente]
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente_Sucursal] ON Cliente.IdCliente = Cliente_Sucursal.IdCliente
WHERE Cliente_Sucursal.IdSucursal = 1;

/*
SELECT DISTINCT TT1.*, TT2.Provincia FROM
(
SELECT Cliente.IdCliente, Cedula, Nombre,
Apellido,  Telefono, Tipo, FechaNacimiento
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente]
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente_Sucursal] ON Cliente.IdCliente = Cliente_Sucursal.IdCliente
WHERE Cliente_Sucursal.IdSucursal = 2
) AS [TT1],

(
SELECT Provincia.Nombre AS 'Provincia'
FROM [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Provincia]
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente] ON Cliente.IdProvincia = Provincia.IdProvincia
INNER JOIN [RANDYMARTZ8AEA].[couriertecDB].[dbo].[Cliente_Sucursal] ON Cliente.IdCliente = Cliente_Sucursal.IdCliente
WHERE Cliente_Sucursal.IdSucursal = 2
) AS [TT2]
ORDER BY Provincia;
GO
*/
