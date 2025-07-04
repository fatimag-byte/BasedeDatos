**Tabla Curso**
| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripcion                   |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------------------- | ------------ | ----------------------------- |
| `numeroCurso` | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                       | -            | Identificador unico del curso |
| `nombreCurso` | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z y espacios, longitud >= 3 | -            | Nombre del curso              |
| `codigo`      | INT          | -      | ❌  | ❌  | ❌    | ✅     | > 0                                       | -            | Codigo unico del curso        |

**Tabla Estudiante**
| Campo              | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripcion                  |
| ------------------ | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------------------- | ------------ | ---------------------------- |
| `numeroEstudiante` | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                       | -            | Identificador del estudiante |
| `nombre`           | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z y espacios, longitud >= 3 | -            | Nombre del estudiante        |
| `apPaterno`        | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2            | -            | Apellido paterno             |
| `apMaterno`        | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2            | -            | Apellido materno             |
| `matricula`        | INT          | -      | ❌  | ❌  | ❌    | ✅     | > 0                                       | -            | Matricula del estudiante     |


**Tabla Inscribe**
| Campo              | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK | Referencia a                 | Descripcion                     |
| ------------------ | ------------ | ------ | -- | -- | ---- | ----- | --------------------- | ---------------------------- | ------------------------------- |
| `numInscripcion`   | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                   | -                            | Identificador de la inscripcion |
| `numeroEstudiante` | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                   | Estudiante(numeroEstudiante) | Estudiante inscrito             |
| `numCurso`         | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                   | Curso(numeroCurso)           | Curso inscrito                  |


