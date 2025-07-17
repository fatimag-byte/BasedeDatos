```sql
--Crear la base de datos
CREATE DATABASE company;
GO

--Usar la base de datos
USE company;
GO

-- crea la tabla department que contiene los departamentos existentes en la empresa
CREATE TABLE Department (
    departmentid INT PRIMARY 
	KEY IDENTITY(1,1),
    managerID INT NOT NULL,
    nameDepartment NVARCHAR(50) NOT NULL
);
GO

-- Crea la tabla location que guarda las ubicaciones de los departamentos
CREATE TABLE Location (
    locationid INT 
	PRIMARY KEY IDENTITY(1,1),
    departmentid INT NOT NULL,
    FOREIGN KEY (departmentid)
	REFERENCES Department(departmentid)
);
GO

-- Crea la tabla employee que almacena la informacion de los empleados
CREATE TABLE Employee (
    employid INT PRIMARY KEY IDENTITY(1,1),
    departmentid INT NOT NULL,
    managerid INT NOT NULL,
    ssn NVARCHAR(20) UNIQUE NOT NULL,
    firstName NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    salary MONEY NOT NULL, 
    street NVARCHAR(50) NOT NULL,
    numStreet NVARCHAR(50) NOT NULL,
    city NVARCHAR(50) NOT NULL,
    sex NVARCHAR(50) NOT NULL,
    birthdate NVARCHAR(50) NOT NULL,
    FOREIGN KEY (departmentid)
	REFERENCES Department(departmentid),
    FOREIGN KEY (managerid) 
	REFERENCES Employee(employid)
);
GO

-- Crea la tabla project donde se registran los proyectos
CREATE TABLE Project (
    projectid INT
	PRIMARY KEY IDENTITY(1,1),
    departmentid INT NOT NULL,
    locationid INT NOT NULL,
    nameProject NVARCHAR(50) NOT NULL,
    FOREIGN KEY (departmentid) 
	REFERENCES Department(departmentid),
    FOREIGN KEY (locationid)
	REFERENCES Location(locationid)
);
GO

-- Crea la tabla works_on que relaciona empleados con proyectos y sus horas trabajadas
CREATE TABLE WORKS_ON (
    employid INT NOT NULL,
    projectid INT NOT NULL,
    hours FLOAT NOT NULL,
    FOREIGN KEY (employid)
	REFERENCES Employee(employid),
    FOREIGN KEY (projectid) 
	REFERENCES Project(projectid)
);
GO

-- crea la tabla dependent para almacenar los dependientes de los empleados
CREATE TABLE Dependent (
    employid INT NOT NULL,
    firstName NVARCHAR(50) NOT NULL,
    lastName NVARCHAR(50) NOT NULL,
    sex NVARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    relationship NVARCHAR(50) NOT NULL,
    FOREIGN KEY (employid)
	REFERENCES Employee(employid)
);
GO

-- Datos en department
INSERT INTO Department (
managerID, 
nameDepartment
) VALUES 
(1, 'Recursos Humanos'),
(2, 'Desarrollo');
GO

-- Datos en location
INSERT INTO Location (
departmentid
) VALUES 
(1),
(2);
GO

-- insercion de datos en employee
INSERT INTO Employee (
    departmentid,
	managerid,
	ssn,
	firstName,
	lastName, 
	salary,
    street,
	numStreet,
	city,
	sex,
	birthdate
) VALUES
(1, 1, 'SSN100', 'Aldo', 'Maya', 38000.00, 'Av. Recuerdo', '15000', 'Santa Maria', 'Masculino', '2002-05-10'),
(2, 1, 'SSN101', 'Angel', 'Hernandez', 42000.00, 'Cerrito', '30000', 'El polo', 'Masculino', '2003-11-23');
GO

-- Datos en project
INSERT INTO Project (
departmentid, 
locationid,
nameProject
) VALUES 
(1, 1, 'Sistema de Nomina'),
(2, 2, 'Aplicacion Web Interna');
GO

-- Datos en works_on
INSERT INTO WORKS_ON (
employid, 
projectid,
hours
) VALUES 
(1, 1, 25.5),
(2, 2, 40.0);
GO

-- Datos en dependent
INSERT INTO Dependent (
employid,
firstName, 
lastName,
sex,
birthdate, 
relationship
) VALUES 
(1, 'Taylor', 'Swift', 'Femenino', '1998-13-12', 'Hija'),
(2, 'Carlos', 'Martinez', 'Masculino', '2015-04-22', 'Hijo');
GO
SELECT * FROM Department;
SELECT * FROM Location;
SELECT * FROM Employee;
SELECT * FROM Project;
SELECT * FROM WORKS_ON;
SELECT * FROM Dependent;


```