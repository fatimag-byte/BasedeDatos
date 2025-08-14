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
SELECT p.Num_Pedido,
       c.Empresa,
	   r.Nombre,
	   p.Importe      
FROM Pedidos AS p
INNER JOIN Clientes AS c
ON p.Cliente = c.Num_Cli
INNER JOIN Representantes as r
ON c.Rep_Cli = r.Num_Empl
WHERE p.Importe >25000;