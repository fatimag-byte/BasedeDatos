**Tabla Clientes**

| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `NumCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > -                                       | -                                | Identificador del cliente               |
| `Nombre`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -           | -                                | Nombre completo del cliente             |
| `Apellido1`          | NVARCHAR   20      |  ❌   | ❌  | ❌  | ❌   | ❌     | -         | -                                | Apellido 1 del cliente                        |
| `Apellido2`        | NVARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     | -                   | -                  |Apellido 2 del cliente         
| `IdCiudad`      | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                                       | Ciudades(IdCiudad)               | Ciudad a la que pertenece el cliente    |
