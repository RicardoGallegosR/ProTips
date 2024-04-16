-- Monitoreo de DROP y CREATE de objetos de base de datos
CREATE SERVER AUDIT MyAudit
TO FILE (FILENAME = 'C:\Audits\MyAuditFile');
ALTER SERVER AUDIT MyAudit WITH (STATE = ON);



USE MyDatabase; -- Cambia a la base de datos que quieres auditar
CREATE DATABASE AUDIT SPECIFICATION MyAuditSpec
FOR SERVER AUDIT MyAudit
ADD (OBJECT: CREATE, DROP)
WITH (STATE = ON);


--Monitoreo de TRUNCATE
/*
Permisos: Asegúrate de que solo usuarios autorizados tengan permiso para ejecutar TRUNCATE. El permiso ALTER TABLE es necesario para ejecutar TRUNCATE, por lo que puedes controlar este permiso para restringir quién puede realizar esta operación.
Auditoría: Al igual que con CREATE y DROP, puedes utilizar la auditoría de SQL Server para monitorear TRUNCATE. Configura una especificación de auditoría de base de datos para supervisar el evento TRUNCATE TABLE.
*/

USE MyDatabase; -- Cambia a la base de datos que quieres auditar
CREATE DATABASE AUDIT SPECIFICATION MyAuditSpec
FOR SERVER AUDIT MyAudit
ADD (OBJECT: TRUNCATE TABLE)
WITH (STATE = ON);
