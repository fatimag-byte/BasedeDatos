--Lenguaje SQL-LMD
--Consultas Simples

USE NORTHWND;
GO

--Seleccionar todos los clientes
SELECT * FROM Customers;

--Seleccionar todos los clientes pero salamente mostrando,
--la clase, nombre del cliente, la ciudad y el pais (proyeccion)

SELECT CustomerID,CompanyName,City,Country
FROM Customers;

--Alias de columna
SELECT  CustomerID AS NumeroCliente,CompanyName AS 'NombreCliente',
City,Country AS [ciudad chida]
FROM Customers;

--Campos calculados
--seleccionar las ordenes de compra mostrando productos, la cantidad
--vendida, precio de venta, el descuento y total

SELECT  ProductID AS  [Nombre Producto],UnitPrice AS  [Precio],
Quantity AS  [Cantidad], Discount AS [Descuento],
(UnitPrice * Quantity) AS  [Importe Sin Descuento],
(UnitPrice * Quantity * (1 -Discount)) AS  [Importe]
FROM [Order Details];

--Seleccionar las ordenes de compra mostrando el cliente al que se le
--vendio, el empleado que la realizo, la fecha de la orden, el transportista
--y la fecha de la orden, dividirla en año, mes dia, trimestre.

SELECT 
    OrderID AS [Numero de Orden],
    OrderDate AS [Fecha de Orden],
    CustomerID AS [Cliente],
    ShipVia AS [Transportista],
    EmployeeID AS [Empleado],
    DATEPART(YEAR, OrderDate) AS [Año de la compra],
    DATEPART(MONTH, OrderDate) AS [Mes de la compra],
    DATEPART(DAY, OrderDate) AS [Día de la compra],
    DATEPART(QUARTER, OrderDate) AS [Trimestre],
    DATEPART(WEEK, OrderDate) AS [Semana],
    DATEPART(WEEKDAY, OrderDate) AS [Día Semana],
	DATENAME(WEEKDAY,OrderDate) AS [Nombre dia]
FROM Orders
ORDER BY 9;

--ORDER BY para ordenar los datos de forma ascendente y descendente
--Seleccionar los empleados ordenados por su pais 

SELECT (TitleOfCourtesy + 'FisrtName' + '' + LastName) AS [Nombre Completo],
country AS [Pais], City AS [Ciudad]
FROM Employees;

--Usar funcion CONCAT 
SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY country ASC;

SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY country DESC;

SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY 2 DESC;

SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName);

--Ordenar por alias
SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY [Nombre Completo];

--Ordeno de forma ascendente por el pais
SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY country,city;

SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY country DESC,city;

SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY country DESC, city DESC ;

SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY country ASC ,city DESC;

SELECT CONCAT (TitleOfCourtesy , 'FisrtName' , ''  , LastName) AS [Nombre Completo],
country AS [Pais], 
City AS [Ciudad]
FROM Employees
ORDER BY 1 DESC, country DESC, 3 DESC;



--ctrl+CK para hacer comentarios
--Seleccionar todos los productos que suprecio
--sea mayor a 40.3 (mostrar el numero del producto), nombre del producto
--y el precio unitario

SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre producto],
UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice >= 40.3;
--una consulta se muestra si es true, si es false
--no lo manda

SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers' ;

SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName <> 'Carnarvor Tigers' ;


SELECT ProductID AS [Numero de Producto],
ProductName AS [Nombre producto],
UnitPrice AS [Precio]
FROM Products
WHERE ProductName != 'Carnarvor Tigers' ;
--para poner diferente !=
--lenguaje Transact-SQL (T-SQL)
--diferencia entre igual e igual que en base de datos
--en base de datos un = es un igual que (compara)

--Seleccionar todas las ordenes que sean de
--brazil - rio de janeiro, mostrando
--solo el numero de orden, la fecha de 
--orden, pais de envio, ciudad y su transportista

SELECT OrderID AS [Numero Orden],
OrderDate AS [Fecha de Orden],
ShipCountry AS [Pais de  Envio],
ShipCity AS [Ciudad de Envio],
ShipVia AS [Transportista]
FROM Orders
WHERE ShipCity = 'Rio de Janeiro';

--INNER JOIN, NO IMPORTA LA POSICION
SELECT  O.OrderID AS [Numero Orden],
O.OrderDate AS [Fecha de Orden],
O.ShipCountry AS [Pais de  Envio],
O.ShipCity AS [Ciudad de Envio],
S.ShipperID AS [Numero de Transportista],
S.CompanyName AS [Transportista]
FROM Orders AS O
INNER JOIN Shippers AS S
ON S.ShipperID = O.ShipVia
WHERE ShipCity = 'Rio de Janeiro';

--Seleccionar todas las ordenes 
-- mostrando lo mismo que la consulta anterior
-- pero todas aquellas que no tengan region de envio

SELECT OrderID AS [Numero Orden],
OrderDate AS [Fecha de Orden],
ShipCountry AS [Pais de  Envio],
ShipCity AS [Ciudad de Envio],
ShipVia AS [Transportista],
ShipRegion AS [Region de Envio]
FROM Orders
WHERE ShipRegion IS NULL;

SELECT OrderID AS [Numero Orden],
OrderDate AS [Fecha de Orden],
ShipCountry AS [Pais de  Envio],
ShipCity AS [Ciudad de Envio],
ShipVia AS [Transportista],
ShipRegion AS [Region de Envio]
FROM Orders
WHERE ShipRegion IS NOT NULL;

