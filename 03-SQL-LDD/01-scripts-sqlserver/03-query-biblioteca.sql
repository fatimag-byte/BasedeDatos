-- Crear base de datos Biblioteca
CREATE DATABASE biblioteca;
GO

-- Usar la base de datos biblioteca
USE biblioteca;
GO

-- Crear tabla Libro con PK autoincrementable
CREATE TABLE libro(
    numeroLibro INT IDENTITY(1,1) NOT NULL,
    titulo NVARCHAR(50) NOT NULL,
    autor NVARCHAR(50) NOT NULL,
    isbn NCHAR(13) NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT pk_numeroLibro 
	PRIMARY KEY (numeroLibro),
    CONSTRAINT unique_isbn UNIQUE (isbn),
    CONSTRAINT chk_cantidad 
	CHECK (cantidad > 0 AND cantidad <= 1000)
);
GO

-- Mostrar todos los libros
SELECT * FROM libro;
GO

-- Crear tabla Lector con PK autoincrementable
CREATE TABLE lector(
    numeroLector INT IDENTITY(1,1) NOT NULL, 
    nombre NVARCHAR(50) NOT NULL,
    apellido_Paterno NVARCHAR(50) NOT NULL,
    apellido_Materno NVARCHAR(50), 
    numMembresia INT NOT NULL,
    CONSTRAINT pk_numeroLector 
	PRIMARY KEY (numeroLector),
    CONSTRAINT unique_numMembresia 
	UNIQUE (numMembresia)
);
GO

-- Mostrar todos los lectores
SELECT * FROM lector;
GO

-- Crear tabla Prestamo con PK autoincrementable y FK correctamente referenciadas
CREATE TABLE prestamo (
    numeroPrestamo INT IDENTITY(1,1) NOT NULL,
    numeroLibro INT NOT NULL,
    numeroLector INT NOT NULL,
    CONSTRAINT pk_numeroPrestamo
	PRIMARY KEY (numeroPrestamo),
    CONSTRAINT fk_numeroLibro 
	FOREIGN KEY (numeroLibro) 
	REFERENCES libro(numeroLibro),
    CONSTRAINT fk_numeroLector 
	FOREIGN KEY (numeroLector) 
	REFERENCES lector(numeroLector)
);
GO

-- Ejemplo para insertar datos en libro 
INSERT INTO libro (
titulo, 
autor,
isbn,
cantidad)
VALUES (
'Poesia Completa',
'Alejandra Pizarnik',
'1234567890123',
8);
GO

-- Ejemplo para insertar datos en lector 
INSERT INTO lector (
nombre,
apellido_Paterno,
apellido_Materno,
numMembresia)
VALUES (
'Fatima',
'Granados',
'De Jesus',
15);
GO

-- Ejemplo para insertar datos en prestamo 
INSERT INTO prestamo (
numeroLibro,
numeroLector)
VALUES (
1,
1);
GO

-- Mostrar todos los prestamos
SELECT * FROM prestamo;
GO
