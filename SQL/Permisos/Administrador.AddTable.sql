/*
BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.ADMINISTRADOR.Tablas (SchemaId,Table_nombre)
        VALUES	(0,'DESCONOCIDO')
		
		INSERT INTO Examples.ADMINISTRADOR.Esquemas (Schema_nombre)
        VALUES	('DESCONOCIDO')
		
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    DECLARE
        @ErrorMessage NVARCHAR(4000),
        @ErrorSeverity INT,
        @ErrorState INT
    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

        SET @ErrorMessage = 'Error en el procedimiento almacenado Insertar Certificado: ' + @ErrorMessage +
                    '. Error en la línea: ' + CAST(ERROR_LINE() AS NVARCHAR(10))
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    ROLLBACK TRANSACTION;
END CATCH
*/

SELECT Tablas.SchemaId, TableId, Schema_nombre, Table_nombre
FROM Examples.ADMINISTRADOR.Tablas
INNER JOIN Examples.ADMINISTRADOR.Esquemas ON Tablas.SchemaId = Esquemas.SchemaId 

SELECT * FROM Examples.ADMINISTRADOR.Esquemas