--Seleccionar todas las ordenes
--enviadas a Brazil, Alemania y Mexico
-- que tengan region, ordenar de
--forma descendente por el shipCountry
SELECT OrderID AS [Numero Orden],
OrderDate AS [Fecha de Orden],
ShipCountry AS [Pais de  Envio],
ShipCity AS [Ciudad de Envio],
ShipVia AS [Transportista],
ShipRegion AS [Region de Envio]
FROM Orders
WHERE (ShipCountry='Brazil' OR
ShipCountry='Germany' OR
ShipCountry='Mexico') OR
ShipRegion IS NOT NULL;

USE BDEJEMPLO2;
GO

--Seleccionar cuantos puestos diferentes 
--tienen los representantes

SELECT * FROM Representantes;

SELECT DISTINCT Puesto
FROM Representantes;

--SELECCIONAR TODOS LOS PAISES DIFERENTES DE MIS CLIENTES
SELECT DISTINCT country, CITY
FROM Customers;

--PAISES Y CIUDADES DIFERENTES, CUANTOS CLIENTES
SELECT DISTINCT country, CITY,COMPANYNAME
FROM Customers
ORDER BY 1 ASC;

SELECT DISTINCT country, CITY,COMPANYNAME
FROM Customers
WHERE CITY = 'buenos aires';

SELECT DISTINCT CategoryID
FROM PRODUCTS;

--Cuantos puestos diferentes tienen los representantes
--FUNCION DE AGREGADO
--COUNT (*)
--COUNT (campo)
--MAX 
--MIN
--SUM suma
--AVG promedio
--Las funciones de agregado salamente regregan un solo registro
--y no se pueden utilizar un campo
--que no sea una funcion de agregado si no utiliza un group by

SELECT COUNT (DISTINCT Puesto) AS [Numero de Puestos]
FROM Representantes;

--Seleccionar el precio minimo de los productos
SELECT *
FROM Productos
ORDER BY Precio ASC;

SELECT MIN (Precio) AS [Precio Minimo]
FROM Productos;

--Listar las oficinas cuyas ventas estan por debajo del 80% de sus objetivos
SELECT Ciudad,Ventas, (.8*Objetivo) AS [80% DEL OBJETIVO]
FROM Oficinas
WHERE Ventas < (.8*Objetivo);

--Seleccionar los primeros 5 registros de los pedidos
SELECT TOP 5 Num_Pedido,Fecha_Pedido,Cantidad,Importe
FROM Pedidos
ORDER BY 4 DESC;

--TEST DE Rango (BETWEEN)
--Hayar los pedidos del ultimo trimestre de 1989
--Nos da la fecha del sistema GETDATE
SELECT Num_Pedido,Fecha_Pedido, FAB, PRODUCTO, Importe
FROM Pedidos
WHERE FECHA_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
ORDER BY Fecha_Pedido DESC;

SELECT Num_Pedido,Fecha_Pedido, FAB, PRODUCTO, Importe
FROM Pedidos
WHERE DATEPART (QUARTER,Fecha_Pedido)=4
ORDER BY Fecha_Pedido DESC;

--Hallar los pedidos que se tienen un importe entre 30000 y
--3999.99
SELECT Num_Pedido,Fecha_Pedido, FAB, PRODUCTO, Importe
FROM Pedidos
WHERE Importe BETWEEN 30000.00 AND 39999.99;

SELECT Num_Pedido,Fecha_Pedido, FAB, PRODUCTO, Importe
FROM Pedidos
WHERE Importe >= 30000.00 AND Importe <= 39999.99;

--Lista de representantes cuyas ventas no se encuentran
--entre 80 y el 120 por ciento de su cuota

SELECT Num_Empl,Nombre,PUESTO,Cuota,Ventas
FROM Representantes
WHERE Ventas NOT BETWEEN (Cuota*.80) AND (Cuota*1.2);

SELECT Num_Empl,Nombre,PUESTO,Cuota,Ventas
FROM Representantes
WHERE NOT(Ventas>=(Cuota*.80) AND Ventas<= (Cuota*1.2));

--Test de pertenencia a conjuntos (IN)
--Hallar los pedidos de cuatro representantes en concreto

SELECT Num_Pedido,Fecha_Pedido,Importe,REP
FROM Pedidos
WHERE REP IN (107,109,101,103);

SELECT Num_Pedido,Fecha_Pedido,Importe,REP
FROM Pedidos
WHERE REP = 107 OR
      REP = 109 OR
	  REP = 101 OR
	  REP = 103;



SELECT Num_Pedido,Fecha_Pedido,Importe,REP
FROM Pedidos
WHERE NOT (REP = 107 OR
      REP = 109 OR
	  REP = 101 OR
	  REP = 103);

SELECT Num_Pedido,Fecha_Pedido,Importe,REP
FROM Pedidos
WHERE REP NOT IN (107,109,101,103);

--Test de encaje de patrones (like)
SELECT *
FROM CLIENTES
WHERE Empresa Like 'A%';

SELECT *
FROM CLIENTES
WHERE Empresa Like 'L%';

SELECT *
FROM CLIENTES
WHERE Empresa Like '%er%';

SELECT *
FROM Clientes
WHERE Empresa LIKE '[A-D]%';

SELECT *
FROM Clientes
WHERE Empresa LIKE '[ADf]%';


SELECT *
FROM Clientes
WHERE Empresa LIKE '_ilas';


SELECT *
FROM Clientes
WHERE Empresa LIKE '____';

SELECT *
FROM Clientes
WHERE Empresa LIKE '[^ADf]%';

--hallar todos los representantes que o bien_
--a) trabajan en daimiel, Navarra o Castellon; o bien
--b) no tienen jefe y estan contratados desde junio de 1988; o
--c) auperan su cuota pero tienen ventas de 600000 o menos

SELECT*
FROM Representantes
WHERE Oficina_Rep IN (11,12,22) 
OR (Jefe IS NULL AND Fecha_Contrato>='1988-06-01')
OR (Ventas>Cuota AND Ventas<=600000);

