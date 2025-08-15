--hallar todos los representantes que o bien_
--a) trabajan en daimiel, Navarra o Castellon; o bien
--b) no tienen jefe y estan contratados desde junio de 1988; o
--c) auperan su cuota pero tienen ventas de 600000 o menos

SELECT r.Num_Empl AS [Numero Empleado],
       r.Nombre AS [Nombre Empleado],
	   r.Fecha_Contrato AS [Fecha Contrato],
	   r.Cuota AS[Cuota de Ventas],
	   r.Ventas AS [Ventas Totales],
	   o.Ciudad AS [Ciudad de la Oficina],
	   r.Jefe AS [Numero de Jefe]
FROM Representantes AS r
INNER JOIN Oficinas as o
ON o.Oficina = r.Oficina_Rep
WHERE (o.Ciudad IN ('Daimiel','Navarra','Castellón'))
OR (r.Jefe IS NULL AND Fecha_Contrato>='1988-06-01')
OR (r.Ventas>Cuota AND r.Ventas<=600000);

SELECT *
FROM Oficinas;

--Listar todos los pedidos mostrando el numero de pedido,
--su importe y el nombre y limite de credito del cliente

SELECT p.Num_Pedido AS [Numero de Pedido],
       p.Importe AS [Importe],
	   c.Empresa AS [Nombre del cliente],
	   c.Limite_Credito AS [Limite de credito del cliente]
FROM Pedidos AS p;

SELECT*
FROM Pedidos;
SELECT*
FROM Clientes;

--Listar las oficinas con un objetivo superior a 600000,
--mostrando, el nombre de la ciudad, el nombre del representante,
-- y su puesto
SELECT o.Ciudad AS [Oficina],
       r.Nombre AS [Representante],
	   r.Puesto AS [Puesto]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;

--Listar todos los pedidos mostrando el numero de pedido, el
--importe, el nombre y limite de credito del cliente
SELECT pe.Num_Pedido AS [Numero Pedido],
       pe.Importe AS [Importe],
	   c.Empresa AS [Cliente],
	   c.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS pe
INNER JOIN Clientes AS c
ON pe.Num_Pedido = c.Num_Cli;

--Listar cada representante mostrando su nombre, la ciudad 
--y la region en que trabajan
SELECT r.Nombre AS [Nombre Representante],
       o.Ciudad AS [Ciudad],
	   o.Region AS [Region]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Oficina = r.Oficina_Rep;

--Listar las oficinas (ciudad), nombres y puestos de sus jefes
SELECT r.Nombre AS [Nombre Representante],
       o.Ciudad AS [Ciudad],
	   o.Region AS [Region]
FROM Oficinas AS o
INNER JOIN Representantes AS r
ON o.Jef = r.Num_Empl;

--Listar todos los pedidos mostrando el numero de pedido, el importe y 
--la cantidad de cada producto
SELECT p.Num_Pedido AS [Numero Pedido],
       p.Importe AS [Importe],
	   pr.Stock AS [Cantidad],
	   pr.Descripcion AS [Descripcion]
FROM Pedidos AS p
INNER JOIN Productos AS pr
ON pr.Id_fab = p.Fab AND 
p.Producto = pr.Id_producto;

--Listar los nombres de los empleados y los nombres de sus jefes
SELECT empl.Nombre AS [Nombre Empleado],
       jefs.Nombre AS [Nombre Jefe]
FROM Representantes AS empl
INNER JOIN Representantes AS jefs
ON empl.Jefe = jefs.Num_Empl;

--Listar los pedidos con un importe superior a 25000,
--incluyendo el numero de pedido, importe,nombre del representante  que
--tomo nota del pedido y el nombre del cliente
SELECT p.Num_Pedido,
       p.Importe,
	   r.Nombre,
	   c.Empresa
FROM Pedidos AS p
INNER JOIN Representantes as r
ON r.Num_Empl = p.Rep
INNER JOIN Clientes as c
ON c.Num_CLi = p.Cliente
WHERE p.Importe > 25000;

