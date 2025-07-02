**Tabla Employee**
| Campo        | Tipo de Dato | Tamaño     | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a           | Descripción                 |
|--------------|--------------|------------|-----|-----|------|--------|------------------------|--------------------------|-----------------------------|
| `employid`   | INT          | -          | ✅  | ❌  | ❌   | ✅     | -                      | -                        | Identificador del empleado  |
| `departamentid` | INT       | -          | ❌  | ✅  | ❌   | ❌     | -                      | Department(deparmentid)  | Departamento del empleado   |
| `managerid`  | NVARCHAR     | 50         | ❌  | ✅  | ❌   | ❌     | -                      | Employee(employid)       | ID del jefe directo         |
| `ssn`        | NVARCHAR     | 20         | ❌  | ❌  | ❌   | ✅     | -                      | -                        | Número de seguro social     |
| `firstName`  | NVARCHAR     | 50         | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Nombre del empleado         |
| `lastName`   | NVARCHAR     | 50         | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Apellido del empleado       |
| `salary`     | DOUBLE       | (20,2)     | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Salario del empleado        |
| `street`     | NVARCHAR     | 50         | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Calle del domicilio         |
| `numStreet`  | NVARCHAR     | 50         | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Número de domicilio         |
| `city`       | NVARCHAR     | 50         | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Ciudad de residencia        |
| `sex`        | NVARCHAR     | 50         | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Sexo del empleado           |
| `birthdate`  | NVARCHAR     | 50         | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Fecha de nacimiento         |
**Tabla Dependent**
| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a       | Descripción                  |
|---------------|--------------|--------|-----|-----|------|--------|------------------------|--------------------|------------------------------|
| `employid`    | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                      | Employee(employid) | Empleado responsable         |
| `firstName`   | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                      | -                  | Nombre del dependiente       |
| `lastName`    | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                      | -                  | Apellido del dependiente     |
| `sex`         | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                      | -                  | Sexo del dependiente         |
| `birthdate`   | DATE         | -      | ❌  | ❌  | ❌   | ❌     | -                      | -                  | Fecha de nacimiento          |
| `relationship`| NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                      | -                  | Relación con el empleado     |
**Tabla Deparment**
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                      |
|------------------|--------------|--------|-----|-----|------|--------|------------------------|----------------------|----------------------------------|
| `deparmentid`    | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                      | -                    | Identificador del departamento   |
| `managerID`      | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                      | Employee(employid)   | Jefe del departamento            |
| `nameDeparment`  | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                      | -                    | Nombre del departamento          |
**Tabla Project+**
| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a           | Descripción                    |
|---------------|--------------|--------|-----|-----|------|--------|------------------------|--------------------------|--------------------------------|
| `projectid`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                      | -                        | Identificador del proyecto     |
| `deparmentid` | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                      | Department(deparmentid)  | Departamento asignado          |
| `locationid`  | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                      | Location(locationid)     | Ubicación del proyecto         |
| `nameProject` | NVARCHAR     | 50     | ❌  | ❌  | ❌   | ❌     | -                      | -                        | Nombre del proyecto            |
**Tabla WORKS-ON**
| Campo       | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                     |
|-------------|--------------|--------|-----|-----|------|--------|------------------------|------------------------|---------------------------------|
| `employid`  | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                      | Employee(employid)     | Empleado asignado al proyecto   |
| `projectid` | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                      | Project(projectid)     | Proyecto en el que trabaja      |
| `hours`     | DOUBLE       | -      | ❌  | ❌  | ❌   | ❌     | -                      | -                      | Horas trabajadas en el proyecto |
**Tabla Location**
| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a         | Descripción                      |
|----------------|--------------|--------|-----|-----|------|--------|------------------------|------------------------|----------------------------------|
| `locationid`   | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                      | -                      | Identificador de la ubicación    |
| `deparmentid`  | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                      | Department(deparmentid)| Departamento asociado a la sede  |
