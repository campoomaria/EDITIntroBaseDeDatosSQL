USE LaboratorioMod10;
/*ETAPA 3*/
/*1. Utilizar la tabla CLIENTES_NEPTUNO y generar una consulta que muestre las columnas IDCLIENTE y NOMBRECOMPANIA. 
En el resultado de la consulta, se debe mostrar una nueva columna llamada UBICACION que concatene las columnas
DIRECCION, CIUDAD y PAIS, separando los valores de estos campos por un guión.
Para este primer ejercicio, utilizar la función CONCAT. */

SELECT IDCLIENTE, NOMBRECOMPANIA, CONCAT(DIRECCION,'-', CIUDAD, '-', PAIS) UBICACION FROM CLIENTES_NEPTUNO;

/*2. Repetir el ejercicio anterior, utilizando la función CONCAT_WS. */
SELECT IDCLIENTE, NOMBRECOMPANIA, CONCAT_WS('-',DIRECCION, CIUDAD, PAIS) UBICACION FROM CLIENTES_NEPTUNO;

/*3. Modificar el ejercicio anterior para mostrar en mayúsculas los valores cargados en el campo
NOMBRECOMPANIA. Esta columna debe mostrarse con el nombre EMPRESA. */

SELECT IDCLIENTE, UPPER(NOMBRECOMPANIA) NOMBRECOMPANIA, CONCAT_WS('-',DIRECCION, CIUDAD, PAIS) UBICACION FROM CLIENTES_NEPTUNO;

/*4. Modificar el ejercicio anterior para mostrar los valores cargados en el campo IDCLIENTE en
minúsculas. Esta columna debe mostrarse con el nombre CODIGO*/

SELECT LOWER(IDCLIENTE) IDCLIENTE, UPPER(NOMBRECOMPANIA) NOMBRECOMPANIA, CONCAT_WS('-',DIRECCION, CIUDAD, PAIS) UBICACION FROM CLIENTES_NEPTUNO;

/*5. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre la columna FECHA. En el resultado de la consulta, se debe mostrar
una nueva columna con el nombre SEXO que muestre la inicial de los datos cargados en el campo SEXO y otra columna con el nombre
TIPO que muestre la inicial de los datos cargados en el campo TIPO_PARTO. */

SELECT * FROM NACIMIENTOS;

SELECT FECHA, LEFT(SEXO,1) SEXO, LEFT(TIPO_PARTO,1) TIPO_PARTO FROM NACIMIENTOS;

/*6. Utilizar la tabla CLIENTES_NEPTUNO y genera una consulta que muestre todos los campos de la tabla. 
Agregar una nueva columna a la consulta con el nombre CODIGO. La misma, debe concatenar la primera letra del campo CIUDAD y la
primera y las 2 últimas letras del campo PAIS. Los datos de esta nueva columna se deben mostrar en mayúsculas.*/

SELECT * , UPPER(CONCAT(LEFT(CIUDAD,1),LEFT(PAIS,1),RIGHT(PAIS,2))) CODIGO FROM CLIENTES_NEPTUNO;

/*7. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre las 5 primeras columnas de la tabla.
Agregar una nueva columna a la consulta con el nombre MES que tome el mes de nacimiento de los
bebés del campo FECHA. Ordenar el resultado de menor a mayor por los valores de la columna MES. */

 SELECT * FROM NACIMIENTOS;
 
 SELECT SEXO, FECHA, TIPO_PARTO, ATENC_PART, LOCAL_PART, SUBSTRING(FECHA,4,2) MES FROM NACIMIENTOS
 ORDER BY MES;
 
 /*8. Utiliza la tabla NACIMIENTOS y genera una consulta que muestre las columnas SEXO, FECHA
y TIPO_PARTO. En el resultado de la consulta, se debe mostrar una nueva columna llamada NACIONALIDAD
donde se reemplazan los valores Chilena de la columna NACIONALIDAD original por Ciudadana.*/

 SELECT SEXO, FECHA, TIPO_PARTO,REPLACE(NACIONALIDAD, 'chilena','ciudadana') NACIONALIDAD FROM NACIMIENTOS;

