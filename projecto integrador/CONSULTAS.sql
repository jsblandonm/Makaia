USE ventas;

-- 1 
-- Devuelve un listado con todos los pedidos que se han realizado. 
-- Los pedidos deben estar ordenados por la fecha de realización,
-- mostrando en primer lugar los pedidos más recientes.

SELECT * FROM pedido
ORDER BY fecha DESC;

--  2 
-- Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT * FROM pedido
ORDER BY total DESC
LIMIT 2;

-- 3 
-- Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

SELECT DISTINCT id_cliente 
AS identifiadores FROM pedido;

-- 4 
-- Devuelve un listado de todos los pedidos que se realizaron durante el año 2017,
-- cuya cantidad total sea superior a 500€.

SELECT * FROM pedido
WHERE year(fecha) = 2017
GROUP BY id 
HAVING SUM(total) > 500;

-- 5 
-- Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT nombre,apellido1 FROM comercial
WHERE comision BETWEEN 0.05 AND 0.11;

-- 6 
-- Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

SELECT p.* FROM pedido p
JOIN (
	SELECT YEAR(fecha) AS anio, MAX(total) AS Valor_Maximo_Pedido
    FROM pedido
    GROUP BY YEAR(fecha)
)subquery
ON YEAR(p.fecha) = subquery.anio AND p.total = subquery.Valor_Maximo_Pedido;

-- 7
-- Devuelve el número total de pedidos que se han realizado cada año.

SELECT YEAR(fecha) AS anio, 
COUNT(*) AS total_pedidos
FROM pedido
GROUP BY YEAR(fecha);


-- 8
-- Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

SELECT MAX(comision) AS max_valor_comision
FROM comercial;

-- 9
-- Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido.
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

SELECT DISTINCT id,nombre,apellido1 FROM cliente
WHERE id IN(SELECT DISTINCT id_cliente FROM pedido)
ORDER BY nombre,apellido1;


-- 10
-- Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente.
-- El resultado debe mostrar todos los datos de los pedidos y del cliente.
-- El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

SELECT c.id AS id_cliente, c.nombre AS nombre_cliente,
c.apellido1 AS appellidos_cliente, p.* FROM cliente c
JOIN pedido p ON c.id = p.id_cliente		
ORDER BY c.nombre, c.apellido1;

-- 11
-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

SELECT * FROM pedido
WHERE id_cliente = (
	SELECt id FROM cliente
    WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Diaz'
);

-- 12
-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

SELECT c.*
FROM cliente c
WHERE c.id = (
    SELECT p.id_cliente
    FROM pedido p
    WHERE YEAR(p.fecha) = 2019
    ORDER BY p.total DESC
    LIMIT 1
);

-- 13
-- Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT *
FROM cliente
WHERE id NOT IN (SELECT DISTINCT id_cliente FROM pedido);

-- 14
-- Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

SELECT *
FROM comercial
WHERE id NOT IN (SELECT DISTINCT id_comercial FROM pedido);


