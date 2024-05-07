## Cambiar a modo oscuro
- Se debe de ir a la ruta o al path ->

`C:\Program Files (x86)\Microsoft SQL Server Management Studio 20\Common7\IDE`
- Abrir el archivo `ssms.pkgundef`
- Comentar la ultima linea de codigo 
```
// Remove Dark theme
//[$RootKey$\Themes\{1ded0138-47ce-435e-84ef-9ec1f439b749}]
```

# Que show con los rowguids ? :D  
Replicación de datos: Los rowguids son especialmente útiles cuando se trabaja con replicación de datos, ya que garantizan la unicidad de los registros en diferentes bases de datos, incluso si se producen conflictos de claves.
Entornos distribuidos: En entornos donde los datos se distribuyen a través de múltiples servidores o ubicaciones, los rowguids aseguran que cada fila tenga un identificador único, evitando posibles duplicados.
Integración de datos: Si se combinan datos de diferentes fuentes, los rowguids pueden ayudar a identificar de manera única cada registro, facilitando la integración y la prevención de duplicados.
Seguridad y auditoría: Los rowguids pueden ser útiles en escenarios de seguridad y auditoría, donde se necesita rastrear de manera única cada registro y sus cambios.
Rendimiento: En algunas situaciones, los rowguids pueden mejorar el rendimiento de las bases de datos al reducir la contención y los bloqueos, especialmente en entornos de alta concurrencia.