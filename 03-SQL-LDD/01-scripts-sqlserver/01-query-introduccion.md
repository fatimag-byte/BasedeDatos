```sql
-Lenguaje SQL-LDD (CREATE,ALTER,DROP)

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

--crear dos tablas con razon de cardinalidad de 1 a n con participacion total,esto quiero decir que la foren key es not null
CREATE TABLE categoria(
CategoriaId int not null identity(1,1),
NombreCategoria nvarchar(20) not null,
constraint pk_categoria
PRIMARY KEY(CategoriaId),
CONSTRAINT unique_nombrecategoria
UNIQUE(NombreCategoria)
);
GO

create table productos3(
ProductosId int not null identity(1,1),
NombreProducto nvarchar(20) not null,
Existencia int not null,
precioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos3
Primary key (ProductosId),
CONSTRAINT chk_existencia3
CHECK (Existencia >0 and Existencia<=1000),
CONSTRAINT chk_preciounitario
CHECK (PrecioUnitario >0.0 ),
CONSTRAINT unique_nombreproducto3
UNIQUE(NombreProducto),
CONSTRAINT fk_productos3_categoria
FOREIGN KEY(CategoriaId)
REFERENCES categoria(CategoriaId)
);
GO



--crear dos tablas con razon de cardinalidad de 1 a n con participacion total,esto quiero decir que la foren key es not null
CREATE TABLE categoria2(
Id int not null identity(1,1),
NombreCategoria nvarchar(20) not null,
constraint pk_categoria1
PRIMARY KEY(Id),
CONSTRAINT unique_nombrecategoria1
UNIQUE(NombreCategoria)
);
GO

create table productos4(
ProductosId int not null identity(1,1),
NombreProducto nvarchar(20) not null,
Existencia int not null,
precioUnitario money not null,
CategoriaId int not null,
CONSTRAINT pk_productos4
Primary key (ProductosId),
CONSTRAINT chk_existencia4
CHECK (Existencia >0 and Existencia<=1000),
CONSTRAINT chk_preciounitario2
CHECK (PrecioUnitario >0.0 ),
CONSTRAINT unique_nombreproducto4
UNIQUE(NombreProducto),
CONSTRAINT fk_productos4_categoria3
FOREIGN KEY(CategoriaId)
REFERENCES categoria2(Id)
);
GO
CREATE  Table tabla1(
tabla1ID int not null identity(1,1) ,
tablaID2 int not null ,
NombreTabla1 nvarchar(20) not null,
CONSTRAINT pk_tabla1
primary key(tabla1ID,tablaID2 )
);
GO

CREATE TABLE tabla2(
tabla2ID int not null identity(1,1),
tabla1ID int ,
tablaID2 int ,
NombreTabla2 nvarchar (20),
CONSTRAINT pk_tabla2
primary key (tabla2ID),
constraint fk_tabla2_tabla1
FOREIGN KEY (tabla1ID,tablaID2)
References tabla1(tabla1ID,tablaID2)
);
Go

--Crear tablas con una razon de cardinalidad 1:1
CREATE TABLE employee (
id int not null identity(1,1),
nombre nvarchar(20) not null,
ap1 nvarchar(20) not null,
ap2 nvarchar(20) not null,
sexo char (1) not null,
salario money not null,
CONSTRAINT pk_employee
PRIMARY KEY (id)
);
GO

create table department(
id int not null identity(1,1),
nombre nvarchar(20)not null,
ubicacion nvarchar(20)not null,
employeid int not null,
constraint pk_deparment
primary key (id),
constraint fk_employee_deparment
foreign key(employeid)
references employee(id),
constraint unique_employ
UNIQUE(employeid)
);
GO
```