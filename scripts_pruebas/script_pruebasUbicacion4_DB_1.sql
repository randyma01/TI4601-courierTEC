CREATE DATABASE pruebasUbicacion4DB;

USE pruebasUbicacion4DB;

CREATE TABLE pruebasUbicacion4DB.dbo.casosUbicacion4(
	idCaso INT NOT NULL,
	nombreCaso VARCHAR(15) NOT NULL, 
	PRIMARY KEY (idCaso)
);

INSERT INTO pruebasUbicacion4DB.dbo.casosUbicacion4
SELECT [idCaso]
      ,[nombreCaso]
  FROM [RANDYMARTZ8AEA].[pruebasDB].[dbo].[casos]
  WHERE [ubicacionCaso] = 4;
GO
 



SELECT * FROM pruebasUbicacion4DB.dbo.casosUbicacion4;


--INSERT INTO [RANDYMARTZ8AEA].[pruebasDB].[dbo].[casos] (nombreCaso, ubicacionCaso) VALUES
--('Las',6);