/*ETAPA 3*/
/*1. Utilizando la tabla PEDIDOS_NEPTUNO, obtener una lista de todos aquellos pedidos efectuados a lo largo del año 1998. */

SELECT * FROM PEDIDOS_NEPTUNO;

SELECT * FROM PEDIDOS_NEPTUNO
WHERE YEAR(FECHAPEDIDO)=1998;

/*2. Utilizando la tabla PEDIDOS_NEPTUNO, obtén una lista de todos aquellos pedidos
efectuados durante los meses de agosto y septiembre del año 1997. A la derecha, podemos ver la resolución:*/

SELECT * FROM PEDIDOS_NEPTUNO
WHERE MONTH(FECHAPEDIDO) BETWEEN 8 AND 9 AND YEAR(FECHAPEDIDO)=1997;

/*3. Utilizando la tabla PEDIDOS_NEPTUNO, obtén una lista de todos aquellos pedidos
efectuados el primer día de cada mes de cualquier año:*/

SELECT * FROM PEDIDOS_NEPTUNO
WHERE DAY(FECHAPEDIDO)=1;

/*4. Utiliza la tabla PEDIDOS_NEPTUNO y obtén una lista de todos los registros contenidos en la tabla. En una
nueva columna llamada DIAS TRANSCURRIDOS, muestra la cantidad de días transcurridos desde la
fecha en que fue realizado cada pedido, al día de hoy. */

SELECT *, DATEDIFF(CURDATE(),FECHAPEDIDO) as 'DIAS TRANSCURRIDOS' FROM PEDIDOS_NEPTUNO;

/*5. Modifica la consulta anterior y agrega otra columna con el nombre DIA, que refleje el nombre del día en
el que se efectuó cada uno de los pedidos. */

SELECT *, DAYNAME(FECHAPEDIDO) DIA , DATEDIFF(CURDATE(),FECHAPEDIDO) as 'DIAS TRANSCURRIDOS' FROM PEDIDOS_NEPTUNO;

/*6. Modifica la consulta anterior y agrega otra columna llamada DIA DEL AÑO, que refleje el número del día
del año en el que se efectuó cada uno de los pedidos.*/

SELECT *, DAYNAME(FECHAPEDIDO) DIA,DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO' , DATEDIFF(CURDATE(),FECHAPEDIDO) as 'DIAS TRANSCURRIDOS' FROM PEDIDOS_NEPTUNO;

/*7. Modifica la consulta anterior y agrega otra columna con el nombre MES, que refleje el nombre del mes del
año en el que se efectuó cada uno de los pedidos.*/

SELECT *, DAYNAME(FECHAPEDIDO) DIA,DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO',MONTHNAME(FECHAPEDIDO)'MES DEL AÑO' , DATEDIFF(CURDATE(),FECHAPEDIDO) as 'DIAS TRANSCURRIDOS' FROM PEDIDOS_NEPTUNO;

/*8. Modifica la consulta anterior y agrega otra columna llamada PRIMER VENCIMIENTO que calcule el primer
vencimiento de cada factura, suponiendo que dicho vencimiento es a los 30 días de haber sido emitida. */

SELECT *, DAYNAME(FECHAPEDIDO) DIA,DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO',MONTHNAME(FECHAPEDIDO)'MES DEL AÑO' , DATEDIFF(CURDATE(),FECHAPEDIDO) as 'DIAS TRANSCURRIDOS',ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) AS'PRIMER VENCIMIENTO' 
FROM PEDIDOS_NEPTUNO;

/*9. Modifica la consulta anterior y agrega otra columna llamada SEGUNDO VENCIMIENTO que calcule el
segundo vencimiento de cada factura, suponiendo que el mismo es a los 2 meses de haber sido emitida. */

SELECT *, DAYNAME(FECHAPEDIDO) DIA,DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO',MONTHNAME(FECHAPEDIDO)'MES DEL AÑO' , DATEDIFF(CURDATE(),FECHAPEDIDO) as 'DIAS TRANSCURRIDOS',
ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) AS'PRIMER VENCIMIENTO',ADDDATE(FECHAPEDIDO, INTERVAL 60 DAY)AS 'SEGUNDO VENCIMIENTO' 
FROM PEDIDOS_NEPTUNO;

