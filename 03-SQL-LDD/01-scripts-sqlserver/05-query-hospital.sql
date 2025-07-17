--Crear la base de datos 
CREATE DATABASE hospital;
GO
--Usar la base de datos
USE hospital;
GO

-- Tabla Doctor
CREATE TABLE Doctor (
    doctorid INT IDENTITY(1,1) NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    apPaterno NVARCHAR(50) NOT NULL,
    apMaterno NVARCHAR(50) NOT NULL,
    cedula INT NOT NULL,
    CONSTRAINT pk_Doctor 
	PRIMARY KEY (doctorid),
    CONSTRAINT unique_cedula
	UNIQUE (cedula),
    CONSTRAINT chk_doctorid
	CHECK (doctorid > 0),
    CONSTRAINT chk_cedula 
	CHECK (cedula > 0)
);
GO

-- Tabla Paciente
CREATE TABLE Paciente (
    pacienteid INT IDENTITY(1,1) NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    apPaterno NVARCHAR(50) NOT NULL,
    apMaterno NVARCHAR(50) NOT NULL,
    CONSTRAINT pk_Paciente 
	PRIMARY KEY (pacienteid),
    CONSTRAINT chk_pacienteid 
	CHECK (pacienteid > 0)
);
GO

-- Tabla Consultar
CREATE TABLE Consultar (
    numeroConsulta INT IDENTITY(1,1) NOT NULL,
    doctorid INT NOT NULL,
    pacienteid INT NOT NULL,
    fecha DATE NOT NULL,
    diagnostico NVARCHAR(100) NOT NULL,
    CONSTRAINT pk_Consultar 
	PRIMARY KEY (numeroConsulta),
    CONSTRAINT fk_Consultar_Doctor 
	FOREIGN KEY (doctorid)
	REFERENCES Doctor(doctorid),
    CONSTRAINT fk_Consultar_Paciente 
	FOREIGN KEY (pacienteid) 
	REFERENCES Paciente(pacienteid),
    CONSTRAINT chk_numeroConsulta 
	CHECK (numeroConsulta > 0),
    CONSTRAINT chk_doctorid_fk 
	CHECK (doctorid > 0),
    CONSTRAINT chk_pacienteid_fk 
	CHECK (pacienteid > 0),
    CONSTRAINT chk_diagnostico 
	CHECK (LEN(diagnostico) >= 5)
);
GO

-- Insertar datos en la tabla Doctor
INSERT INTO Doctor (
nombre,
apPaterno,
apMaterno,
cedula)
VALUES
('Isabel', 'Contreras', 'Barrera', 123456),
('Fernanda', 'Villegas', 'Enriquez', 987654);
GO

-- Insertar datos en Paciente
INSERT INTO Paciente (
nombre,
apPaterno,
apMaterno)
VALUES
('Citlali', 'Ramirez', 'Pascual'),
('Alejandro', 'Trejo', 'Sanchez');
GO

-- Insertar en Consultar
INSERT INTO Consultar (
doctorid, 
pacienteid,
fecha,
diagnostico)
VALUES
(1, 1, '2025-07-17', 'Gripe comun, se recomienda reposo y dieta blanda'),
(2, 2, '2025-07-16', 'Golpe, se recomienda desinflamante');
GO

SELECT * FROM Paciente;
SELECT * FROM Doctor;
SELECT * FROM Consultar;

