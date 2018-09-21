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
	Este es el script para las consultas de la base SanJose, las consultas están
  como 'stored procedures'.

*/

---------------------------------------------------
--------------Uso de la base de datos--------------
---------------------------------------------------

USE couriertecSanJoseDB;
GO

---------------------------------------------------
---------------------Consultas---------------------
---------------------------------------------------

-- =============================================
-- Monto total de paquetes retirados.
-- =============================================

SELECT SUM(Monto) AS 'Monto'
FROM Paquete_SanJose
WHERE EstadoPaquete = 'retirado';

-- =============================================
-- Cantidad de paquetes según cliente
-- para un rango de fechas específico. El sistema debe
-- presentar un listado de los clientes y los paquetes
-- registrados durante esas fechas inclusive.
-- RECIBE DOS FECHAS (Anho-Mes-Dia), CEDULA CLIENTE
-- =============================================

SELECT COUNT(Cliente_Paquete_SanJose.IdPaquete) AS 'Cantidad'
FROM Cliente_Paquete_SanJose
INNER JOIN Cliente_SanJose ON Cliente_SanJose.IdCliente = Cliente_Paquete_SanJose.IdCliente
INNER JOIN Paquete_SanJose ON Paquete_SanJose.IdPaquete = Cliente_Paquete_SanJose.IdPaquete
WHERE Paquete_SanJose.EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'
AND Cliente_SanJose.Cedula = 89765739
GROUP BY Cliente_Paquete_SanJose.IdCliente;


-- =============================================
-- Mostar los montos promedios de
-- los paquetes para el periodo indicado.
-- RECIBE DOS FECHAS
-- =============================================

SELECT AVG(Monto) AS 'PromedioMontoTotal'
FROM  Paquete_SanJose
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25';


-- =============================================
-- Monto promedio pagado por paquete por cliente
-- para un periodo de fechas específico. El
-- sistema debe mostrar un listado de los clientes.
-- RECIBE DOS FECHAS y CEDULA CLIENTE
-- =============================================

SELECT AVG(Monto) AS 'PromedioMontoTotal'
FROM  Cliente_Paquete_SanJose
INNER JOIN Paquete_SanJose ON Paquete_SanJose.IdPaquete = Cliente_Paquete_SanJose.IdPaquete
INNER JOIN Cliente_SanJose ON Cliente_SanJose.IdCliente = Cliente_Paquete_SanJose.IdCliente
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'
AND Cliente_SanJose.Cedula = 89765739
GROUP BY Cliente_Paquete_SanJose.IdCliente;


-- =============================================
-- Monto de paquete para un tipo de paquete específico
-- para un mes en particular. El sistema debe permitir
-- ESCOGER TIPO Y MES, presentando luego el monto de paquete
-- que corresponda (total de montos de paquetes de ese tipo en ese mes).
-- RECIBE MES Y TIPO
-- =============================================

SELECT SUM(Monto) AS 'MontoPorTipo'
FROM  Paquete_SanJose
WHERE EstadoPaquete = 'retirado' AND Tipo = 'Quimicos'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25';
