-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

SELECT id, ciudad FROM oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

 SELECT ciudad, telefono FROM oficina WHERE pais = 'España';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

SELECT nombre, apellido1, email 
FROM empleado 
WHERE id_jefe = 7;

-- 4. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
-- Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- • Utilizando la función YEAR de MySQL.
-- • Utilizando la función DATE_FORMAT de MySQL.

SELECT DISTINCT fk_pago_cliente
FROM pago
WHERE YEAR(fecha_pago) = 2008;

SELECT DISTINCT fk_pago_cliente
FROM pago
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

-- 5. ¿Cuántos empleados hay en la compañía?

SELECT COUNT(*) AS cantidad_empleados
FROM empleado;

-- 6. ¿Cuántos clientes tiene cada país?

SELECT pais,count(*) AS cantidad_cleintes
FROM cliente GROUP BY pais;

-- 7. ¿Cuál fue el pago medio en 2009?

SELECT AVG(total) AS pago_medio_2009
FROM pago
WHERE YEAR(fecha_pago) = 2009;

-- 8. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

SELECT estado, COUNT(*) AS cantidad_de_pedidos
FROM pedido
GROUP BY estado
ORDER BY cantidad_de_pedidos DESC;

-- 9. Calcula el precio de venta del producto más caro y barato en una misma consulta.

SELECT MAX(precio_venta) AS precio_mas_caro, MIN(precio_venta) AS precio_mas_barato
FROM producto;

-- 10. Devuelve el nombre del cliente con mayor límite de crédito.

SELECT nombre
FROM cliente
WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente);

-- 11. Devuelve el nombre del producto que tenga el precio de venta más caro

SELECT nombre
FROM producto
WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto);

-- 12. Devuelve el nombre del producto del que se han vendido más unidades.
-- (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades 
-- que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)

SELECT p.nombre
FROM producto p
INNER JOIN detalle_pedido dp ON p.id = dp.id_producto
GROUP BY p.id
ORDER BY SUM(dp.cantidad) DESC
LIMIT 1;

-- 13. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
-- realizado. (Sin utilizar INNER JOIN).

SELECT c.nombre
FROM cliente c
WHERE c.limite_credito > (SELECT SUM(p.total) FROM pago p WHERE p.fk_pago_cliente = c.id);

-- 14. Devuelve el listado de clientes indicando el nombre del cliente y cuantos
-- pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no
-- han realizado ningún pedido.

SELECT c.nombre, COUNT(p.id) AS cantidad_pedidos
FROM cliente c LEFT JOIN pedido p ON c.id = p.id_cliente
GROUP BY c.id,c.nombre;

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
-- empleados que no sean representante de ventas de ningún cliente.

SELECT e.nombre, e.apellido1, e.puesto, o.telefono
FROM empleado e
JOIN oficina o ON e.id_oficina = o.id
WHERE e.id NOT IN (SELECT DISTINCT id_empleado FROM cliente);

-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
-- hayan sido los representantes de ventas de algún cliente que haya realizado
-- la compra de algún producto de la gama Frutales.

SELECT o.id, o.ciudad
FROM oficina o
WHERE o.id NOT IN (
    SELECT DISTINCT e.id_oficina
    FROM empleado e
    JOIN cliente c ON e.id = c.id_empleado
    JOIN pedido p ON c.id = p.id_cliente
    JOIN detalle_pedido dp ON p.id = dp.id_pedido
    JOIN producto pr ON dp.id_producto = pr.id
    JOIN gama_producto gp ON pr.gama = gp.id
    WHERE gp.gama = 'Frutales' AND e.puesto = 'Representante de Ventas'
);

-- 18. Devuelve un listado con los nombres de los clientes y el total pagado por
-- cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han
-- realizado ningún pago

SELECT c.nombre, SUM(p.total) AS total_pagado
FROM cliente c
LEFT JOIN pago p ON c.id = p.fk_pago_cliente
GROUP BY c.id, c.nombre;