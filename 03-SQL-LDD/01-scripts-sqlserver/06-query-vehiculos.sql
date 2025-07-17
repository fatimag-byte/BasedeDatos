-- Crear base de datos agenciaRenta
CREATE DATABASE agenciaRenta;
GO

-- Usar base de datos
USE agenciaRenta;
GO

-- Crear tabla Clientes
CREATE TABLE Clientes (
    numCliente INT IDENTITY(1,1) NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    apellido_Paterno NVARCHAR(20) NOT NULL,
    apellido_Materno NVARCHAR(20) NOT NULL,
    telefono NCHAR(12) NULL,
    calle NVARCHAR(20) NOT NULL,
    numeroCalle NVARCHAR(12) NULL,
    ciudad NVARCHAR(12) NOT NULL,
    curp NCHAR(18) NOT NULL,
    CONSTRAINT pk_Clientes 
	PRIMARY KEY (numCliente),
    CONSTRAINT unique_curp 
	UNIQUE (curp),
    CONSTRAINT chk_numCliente 
	CHECK (numCliente > 0)
);
GO

-- Crear tabla Vehiculo
CREATE TABLE Vehiculo (
    numeroVehiculo INT IDENTITY(1,1) NOT NULL,
    marca NVARCHAR(20) NOT NULL,
    modelo NVARCHAR(20) NOT NULL,
    año INT NOT NULL,
    placa NVARCHAR(20) NOT NULL,
    CONSTRAINT pk_Vehiculo 
	PRIMARY KEY (numeroVehiculo),
    CONSTRAINT unique_placa
	UNIQUE (placa)
);
GO

-- Crear tabla Sucursal
CREATE TABLE Sucursal (
    numeroSucursal INT IDENTITY(1,1) NOT NULL,
    numeroVehiculo INT NOT NULL,
    nombre NVARCHAR(20) NOT NULL,
    calle NVARCHAR(20) NOT NULL,
    numeroCalle NVARCHAR(12) NOT NULL,
    ciudad NVARCHAR(12) NOT NULL,
    CONSTRAINT pk_Sucursal 
	PRIMARY KEY (numeroSucursal),
    CONSTRAINT unique_vehiculoSucursal 
	UNIQUE (numeroVehiculo),
    CONSTRAINT fk_vehiculoSucursal 
	FOREIGN KEY (numeroVehiculo)
	REFERENCES Vehiculo(numeroVehiculo)
);
GO

-- Crear tabla Renta
CREATE TABLE Renta (
    numRenta INT IDENTITY(1,1) NOT NULL,
    numCliente INT NOT NULL,
    numVehiculo INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaTermino DATE NOT NULL,
    CONSTRAINT pk_Renta 
	PRIMARY KEY (numRenta),
    CONSTRAINT fk_Renta_Cliente 
	FOREIGN KEY (numCliente) 
	REFERENCES Clientes(numCliente),
    CONSTRAINT fk_Renta_Vehiculo
	FOREIGN KEY (numVehiculo)
	REFERENCES Vehiculo(numeroVehiculo),
    CONSTRAINT chk_numRenta 
	CHECK (numRenta > 0),
    CONSTRAINT chk_numCliente 
	CHECK (numCliente > 0),
    CONSTRAINT chk_numVehiculo 
	CHECK (numVehiculo > 0)
);
GO

-- Insertar datos en Clientes
INSERT INTO Clientes (
Nombre, 
apellido_Paterno,
apellido_Materno,
telefono, 
calle,
numeroCalle, 
ciudad, 
curp)
VALUES 
('Argos', 'Paredes', 'Delgadillo', '7732269711', 'Av. Rosal', '102A', 'San Mateo', 'ARGO901223PDFRRL01'),
('Fatima', 'Granados', 'De Jesus', '7732161717', '1ro de mayo', '299B', 'Santa Maria', 'GAJF920101MDFRR02');
GO

-- Insertar datos en Vehiculo
INSERT INTO Vehiculo (
marca,
modelo,
año,
placa)
VALUES
('Toyota', 'Corolla', 2020, 'ABC1234'),
('Nissan', 'Sentra', 2019, 'XYZ5678');
GO

-- Insertar datos en Sucursal
INSERT INTO Sucursal (
numeroVehiculo, 
nombre,
calle,
numeroCalle, 
ciudad)
VALUES
(1, 'Sucursal Centro', 'trabajo', '10', 'Tepeji'),
(2, 'Sucursal Norte', 'josefina', '55', 'Tepeji');
GO

-- Insertar datos en Renta
INSERT INTO Renta (
numCliente, 
numVehiculo,
fechaInicio,
fechaTermino)
VALUES
(1, 1, '2025-07-15', '2025-07-20'),
(2, 2, '2025-07-16', '2025-07-22');
GO

SELECT * FROM Clientes;
SELECT * FROM Vehiculo;
SELECT * FROM Sucursal;
SELECT * FROM Renta;