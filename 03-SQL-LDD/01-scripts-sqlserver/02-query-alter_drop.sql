--Crear base de datos de empresa patito
CREATE DATABASE empresapatito;
GO

--Usar la base de datos
USE empresapatito;
GO

--Crear tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
Nombre VARCHAR(100) not null,
Puesto VARCHAR (50),
FechaIngreso DATE,
salario DECIMAL (10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado)
);
Go

--Agregar una columna a la tabla empleados
ALTER TABLE empleados
ADD CorreoElectronico VARCHAR (100);
GO

SELECT * FROM empleados;

--Modificar el tipo de dato de un campo
ALTER TABLE empleados
ALTER COLUMN salario money not null;

--Renombrar un campo
EXEC sp_rename 'empleados.CorreoElectronico',
               'Email','COLUMN';
GO

--Crear tabla departamentos
CREATE TABLE departamentos (
IdDepartamento int not null identity (1,1) PRIMARY KEY,
NombreDepto VARCHAR (100)
);
GO

SELECT * FROM departamentos;

--Agregar un campo a la tabla empleados
--para que sea una foreign key
ALTER TABLE empleados
ADD IdDepartamento int not null;

--Agregar llave foranea
ALTER TABLE empleados
ADD CONSTRAINT fk_Empleados_departamento
FOREIGN KEY (idDepartamento)
REFERENCES departamentos(idDepartamento);
GO

--Eliminar la clave primaria de empleados
ALTER TABLE empleados
DROP CONSTRAINT pk_empleados;
GO

--Eliminar la foreign key de la tabla empleados
ALTER TABLE empleados
DROP CONSTRAINT fk_Empleados_departamento;
GO

--Eliminar la primary key de departamento
ALTER TABLE departamentos
DROP CONSTRAINT PK__departam__787A433DC0D79A99;
GO

--Crear un constraint de verificacion en salario
ALTER TABLE empleados 
ADD CONSTRAINT chk_salario
CHECK(salario > 0.0);
GO

CREATE TABLE categoria (
Id INT not null PRIMARY KEY DEFAULT -1,
Nombre VARCHAR(20),
Estatus CHAR (1) DEFAULT 'A',
);
GO

INSERT INTO categoria
VALUES (1,'carnes','D');

INSERT INTO categoria
VALUES (DEFAULT,'carnes', DEFAULT);

SELECT * FROM categoria;

DROP TABLE categoria;

--Eliminar la columna Email
ALTER TABLE empleados
DROP COLUMN Email;

ALTER TABLE empleados
ADD CONSTRAINT pk_empleados 
PRIMARY KEY (Idempleado);
GO

ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY (IdDepartamento);
GO

--Eliminar las tablas
DROP TABLE empleados;
GO

DROP TABLE departamentos;
Go

DROP TABLE categoria;
Go

USE master;
GO
--Eliminar la base de datos
DROP DATABASE e,empresapatito;
GO