/*ETAPA 3.4*/
/*1. Utilizar la tabla PEDIDOS_NEPTUNO Y obtener una lista de todos los registros
cargados en la tabla. Generar una nueva columna con el nombre IVA que calcule el
21% del cargo de cada pedido, obteniendo un valor numérico que, como máximo, contenga 2 decimales. */

SELECT *, ROUND(CARGO*0.21,2) AS 'IVA' FROM PEDIDOS_NEPTUNO;

/*	2. Modifica la consulta anterior, agregando una nueva columna con el nombre NETO, que calcule el total a
pagar por cada cliente por las compras realizadas (es decir, sumándole el IVA al cargo original, manteniendo como máximo 2 decimales).*/

SELECT *, ROUND(CARGO*0.21,2) AS 'IVA', ROUND(CARGO*1.21,2) AS NETO FROM PEDIDOS_NEPTUNO;

/*3. Modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO A
FAVOR CLIENTE que devuelva el valor entero inferior del neto calculado anteriormente. */

SELECT *, ROUND(CARGO*0.21,2) AS 'IVA', ROUND(CARGO*1.21,2) AS NETO, FLOOR(ROUND(CARGO*1.21,2)) AS 'REDONDEO A FAVOR CLIENTE' FROM PEDIDOS_NEPTUNO;

/*4. Modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO A
FAVOR EMPRESA que devuelva el valor entero superior del neto antes calculado. */

SELECT *, ROUND(CARGO*0.21,2) AS 'IVA', ROUND(CARGO*1.21,2) AS NETO, FLOOR(ROUND(CARGO*1.21,2)) AS 'REDONDEO A FAVOR CLIENTE',
CEIL(ROUND(CARGO*1.21,2)) AS 'REDONDEO A FAVOR CLIENTE' 
FROM PEDIDOS_NEPTUNO;

/*ETAPA 3.5*/
/*1. Calcular la cantidad de registros cargados en la tabla PEDIDOS_NEPTUNO. */
SELECT *  FROM PEDIDOS_NEPTUNO;

SELECT COUNT(*) FROM PEDIDOS_NEPTUNO;

/*2. Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido entregados
por el transportista con el nombre SPEEDY EXPRESS. 
La columna en la que se obtiene el resultado se mostrará con el nombre ENTREGAS SPEEDY EXPRESS. */

SELECT COUNT(TRANSPORTISTA) AS 'ENTREGAS SPEEDY EXPRESS'FROM PEDIDOS_NEPTUNO
WHERE TRANSPORTISTA= 'SPEEDY EXPRESS';

/*3. Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido atendidos por
empleados cuyo apellido comience con la letra C.
La columna en la que se obtiene el resultado debe mostrarse con el nombre VENTAS*/

SELECT COUNT(EMPLEADO) AS 'VENTAS' FROM PEDIDOS_NEPTUNO
WHERE EMPLEADO LIKE 'C%';

/*4. Calcula el precio promedio de todos los productos cargados en la tabla llamada
PRODUCTOS_NEPTUNO. La columna del resultado, debe mostrarse con el nombre PRECIO PROMEDIO. Y
el resultado debe mostrar, como máximo, sólo 2 decimales. */
	SELECT *  FROM PRODUCTOS_NEPTUNO;
SELECT ROUND(AVG(PRECIOUNIDAD),2) AS 'PRECIO PROMEDIO' FROM PRODUCTOS_NEPTUNO; 

/*5. Modifica la consulta anterior, para obtener el precio más bajo de la tabla. La columna en la que se obtiene
el resultado, debe mostrarse con el nombre PRECIO INFERIOR. */
SELECT ROUND(AVG(PRECIOUNIDAD),2) AS 'PRECIO PROMEDIO', MIN(PRECIOUNIDAD) AS 'PRECIO MINIMO' FROM PRODUCTOS_NEPTUNO; 

