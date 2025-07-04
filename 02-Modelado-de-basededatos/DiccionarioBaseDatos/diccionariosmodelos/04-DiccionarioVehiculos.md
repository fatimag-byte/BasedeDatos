**Tabla Clientes**
| Campo         | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                                                 | Referencia a | Descripcion                       |
| ------------- | ------------ | ------ | -- | -- | ---- | ----- | --------------------------------------------------------------------- | ------------ | --------------------------------- |
| `numCliente`  | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                                                   | -            | Identificador del cliente         |
| `Nombre`      | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z y espacios, longitud >= 3                             | -            | Nombre completo del cliente       |
| `Apellido1`   | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2                                        | -            | Apellido 1 del cliente            |
| `Apellido2`   | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z, longitud >= 2                                        | -            | Apellido 2 del cliente            |
| `telefono`    | NCHAR        | 12     | ❌  | ❌  | ✅    | ❌     | -                                              | -            | Numero celular del cliente        |
| `calle`       | NVARCHAR     | 20     | ❌  | ❌  | ❌    | ❌     | longitud >= 3                                                         | -            | Calle de la direccion del cliente |
| `numeroCalle` | NVARCHAR     | 12     | ❌  | ❌  | ✅    | ❌     | solo numeros o combinacion alfanumerica                               | -            | Numero de calle del cliente       |
| `ciudad`      | NVARCHAR     | 12     | ❌  | ❌  | ❌    | ❌     | solo letras A-Z y espacios                                            | -            | Ciudad de residencia del cliente  |
| `curp`        | NCHAR        | 18     | ❌  | ❌  | ❌    | ✅     |- | -            | CURP del cliente                  |


**Tabla Renta**
| Campo          | Tipo de Dato | Tamaño | PK | FK | Nulo | Único | Restricciones / CHECK                                    | Referencia a          | Descripcion                               |
| -------------- | ------------ | ------ | -- | -- | ---- | ----- | -------------------------------------------------------- | --------------------- | ----------------------------------------- |
| `numRenta`     | INT          | -      | ✅  | ❌  | ❌    | ✅     | > 0                                                      | -                     | Identificador de la renta                 |
| `numCliente`   | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                                                      | Clientes(NumCliente)  | Idenatificador del cliente                |
| `numVehiculo`  | INT          | -      | ❌  | ✅  | ❌    | ❌     | > 0                                                      | Vehiculo(numVehiculo) | Idenatificador del vehiculo               |
| `fechaInicio`  | DATE         | -      | ❌  | ❌  | ❌    | ❌     | - | -                     | Fecha de inicio de la renta del vehiculo  |
| `fechaTermino` | DATE         | -      | ❌  | ❌  | ❌    | ❌     | - | -                     | Fecha de termino de la renta del vehiculo |


**Tabla Vehiculo**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numeroVehiculo`     | INT          | 20      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador del vehiculo              |
| `marca`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -           | -                                | Marca del vehiculo             |
| `modelo`          | NVARCHAR   | 20    | ❌  | ❌  | ❌   | ❌     | -         | -                                | Modelo del vehiculo                       |
| `año`        | INT      | 20    | ❌  | ❌  | ❌   | ❌     | -                   | -                  |Año de lanzamiento del vehiculo         
| `placa`      | NVARCHAR          | 20     | ❌  | ❌   | ❌   | ✅     | -                                       | -            | Numero de la matricula del vehiculo    |

**Tabla Sucursal**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `numeroSucursal`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                                       | -                                | Identificador de la sucursal en donde se encuentra el vehiculo             |
| `numeroVehiculo`        | INT     | -    | ❌  | ✅  | ❌   | ✅     | -           | -                                | Marca del vehiculo             |
| `nombre`          | NVARCHAR   | 20    | ❌  | ❌  | ❌   | ❌     | -         | Vehiculo(numeroVehiculo)                      | Nombre de la sucursal                       |
| `calle`      | NVARCHAR          | 20      | ❌  | ❌   | ❌   | ❌     | -                                       | -            | Calle de la direccion de la sucursal    |
| `numeroCalle`      | NVARCHAR          | 12      | ❌  | ❌   | ❌   | ❌     | -                                       | -            | Numero de calle de la sucursal   |
| `ciudad`      | NVARCHAR          | 12      | ❌  | ❌   | ❌   | ❌     | -                                       | -            | Ciudad en donde se encuentra la sucursal    |

