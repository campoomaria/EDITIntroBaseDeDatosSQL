USE BONUS_TRACK;

DESC TOP_SPOTIFY; 

/*2-En el resultado de la consulta, sólo se deben observar las columnas ARTISTA, TÍTULO y GÉNERO.*/
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY;

/*4. Ordenar alfabéticamente el resultado de la consulta según los géneros musicales. */
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY
ORDER BY GENERO;

/*5. En el caso de aquellos géneros que se repiten, ordenar alfabéticamente los nombres de los artistas.*/
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY
ORDER BY GENERO, ARTISTA;

/*EJERCICIO2*/
/*1. En base al ejercicio anterior, mostrar todos los registros de la tabla TOP_SPOTIFY. En el resultado, 
sólo se deben observar las columnas ARTISTA, TÍTULO y GÉNERO.
Ordenar el resultado alfabéticamente según los nombres de los artistas y el nombre de las canciones. 
 Mostrar únicamente las 10 Primeras canciones.*/
SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY
ORDER BY  ARTISTA, TITULO
LIMIT 10;

/*2. Modificar la consulta anterior para mostrar únicamente las canciones ubicadas desde la posición 11 hasta la 15 inclusive.*/

SELECT ARTISTA, TITULO, GENERO FROM TOP_SPOTIFY
ORDER BY  ARTISTA, TITULO
LIMIT 11 OFFSET 16;

/*3. Dada la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones pertenecientes a la cantante Madonna. Debes mostrar
todos los campos de la tabla en el resultado de la consulta. */

SELECT * FROM TOP_SPOTIFY
WHERE ARTISTA='MADONNA'; 

/*4-a- partir de la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones pertenecientes al género Pop. Mostrar todos los
campos de la tabla en el resultado de la consulta y ordenar alfabéticamente el resultado según el nombre de las canciones*/

SELECT * FROM TOP_SPOTIFY
WHERE GENERO='POP'
ORDER BY TITULO; 

/*5. De la tabla TOP_SPOTIFY, obtener una lista de todas las canciones pertenecientes al
género Pop lanzadas durante el año 2015.
Mostrar todos los campos de la tabla en el resultado de la consulta y ordenar dicho resultado alfabéticamente según los nombres de
los artistas y los nombres de las canciones.*/

SELECT * FROM TOP_SPOTIFY
WHERE GENERO='POP' AND ANO=2015
ORDER BY ARTISTA, TITULO; 

/*6. A partir de la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones lanzadas antes del año 2011 y que pertenezcan al
género Dance Pop. Mostrar todos los campos de la tabla en el resultado de la consulta y
ordenar dicho resultado alfabéticamente según los nombres de las canciones.*/

SELECT * FROM TOP_SPOTIFY
WHERE GENERO='DANCE POP' AND ANO<2011
ORDER BY TITULO; 