/*6. Modifica la consulta anterior para obtener el precio más alto de la tabla. La nueva columna
debe mostrarse con el nombre PRECIO MAXIMO.*/
SELECT ROUND(AVG(PRECIOUNIDAD),2) AS 'PRECIO PROMEDIO', MIN(PRECIOUNIDAD) AS 'PRECIO MINIMO', MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO' 
FROM PRODUCTOS_NEPTUNO; 	

/*7. En base a la tabla PRODUCTOS_NEPTUNO, genera una consulta que muestre el precio
más alto correspondiente a cada categoría.
La columna en la que se obtiene dicho precio debe mostrarse con el nombre PRECIO MAXIMO. La columna que muestra las
categorías debe mostrarse con el nombre CATEGORIA. La resolución, a la derecha: */

SELECT * FROM PRODUCTOS_NEPTUNO;
SELECT NOMBRECATEGORIA AS CATEGORIA,MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO' FROM PRODUCTOS_NEPTUNO
ORDER BY CATEGORIA;

/*8. Calcula la cantidad de entregas efectuadas por cada transportista, utilizando la tabla
PEDIDOS_NEPTUNO. La columna en la que se obtienen los resultados debe mostrarse con el nombre ENTREGAS. */

SELECT TRANSPORTISTA,COUNT(IDPEDIDO) AS ENTREGAS
FROM PEDIDOS_NEPTUNO
GROUP BY TRANSPORTISTA;

/*9. Utiliza la tabla NACIMIENTOS y calcula la cantidad de nacimientos según el sexo de los bebés. La columna
en la que se obtienen los resultados debe mostrarse con el nombre NACIMIENTOS.*/

SELECT SEXO, COUNT(SEXO) AS NACIMIENTOS
FROM NACIMIENTOS
GROUP BY SEXO;

/*10. Utilizando la tabla PEDIDOS_NEPTUNO, calcula el total de gastos por cliente. La columna en la que se
obtienen los resultados debe mostrarse con el nombre TOTAL GASTOS y debe mostrar como máximo 2 decimales. 
La columna en la que figuran los nombres de los clientes debe tener el título CLIENTE. */

SELECT NOMBRECOMPANIA AS CLIENTE, ROUND(SUM(CARGO), 2) AS 'TOTAL GASTOS'
FROM PEDIDOS_NEPTUNO
GROUP BY CLIENTE;

/*11. Utilizando la tabla PRODUCTOS, calcula la cantidad de productos pertenecientes a cada sección. La
columna en la que se obtienen los resultados debe mostrarse con el nombre CANTIDAD. Ordena la
consulta de mayor a menor según los valores de la columna CANTIDAD. */

SELECT SECCION, COUNT(SECCION) AS CANTIDAD
FROM PRODUCTOS
GROUP BY SECCION
ORDER BY CANTIDAD DESC;

/*12. Utilizando la tabla PEDIDOS_NEPTUNO, calcula la cantidad de ventas efectuadas por mes y año. Las
columnas deben mostrarse con los nombres AÑO, MES y VENTAS respectivamente. Ordena el resultado
por año y mes, para obtener un listado cronológico de las ventas.*/

SELECT YEAR(FECHAPEDIDO) AS 'AÑO', MONTHNAME(FECHAPEDIDO) AS MES, COUNT(IDPEDIDO) AS VENTAS
FROM PEDIDOS_NEPTUNO
GROUP BY AÑO, MES
ORDER BY AÑO, MONTH(FECHAPEDIDO);

/*13. Utiliza la tabla PEDIDOS_NEPTUNO y calcula las estadísticas solicitadas*/

SELECT EMPLEADO, ROUND(SUM(CARGO), 2) AS FACTURACION, ROUND(AVG(CARGO), 2) AS PROMEDIO, MAX(CARGO) AS 'MEJOR VENTA',
MIN(CARGO) AS 'PEOR VENTA', COUNT(CARGO) AS VENTAS
FROM PEDIDOS_NEPTUNO
GROUP BY EMPLEADO;

