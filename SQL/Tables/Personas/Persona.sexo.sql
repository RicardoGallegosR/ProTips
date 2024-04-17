CREATE TABLE Personas.Sexo (
    SexoId TINYINT IDENTITY(0,1) NOT NULL,
	Sexo NVARCHAR(20) NOT NULL, 
    rowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL, 
    PRIMARY KEY (SexoId) 
);

-- Falta su llave primaria a Activo





--DROP TABLE Personas.TipoPersona
DECLARE
    @ErrorMessage NVARCHAR(4000),
    @ErrorSeverity INT,
    @ErrorState INT

BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.Personas.Sexo (Sexo)
        VALUES	('DESCONOCIDO'),
				('MASCULINO'),
				('FEMENINO'),
				('OTRO')
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


UPDATE Examples.Personas.sexo
SET ROWGUID = '00000000-0000-0000-0000-000000000000'
WHERE SexoId = 0

SELECT * FROM Examples.Personas.Sexo
ORDER BY SexoId