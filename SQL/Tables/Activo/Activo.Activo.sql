CREATE TABLE Activo.Activos (
    ActivoId INT IDENTITY(0,1) NOT NULL,
	tipo_Activo NVARCHAR(30) NOT NULL, 
    rowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL, 
    PRIMARY KEY (ActivoId, rowguid) 
);


--DROP TABLE Activo.Activos
DECLARE
    @ErrorMessage NVARCHAR(4000),
    @ErrorSeverity INT,
    @ErrorState INT

BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.Activo.Activos (tipo_Activo)
        VALUES	('DESCONOCIDO'),
				('ACTIVO'),
				('TERMINADO'),
				('DESCONTINUADO')
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

        SET @ErrorMessage = 'Error en el procedimiento almacenado Insertar Certificado: ' + @ErrorMessage +
                    '. Error en la línea: ' + CAST(ERROR_LINE() AS NVARCHAR(10))
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    ROLLBACK TRANSACTION;
END CATCH


UPDATE Activo.Activos
SET ROWGUID = '00000000-0000-0000-0000-000000000000'
WHERE ActivoId = 0

SELECT * FROM Activo.Activos