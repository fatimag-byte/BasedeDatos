CREATE DATABASE ejercicio1999;


USE ejercicio1999;


CREATE TABLE Empleado (
empleadoId INT not null AUTO_INCREMENT,
Nombre NVARCHAR (15) not null,
Apellido1 NVARCHAR (15) not null,
Apellido2 NVARCHAR (15),
Direccion NVARCHAR (50) not null,
Salario DECIMAL (10,2) not null,
#Recursiva
Jef INT,
departamento INT not null,
CONSTRAINT pk_empleado
PRIMARY KEY (empleadoId),
CONSTRAINT chk_salario
CHECK (Salario between 200 and 50000),
CONSTRAINT fk_empleado_jefe
FOREIGN KEY (Jef)
REFERENCES Empleado (Empleadoid)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


CREATE TABLE Departamento (
Departamentoid INT not null AUTO_INCREMENT,
NombreDepto NVARCHAR (15) not null,
estatus CHAR (2) not null,
administrador INT not null,
CONSTRAINT pk_departamento
PRIMARY KEY (Departamentoid),
CONSTRAINT unique_nombredepto
UNIQUE (NombreDepto),
CONSTRAINT chk_estatus
CHECK (estatus IN ('SI','NO')),
-- fk_depto_empleado
CONSTRAINT fk_empleado_depto
FOREIGN KEY (administrador)
REFERENCES Empleado (empleadoid)
);


ALTER TABLE Empleado
ADD CONSTRAINT fk_empleado_depto1
FOREIGN KEY (departamento)
REFERENCES Departamento (Departamentoid);


CREATE TABLE Ubicacion (
Ubicacionid INT not null AUTO_INCREMENT,
Ubicacion NVARCHAR (15) not null,
Deptoid INT not null,
CONSTRAINT pk_ubicacion
PRIMARY KEY (Ubicacionid),
CONSTRAINT inique_deptoid
UNIQUE (Deptoid),
CONSTRAINT fk_ubicacion_depto
FOREIGN KEY (Deptoid)
REFERENCES Departamento (Departamentoid)
);
