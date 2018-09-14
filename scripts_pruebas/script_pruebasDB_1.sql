CREATE DATABASE pruebasDB;

USE pruebasDB;

CREATE TABLE casos(
	idCaso INT NOT NULL IDENTITY(1,1),
	nombreCaso VARCHAR(15) NOT NULL, 
	ubicacionCaso INT NOT NULL
	PRIMARY KEY (idCaso)
);


INSERT INTO casos (nombreCaso, ubicacionCaso) VALUES
('Alex',1), ('Valencia',4),('Sammy',2),('Atenea',3),('Rey',4);

SELECT * FROM dbo.casos;