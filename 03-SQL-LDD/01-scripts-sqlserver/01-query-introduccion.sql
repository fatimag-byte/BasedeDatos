--Lenguaje SQL-LDD (CREATE,ALTER,DROP)

--Crear la base de datod empresa
CREATE DATABASE empresa;
Go
--Utilizar la base de datos creada
USE empresa;
Go

--Crear la tabla empleados
CREATE TABLE Empleados(
IdEmpleado int not null,
Nombre varchar(100) not null,
Puesto varchar (50) not null,
FechaIngreso date,
Salario money not null,
CONSTRAINT pk_empleados
PRIMARY KEY (IdEmpleado)
);
GO

CREATE TABLE Productos(
productoId int primary key,
NombreProducto nvarchar (50) not null,
Existencia int not null,
PrecioUnitario money not null
);
GO

CREATE TABLE Productos2(
ProductoId int not null identity(1,1),
NombreProducto nvarchar (50) not null,
Existencia int not null,
Precio money not null,
CONSTRAINT pk_productos2
PRIMARY KEY (ProductoId),
CONSTRAINT unique_nombreproducto
UNIQUE (NombreProducto),
CONSTRAINT chk_existencia
CHECK (Existencia>0 and Existencia<=100),
CONSTRAINT chk_precio4
CHECK (Precio>0.0)
);
GO

--Insertar un producto en productos sin identity
INSERT INTO Productos(productoId, NombreProducto,
Existencia,PrecioUnitario)
VALUES(1,'Burritos de Frijoles',65,20.99);
GO

SELECT * FROM productos;
GO

--Insertar en la tabla Productos2 con identity
INSERT INTO Productos2 (NombreProducto,
Existencia,Precio)
VALUES ('Burritos Chorizo Verde',100,21.0);
GO

INSERT INTO Productos2 (NombreProducto,
Existencia,Precio)
VALUES ('Burritos Chorizo Grueso',450,459.12);
GO

INSERT INTO Productos2 (NombreProducto,
Existencia,Precio)
VALUES ('Burritos frijol',450,459.12);
GO

SELECT * FROM Productos2;
GO

--Crear dos tablas con razon de cardinalidad 1:n con participacion total,
--esto quiere decir que la FK es not null

CREATE TABLE categoria(
CategoriaId int not null identity (1,1),
NombreCategoria nvarchar (20) not null,
CONSTRAINT pk_categoria
PRIMARY KEY (CategoriaId),
CONSTRAINT unique_nombrecategoria
UNIQUE(NombreCategoria)
);
GO

CREATE TABLE productos3(
ProductoId int not null identity(1,1),
NombreProducto nvarchar (20) not null,
Existencia int not null,
PrecioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos3
PRIMARY KEY (ProductoId),
CONSTRAINT chk_existencia3
CHECK (Existencia>0 and Existencia<=1000),
CONSTRAINT chk_preciounitario
CHECK (PrecioUnitario>0.0),
CONSTRAINT unique_nombreproducto3
UNIQUE(NombreProducto),
CONSTRAINT fk_productos3_categoria
FOREIGN KEY (CategoriaId)
REFERENCES categoria(CategoriaId)
);