--Listar los pedidos superiores a 250000 mostrando el 
--numero de pedido, nombre del cliente que lo encargo
--nombre del representante asignado al cliente y el importe
SELECT p.Num_Pedido AS [Numero pedido],
       c.Empresa AS [Cliente],
	   r.Nombre AS [Representante Cliente],
	   p.Importe  AS [Importe]    
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON p.Cliente = c.Num_Cli
INNER JOIN Representantes as r
ON c.Rep_Cli = r.Num_Empl
WHERE p.Importe >25000;

use bdg1joins;

SELECT *
FROM Categoria;

SELECT *
FROM Producto;
--

/*
  INNER JOIN
*/

SELECT *
FROM Categoria AS c
JOIN Producto as p
ON c.categoriaid = p.categoria;

/*
  LEFT JOIN o LEFT OUTER JOIN

  La primera tabla que aparece en el from es la tabla izquierda
*/
SELECT *
FROM Categoria AS c
LEFT OUTER JOIN Producto AS p
ON c.categoriaid = p.categoria;

--Mostrar todas las categorias que no
--tengan productos asignados
SELECT *
FROM Categoria AS c
LEFT JOIN Producto AS p
ON c.categoriaid = p.categoria
WHERE p.categoria IS NULL;

/*
  RIGHT JOIN O RIGHT OUTER JOIN

  Toma todos los datos de la tabla derecha y los que 
  --coinciden con la tabla izquierda, y los que no coinciden los pone en null
*/
SELECT *
FROM Categoria AS c
RIGHT JOIN Producto AS p
ON c.categoriaid = p.categoria;

--Selecciona todos aquellos productos que no tienen categoria asignada
SELECT p.nombre AS [Nombre Producto]
       p.precio AS [Precio]
FROM Categoria AS c
RIGHT JOIN Producto AS p
ON c.categoriaid = p.categoria
WHERE Categoria IS NULL;

/*
 FULL JOIN

 Obtiene los datos de la tabla izquierda, los datos de la tabla derecha 
 -- y todas las coincidencias entre las dos

*/
SELECT *
FROM Categoria AS c
FULL JOIN Producto AS p
ON c.categoriaid = p.categoria;

SELECT *
FROM Categoria AS c
CROSS JOIN Producto AS p;

SELECT *
FROM Categoria AS c,
Producto AS p
WHERE c.categoriaid = p.categoria;

/*

   AGRAGACION
   (solo me dan un resultado)

 count(*)-Cuenta la filas,
 coun (campo)-Cuenta las filas pero no cuenta los null,
 min()-obtiene el valor minimo de un campo,
 max()-obtiene el valor maximo de un campo,
 avg()-obtiene la media aritmetica o promedio de un campo,
 sum()--obtiene el total o la sumatoria

*/

USE NORTHWND;

--Cuantos clientes hay
SELECT COUNT (*) AS [Numero de clientes]
FROM Customers;

--Cuantas ventas se han realizado
SELECT COUNT (*)
FROM Orders;

--Cuantas ventas se relaizaron
SELECT COUNT (*)
FROM Orders
WHERE DATEPART (YEAR,OrderDate)=1996;

--Seleccionar la venta de la fecha mas antigua que se hizo
SELECT MIN(OrderDate) AS [Fecha Primera Venta] FROM
Orders;

--Seleccionar el total que se ha vendido
SELECT SUM(UnitPrice*Quantity) AS [Total de Ventas]
FROM [Order Details]

--Seleccionar el total de ventas entre 1996 y 1997
SELECT SUM(UnitPrice*Quantity) AS [Total de Ventas]
FROM [Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
WHERE DATEPART (YEAR,OrderDate) BETWEEN 1996 AND 1997
AND o.CustomerID='AROUT';

--Seleccionar las ventas totales hechas a cada uno de nuestros clientes
SELECT c.CompanyName AS [Cliente],
SUM(UnitPrice*Quantity) AS [Total de Ventas]
FROM [Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
INNER JOIN Customers AS c
ON c.CustomerID = O.CustomerID
WHERE DATEPART (YEAR,OrderDate) BETWEEN 1996 AND 1997
GROUP BY c.CompanyName;