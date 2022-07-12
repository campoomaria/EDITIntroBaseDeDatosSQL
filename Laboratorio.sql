CREATE DATABASE LABORATORIO;
USE LABORATORIO;

CREATE TABLE FACTURAS(
	Letra char(1),
    Numero int,
    ClienteID int,
    ArticuloID int,
    Fecha date,
    Monto double,
    PRIMARY KEY (Letra, Numero)
);

CREATE TABLE ARTICULOS(
	ArticuloID int PRIMARY KEY,
    Nombre varchar(50), 
    Precio double,
    Stock int
);

CREATE TABLE CLIENTES (
	ClienteID int PRIMARY KEY,
    Nombre varchar(25),
    Apellido varchar(25),
    CUIT char(16),
    Direccion varchar(50),
    Comentarios varchar(50)
);
SELECT * FROM FACTURAS;
SELECT * FROM ARTICULOS;
SELECT *FROM CLIENTES;

DESCRIBE FACTURAS; #devuelve la descripcion de campos 

/*Etapa 1.2 modificaciones*/
/*Cambiar el nombre del campo ClienteID por IDCliente, manteniendo su tipo de dato y restricciones ya definidas.*/
ALTER TABLE FACTURAS
CHANGE ClienteID IDCliente int;
/*Cambiar el nombre del campo ArticuloID por IDArticulo, manteniendo su tipo de dato y restricciones ya definidas*/


DESCRIBE ARTICULOS;

/*Asignar la restricción UNSIGNED al campo Monto, manteniendo el tipo de dato ya definido para el campo. */

ALTER TABLE FACTURAS 
MODIFY MONTO DOUBLE UNSIGNED;
DESCRIBE FACTURAS; #devuelve la descripcion de campos 


/*2. Modificar la tabla ARTICULOS tomando en cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ArticuloID por IDArticulo, manteniendo su tipo de dato y restricciones ya definidas.
b. Cambiar el tipo de dato del campo Nombre para que admita hasta 75 caracteres.
c. Asignar las restricciones UNSIGNED y NOT NULL al campo Precio, manteniendo el tipo de dato ya definido para el campo.
d. Asignar las restricciones UNSIGNED y NOT NULL al campo Stock, manteniendo el tipo de dato ya definido para el campo.
*/
ALTER TABLE ARTICULOS
CHANGE ArticuloID IDArticulo int;

ALTER TABLE ARTICULOS 
MODIFY Nombre VARCHAR(75),
MODIFY Precio DOUBLE UNSIGNED NOT NULL,
MODIFY Stock INT UNSIGNED NOT NULL;

DESCRIBE ARTICULOS;

/*3. Modificar la tabla CLIENTES. Tomar en cuenta las siguientes consideraciones:
a. Cambiar el nombre del campo ClienteID por IDCliente, manteniendo su tipo de dato y restricciones ya definidas.
b. Cambiar el tipo de dato del campo Nombre para que admita hasta 30 caracteres y asigne la restricción correspondiente para
que su carga sea obligatoria.
c. Cambiar el tipo de dato del campo Apellido para que admita hasta 35 caracteres y asigne la restricción
correspondiente para que su carga sea obligatoria.
d. Cambiar el nombre del campo Comentarios por Observaciones y su tipo de dato para que admita hasta 255 caracteres.*/

ALTER TABLE CLIENTES
CHANGE ClienteID IDCliente int,
MODIFY Nombre VARCHAR(30),
MODIFY Apellido VARCHAR(35) NOT NULL,
CHANGE Comentarios Observaciones VARCHAR(255);
 
 DESCRIBE CLIENTES;

/*Etapa 1.3 */
INSERT INTO FACTURAS VALUES ('A',28,14,335,'2021-03-18', 1589.50);
INSERT INTO FACTURAS VALUES ('A',39,26,157,'2021-04-12', 979.75);
INSERT INTO FACTURAS VALUES ('B',8,17,95,'2021-04-25', 513.35);
INSERT INTO FACTURAS VALUES ('B',12,5,411,'2021-05-03', 2385.70);
INSERT INTO FACTURAS VALUES ('B',19,50,157,'2021-05-26', 979.75);

SELECT * FROM FACTURAS;

INSERT INTO ARTICULOS VALUES (95, 'Webcam con Microfono Plug & play',513.35, 39);
INSERT INTO ARTICULOS VALUES (157, 'Apple AirPods',979.75, 152);
INSERT INTO ARTICULOS VALUES (335, 'Lavasecarropas Automatico Samsung',1589.50, 12);
INSERT INTO ARTICULOS VALUES (411, 'Gloria Trevi/ Gloria/ CD+DVD',2385.70, 2);

INSERT INTO CLIENTES VALUES (5, 'Santiago', 'Gonzalez', '23-24582359-9', 'Uriburu558 - 7°A', 'VIP');
INSERT INTO CLIENTES VALUES (14, 'Gloria', 'Fernandez', '23-35965852-5', 'Constitución 323', 'GBA');
INSERT INTO CLIENTES VALUES (17, 'Gonzalo', 'Lopez', '23-33587416-0', 'Arias 2624', 'GBA');
INSERT INTO CLIENTES VALUES (26, 'Carlos', 'Garcia', '23-42321230-9',' Pasteur 322 - 2ºC', 'VIP');
INSERT INTO CLIENTES VALUES (50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

SELECT * FROM CLIENTES

