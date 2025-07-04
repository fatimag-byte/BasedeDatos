**Tabla Doctor**
| Campo       | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripcion              |
| ----------- | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------------------- | ------------ | ------------------------ |
| `doctorid`  | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                       | -            | Identificador del doctor |
| `nombre`    | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z y espacios, longitud >= 3 | -            | Nombre del doctor        |
| `apPaterno` | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2            | -            | Apellido paterno         |
| `apMaterno` | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2            | -            | Apellido materno         |
| `cedula`    | INT          | -      | ❌  | ❌  | ❌    | ✅     | > 0                                       | -            | Cedula profesional       |

**Tabla Paciente**
| Campo        | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                     | Referencia a | Descripcion                |
| ------------ | ------------ | ------ | -- | -- | ---- | ----- | ----------------------------------------- | ------------ | -------------------------- |
| `pacienteid` | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                       | -            | Identificador del paciente |
| `nombre`     | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z y espacios, longitud >= 3 | -            | Nombre del paciente        |
| `apPaterno`  | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2            | -            | Apellido paterno           |
| `apMaterno`  | NVARCHAR     | 50     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2            | -            | Apellido materno           |

**Tabla Consultar**
| Campo            | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                        | Referencia a         | Descripcion                       |
| ---------------- | ------------ | ------ | -- | -- | ---- | ----- | -------------------------------------------- | -------------------- | --------------------------------- |
| `numeroConsulta` | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                                          | -                    | Numero de consulta                |
| `doctorid`       | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                                          | Doctor(doctorid)     | Doctor que atiende la consulta    |
| `pacienteid`     | INT          | -      | ✅  | ✅  | ❌    | ❌     | > 0                                          | Paciente(pacienteid) | Paciente que recibe la consulta   |
| `fecha`          | DATE         | -      | ❌  | ❌  | ❌    | ❌     |- | -                    | Fecha de la consulta              |
| `diagnostico`    | NVARCHAR     | 100    | ❌  | ❌  | ❌    | ❌     | longitud >= 5                                | -                    | Diagnostico emitido por el doctor |
