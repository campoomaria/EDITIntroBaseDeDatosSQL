CREATE DATABASE LaboratorioMod10;
USE LaboratorioMod10;

DESC clientes;

ALTER  TABLE clientes
MODIFY COD_CLIENTE VARCHAR(5) NOT NULL PRIMARY KEY,
MODIFY EMPRESA VARCHAR(30) NOT NULL,
MODIFY DIRECCION VARCHAR(50) NOT NULL,
MODIFY CIUDAD VARCHAR(15) NOT NULL,
MODIFY TELEFONO INT UNSIGNED NOT NULL,
MODIFY RESPONSABLE VARCHAR(35) NOT NULL;

ALTER TABLE productos
MODIFY COD_PRODUCTO INT UNSIGNED NOT NULL PRIMARY KEY,
MODIFY SECCION VARCHAR(15) NOT NULL,
MODIFY NOMBRE VARCHAR(25),
MODIFY IMPORTADO VARCHAR(10),
MODIFY ORIGEN VARCHAR(20),
MODIFY DIA INT UNSIGNED NOT NULL,
MODIFY MES INT UNSIGNED NOT NULL, 
MODIFY ANO INT UNSIGNED NOT NULL;

DESC productos;

ALTER TABLE pedidos
MODIFY NUMERO_PEDIDO INT UNSIGNED  NOT NULL PRIMARY KEY,
MODIFY CODIGO_CLIENTE VARCHAR(10) NOT NULL,
MODIFY FECHA_PEDIDO DATE NOT NULL, 
MODIFY FORMA_PAGO VARCHAR(10) NOT NULL,
MODIFY ENVIADO VARCHAR(2) NOT NULL;

DESC clientes_neptuno;

ALTER TABLE CLIENTES_NEPTUNO
MODIFY IDCliente VARCHAR(5) PRIMARY KEY,
MODIFY NombreCompania VARCHAR(100) NOT NULL, 
MODIFY Pais VARCHAR(15) NOT NULL;

RENAME TABLE CLIENTES TO CONTACTOS;

/*ETAPA 2.3*/
/*1-Mostrar todo el contenido de la tabla CLIENTES_NEPTUNO importada en el laboratorio anterior*/

SELECT * FROM CLIENTES_NEPTUNO;

/*2-Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS. */

SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO;

/*3- Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS. */
SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS;

/*Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordenar el resultado de la consulta alfabéticamente por los nombres de los
países. Para aquellos países que se repiten, ordenar las ciudades alfabéticamente.*/

SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS, CIUDAD;

/*5-Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordenar de manera alfabética el resultado de la consulta, por los nombres de los países.
Mostrar únicamente los 10 primeros clientes. */

SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS
LIMIT 10;

/*Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la
consulta sólo se deben observar las columnas NOMBRECOMPANIA, CIUDAD y PAIS.
Ordenar de manera alfabética el resultado de la consulta, por los nombres de los países.
Mostrar únicamente los clientes ubicados desde la posición 11 hasta la 15*/

SELECT NOMBRECOMPANIA, CIUDAD, PAIS FROM CLIENTES_NEPTUNO
ORDER BY PAIS, CIUDAD
LIMIT 5 OFFSET 10;

