-- Crear Base de Datos
CREATE DATABASE restriccionesbdg1;

--Utilizar la base de datos
Use restriccionesbdg1;

--Crear la tabla categoria
CREATE TABLE categoria (
categoriaid int,
nombre nvarchar(30)
);
INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(1,'Vinos y Licores');

INSERT INTO categoria
VALUES(null,'Ropa');

SELECT * FROM categoria;

--Eliminar tabla
DROP TABLE categoria;

--Volver a crear tabla con restricciones
CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar (30)
--Aplicar restriccion a la base de datos
constraint pk_categoria
primary key(categoriaid)
)
INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

INSERT INTO categoria
VALUES(3,'Ropa');

INSERT INTO categoria
VALUES(4,'Ropa');

SELECT * FROM categoria;

DROP TABLE categoria;

--Volver a crear tabla con todas las restricciones unique
CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar (30) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique (nombre)
);

SELECT * FROM categoria; 

DROP TABLE categoria;

--Ultimas restricciones FOREING KEY
CREATE TABLE categoria(
categoriaid int not null,
nombre nvarchar (30) not null,
constraint pk_categoria
primary key(categoriaid),
constraint unique_nombre
unique (nombre)
);

CREATE TABLE producto(
productoid int not null,
nombreprod nvarchar (20) not null,
precio money not null,
existencia numeric (10,2) not null,
categoria int,
--Nombre de la restriccion
constraint pk_producto
--Tipo de restriccion
primary key(productoid),
constraint unique_nombreprod
unique(nombreprod),
constraint chk_precio
check(precio>0 and precio<=4000),
constraint chk_existencia
check(existencia>=0),
constraint fk_producto_categorias
foreign key (categoria)
references categoria (categoriaid)
);

SELECT * FROM producto

DROP TABLE producto

INSERT INTO categoria
VALUES(1,'Carnes Frias');

INSERT INTO categoria
VALUES(2,'Vinos y Licores');

INSERT INTO producto
VALUES (1, 'Tonayan',4000,4,2);

INSERT INTO producto
VALUES (2,'tonayan2',1250.6,40,2);

INSERT INTO producto
VALUES (3,'Bucañas',200,8,2);

INSERT INTO producto
VALUES (4,'Calzon chino',6.3,890,8);










