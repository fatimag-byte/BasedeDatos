#Crear base de datos de empresa patito
CREATE DATABASE empresapatito;

#Usar la base de datos
USE empresapatito;

#-Crear tabla empleados
CREATE TABLE empleados(
Idempleado INT not null,
Nombre VARCHAR(100) not null,
Puesto VARCHAR (50),
FechaIngreso DATE,
salario DECIMAL (10,2),
CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado)
);

#Agregar una columna a la tabla empleados
ALTER TABLE empleados
ADD COLUMN CorreoElectronico VARCHAR (100);


SELECT * FROM empleados;

#Modificar el tipo de dato de un campo
ALTER TABLE empleados
MODIFY COLUMN salario DECIMAL (12,2) not null;

#Renombrar un campo



#Crear tabla departamentos
CREATE TABLE departamentos (
IdDepartamento int not null AUTO_INCREMENT PRIMARY KEY,
NombreDepto VARCHAR (100)
);


SELECT * FROM departamentos;

#Agregar un campo a la tabla empleados
#para que sea una foreign key
ALTER TABLE empleados
ADD IdDepartamento int not null;

#Agregar llave foranea
ALTER TABLE empleados
ADD CONSTRAINT fk_Empleados_departamento
FOREIGN KEY (idDepartamento)
REFERENCES departamentos(idDepartamento);


#Eliminar la clave primaria de empleados
ALTER TABLE empleados
DROP PRIMARY KEY;

#Eliminar la foreign key de la tabla empleados
ALTER TABLE empleados
DROP FOREIGN KEY fk_Empleados_departamento;

#Eliminar el auto_increment
ALTER TABLE departamentos
MODIFY COLUMN idDepartamento INT not null;

#Eliminar la primary key de departamento
ALTER TABLE departamentos
DROP PRIMARY KEY;


#Crear un constraint de verificacion en salario
ALTER TABLE empleados 
ADD CONSTRAINT chk_salario
CHECK(salario > 0.0);


CREATE TABLE categoria (
Id INT not null PRIMARY KEY DEFAULT -1,
Nombre VARCHAR(20),
Estatus CHAR (1) DEFAULT 'A'
);


INSERT INTO categoria
VALUES (1,'carnes','D');

INSERT INTO categoria
VALUES (DEFAULT,'carnes', DEFAULT);

SELECT * FROM categoria;

DROP TABLE categoria;

#Eliminar la columna Email
ALTER TABLE empleados
DROP COLUMN Email;

ALTER TABLE empleados
ADD CONSTRAINT pk_empleados 
PRIMARY KEY (Idempleado);


ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY (IdDepartamento);


#Eliminar las tablas
DROP TABLE empleados;

DROP TABLE departamentos;

DROP TABLE categoria;

#Eliminar la base de datos
DROP DATABASE empresapatito;

