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
	Este es el script para las consultas de la base central, las consultas están
  como 'stored procedures'.

*/

---------------------------------------------------
--------------Uso de la base de datos--------------
---------------------------------------------------

USE courierTEC;
GO

---------------------------------------------------
---------------------Consultas---------------------
---------------------------------------------------

-- =============================================
-- Monto total de paquetes retirados.
-- =============================================

SELECT SUM(Monto) FROM Paquete
WHERE EstadoPaquete = 'retirado';

-- =============================================
-- Cantidad de paquetes según cliente
-- para un rango de fechas específico. El sistema debe
-- presentar un listado de los clientes y los paquetes
-- registrados durante esas fechas inclusive.
-- RECIBE DOS FECHAS (Anho-Mes-Dia)
-- =============================================

SELECT COUNT(Paquete.IdPaquete) AS Cantidad, Cliente.Nombre
FROM Cliente_Paquete
JOIN Paquete ON Paquete.IdPaquete = Cliente_Paquete.IdPaquete
JOIN Cliente ON Cliente.IdCliente = Cliente_Paquete.IdCliente
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'
GROUP BY Cliente_Paquete.IdCliente, Cliente.Nombre ;


-- =============================================
-- Mostar los montos promedios de
-- los paquetes para el periodo indicado.
-- RECIBE DOS FECHAS
-- =============================================

SELECT AVG(Monto) AS PromedioMontoTotal
FROM  Cliente_Paquete
JOIN Paquete ON Paquete.IdPaquete = Cliente_Paquete.IdPaquete
JOIN Cliente ON Cliente.IdCliente = Cliente_Paquete.IdCliente
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25' ;


-- =============================================
-- Monto promedio pagado por paquete por cliente
-- para un periodo de fechas específico. El
-- sistema debe mostrar un listado de los clientes.
-- RECIBE DOS FECHAS
-- =============================================

SELECT avg(Monto) AS PromedioMontoTotal,Cliente.Nombre
FROM  Cliente_Paquete
JOIN Paquete ON Paquete.IdPaquete = Cliente_Paquete.IdPaquete
JOIN Cliente ON Cliente.IdCliente = Cliente_Paquete.IdCliente
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'
GROUP BY Cliente_Paquete.IdCliente, Cliente.Nombre ;


-- =============================================
-- Monto de paquete para un tipo de paquete específico
-- para un mes en particular. El sistema debe permitir
-- ESCOGER TIPO Y MES, presentando luego el monto de paquete
-- que corresponda (total de montos de paquetes de ese tipo en ese mes).
-- RECIBE MES Y TIPO
-- =============================================

SELECT SUM(Monto) as MontoPorTipo
FROM  Paquete
WHERE EstadoPaquete = 'retirado' and Tipo = 'Quimicos'
and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'

--En las OFICINAS CENTRALES  de la empresa, el gerente realiza, entre otras las siguientes consultas:


-- =============================================
-- Monto recaudado por sucursal para un periodo
-- específico.
-- RECIBE FECHA
-- =============================================

SELECT SUM (Monto)
FROM Paquete
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25' ;

-- =============================================
-- Monto recaudado por sucursal y por tipo de
-- paquete para un periodo específico.
-- RECIBE FECHA
-- =============================================

SELECT SUM(Monto)s
FROM Paquete
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'
GROUP BY Tipo;


-- =============================================
-- Listado de los tres mejores clientes (los que
-- tenga un monto mayor en el total de paquetes
-- que hayan traído) en un periodo específico.
-- RECIBE FECHA
-- =============================================

SELECT TOP 3 Paquete.monto, Cliente_Paquete.IdCliente, Cliente_Paquete.IdPaquete
FROM  Cliente_Paquete
JOIN Paquete ON Paquete.IdPaquete = Cliente_Paquete.IdPaquete
JOIN Cliente ON Cliente.IdCliente = Cliente_Paquete.IdCliente
WHERE EstadoPaquete = 'retirado'
AND FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'
GROUP BY Paquete.monto, Cliente_Paquete.IdCliente, Cliente_Paquete.IdPaquete
HAVING Paquete.monto >  AVG(Paquete.monto) ;
