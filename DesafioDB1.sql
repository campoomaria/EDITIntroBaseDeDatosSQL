CREATE DATABASE BONUS_TRACK;
USE BONUS_TRACK;

/*Creacion de la tabla de base de datos*/
CREATE TABLE AGENDA(
	IDContacto INT PRIMARY KEY,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(15) NOT NULL,
    Domicilio VARCHAR(50),
    Telefono INT NOT NULL
);

DESCRIBE AGENDA;
SHOW TABLES;

/*Agregar campo MAIL*/

ALTER TABLE AGENDA ADD COLUMN MAIL VARCHAR(50) NOT NULL; 

DESCRIBE AGENDA;

INSERT INTO AGENDA VALUES(1,'Maria', 'Sosa','Las heras', 2355654, 'maria@gmail.com');
INSERT INTO AGENDA VALUES(2,'Marta', 'Arriaga','Mate de luna 3455', 23556664, 'angeles@gmail.com');
INSERT INTO AGENDA VALUES(3,'Luis', 'Martinez','Belgrano 566', 2748723, 'luisM@gmail.com');
INSERT INTO AGENDA VALUES(4,'Jorge', 'Lopez','Lola Mora 33', 2355674, 'jdg@hotmail.com');

SELECT * FROM AGENDA;