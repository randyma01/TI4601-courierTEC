
--Consultas SJO y Cartago 

--Cantidad de dinero recaudado (se asume que se recauda cuando el paquete es retirado) en la sucursal.

  SELECT sum(Monto) 
  FROM Paquete
  WHERE EstadoPaquete = 'retirado' ; - # Por sucursal

--Cantidad de paquetes según cliente para un rango de fechas específico. El sistema debe
--presentar un listado de los clientes y los paquetes registrados durante esas fechas inclusive.
-- # RECIBE dos FECHAS
SELECT count(Paquete.IdPaquete) as Cantidad, Clientes.Nombre 
FROM Cliente_Paquete 
JOIN Paquete on Paquete.IdPaquete = Cliente_Paquete.IdPaquete 
JOIN Clientes on Clientes.IdCliente = Cliente_Paquete.IdCliente 
WHERE EstadoPaquete = 'retirado' 
and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'  group by Cliente_Paquete.IdCliente, Clientes.Nombre ;
  --USAR FORMATO ANHO-MES-DIA


-- Mostar los montos promedios de los paquetes para el periodo indicado.
-- # RECIBE DOS FECHAS
SELECT avg(Monto) as PromedioMontoTotal FROM  Cliente_Paquete
JOIN Paquete on Paquete.IdPaquete = Cliente_Paquete.IdPaquete 
JOIN Clientes on Clientes.IdCliente = Cliente_Paquete.IdCliente 
WHERE EstadoPaquete = 'retirado' 
and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25' ; 
  
--Monto promedio pagado por paquete por cliente para un periodo de fechas específico. El
--sistema debe mostrar un listado de los clientes.

-- # RECIBE DOS FECHAS
SELECT avg(Monto) as PromedioMontoTotal,Clientes.Nombre 
FROM  Cliente_Paquete
JOIN Paquete on Paquete.IdPaquete = Cliente_Paquete.IdPaquete 
JOIN Clientes on Clientes.IdCliente = Cliente_Paquete.IdCliente 
WHERE EstadoPaquete = 'retirado' 
and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'  group by Cliente_Paquete.IdCliente, Clientes.Nombre ;

--Monto de paquete para un tipo de paquete específico para un mes en particular. El sistema
--debe permitir ESCOGER TIPO Y MES, presentando luego el monto de paquete
--que corresponda (total de montos de paquetes de ese tipo en ese mes).

-- # RECIBE MES Y TIPO
SELECT SUM(Monto) as MontoPorTipo
FROM  Paquete
WHERE EstadoPaquete = 'retirado' and Tipo = 'Quimicos'
and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'

--En las OFICINAS CENTRALES  de la empresa, el gerente realiza, entre otras las siguientes consultas:

--Monto recaudado por sucursal para un periodo específico.
-- # RECIBE FECHA
SELECT sum(Monto) FROM Paquete WHERE EstadoPaquete = 'retirado' 
and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25' ; 
--Monto recaudado por sucursal y por tipo de paquete para un periodo específico.
-- # RECIBE FECHA
  SELECT sum(Monto) FROM Paquete  WHERE EstadoPaquete = 'retirado' 
and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25' GROUP BY Tipo ;
--Listado de los tres mejores clientes (los que tenga un monto mayor en el total de paquetes
--que hayan traído) en un periodo específico.

-- # RECIBE FECHA
SELECT Top 3 Paquete.monto, Cliente_Paquete.IdCliente, Cliente_Paquete.IdPaquete  FROM  Cliente_Paquete
JOIN Paquete on Paquete.IdPaquete = Cliente_Paquete.IdPaquete 
JOIN Clientes on Clientes.IdCliente = Cliente_Paquete.IdCliente 
WHERE EstadoPaquete = 'retirado' and FechaIngreso  >= '2011-04-12' AND FechaIngreso <= '2011-05-25'
GROUP BY Paquete.monto, Cliente_Paquete.IdCliente, Cliente_Paquete.IdPaquete
Having Paquete.monto >  avg(Paquete.monto) ;