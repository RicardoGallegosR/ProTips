-- Cuenta y correo
SELECT ORIGINAL_LOGIN();
-- dominio
SELECT SYSTEM_USER;

SELECT *
FROM sys.database_principals



GRANT SELECT, INSERT, UPDATE, DELETE ON Activo.Activos TO [rgall]


SELECT permission_name, state_desc,*
FROM sys.database_permissions
WHERE major_id = OBJECT_ID('Activo.Activos') 
AND grantee_principal_id = USER_ID('rgall');