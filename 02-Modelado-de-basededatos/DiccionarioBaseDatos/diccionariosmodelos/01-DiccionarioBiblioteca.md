**Tabla Libro**
| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK          | Referencia a | Descripción                    |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | ------------------------------ | ------------ | ------------------------------ |
| `numeroLibro` | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                            | -            | Identificador del libro        |
| `titulo`      | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | Longitud >= 3                  | -            | Titulo del libro               |
| `autor`       | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | Solo letras A-Z | -            | Nombre del autor del libro     |
| `isbn`        | NCHAR        | 13     | ❌  | ❌  | ❌    | ✅     | Longitud fija = 13             | -            | Cdigo ISBN del libro          |
| `cantidad`    | INT          | -      | ❌  | ❌  | ❌    | ❌     | CHECK (cantidad >= 0)          | -            | Cantidad de libros disponibles |

**Tabla Lector**
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numeroLector`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del numero de lector              |
| `Nombre`        | NVARCHAR      | 50    | ❌  | ❌  | ❌   | ❌     | -           | -                                | Nombre completo del lector            |
| `Apellido1`          | NVARCHAR   |50    | ❌  | ❌  | ❌   | ❌     | -         | -                                | Apellido 1 del lector                      |
| `Apellido2`        | NVARCHAR      |50    | ❌  | ❌  | ❌   | ❌     | -                   | -                  |Apellido 2 del lector   
 `numMembresia`        | INT     |-    | ❌  | ❌  | ❌   | ✅     | -                   | -                  |Apellido 2 del lector

 **Tabla Prestamo**
| Campo            | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                 |
| ---------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | -------------------- | --------------------------- |
| `numeroPrestamo` | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                   | -                    | Identificador del prestamo  |
| `numeroLibro`    | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                   | Libro(numeroLibro)   | Libro prestado              |
| `numeroLector`   | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                   | Lector(numeroLector) | Lector que toma el prestamo |
| `isbn`           | NCHAR        | 13     | ❌  | ✅  | ❌    | ✅     | Longitud fija = 13    | Libro(isbn)          | ISBN del libro prestado     |



