--Crear la base de datos
CREATE DATABASE cursos;
GO

--Usar la base de datos
USE cursos;
GO

-- Tabla Curso
CREATE TABLE Curso (
    numeroCurso INT IDENTITY(1,1) NOT NULL,
    nombreCurso NVARCHAR(50) NOT NULL,
    codigo INT NOT NULL,
    CONSTRAINT pk_Curso
	PRIMARY KEY (numeroCurso),
    CONSTRAINT chk_codigo
	CHECK (codigo > 0)
);
GO

-- Tabla Estudiante
CREATE TABLE Estudiante (
    numeroEstudiante INT IDENTITY(1,1) NOT NULL,
    nombre NVARCHAR(50) NOT NULL,
    apPaterno NVARCHAR(50) NOT NULL,
    apMaterno NVARCHAR(50) NOT NULL,
    matricula INT NOT NULL,
    CONSTRAINT pk_Estudiante 
	PRIMARY KEY (numeroEstudiante),
    CONSTRAINT chk_matricula 
	CHECK (matricula > 0)
);
GO

-- Tabla Inscribe
CREATE TABLE Inscribe (
    numInscripcion INT IDENTITY(1,1) NOT NULL,
    numeroEstudiante INT NOT NULL,
    numCurso INT NOT NULL,
    CONSTRAINT pk_Inscribe 
	PRIMARY KEY (numInscripcion),
    CONSTRAINT fk_Inscribe_Estudiante 
	FOREIGN KEY (numeroEstudiante) 
	REFERENCES Estudiante(numeroEstudiante),
    CONSTRAINT fk_Inscribe_Curso
	FOREIGN KEY (numCurso)
	REFERENCES Curso(numeroCurso),
    CONSTRAINT chk_numeroEstudiante 
	CHECK (numeroEstudiante > 0),
    CONSTRAINT chk_numCurso 
	CHECK (numCurso > 0)
);
GO

-- Insertar datos en Curso
INSERT INTO Curso (
nombreCurso, 
codigo)
VALUES 
('Base de Datos', 101),
('Programacion', 102);
GO

-- Insertar datos en Estudiante
INSERT INTO Estudiante (
nombre, 
apPaterno,
apMaterno,
matricula)
VALUES
('Argos', 'Paredes', 'Delgadillo', 24300671),
('Dashen', 'Ortiz', 'Ramirez', 24300765);
GO

-- Insertar datos en Inscribe
INSERT INTO Inscribe (
numeroEstudiante,
numCurso)
VALUES
(1, 1), 
(2, 2); 
GO
 SELECT * FROM Curso;
 SELECT * FROM Estudiante;
 SELECT * FROM Inscribe;