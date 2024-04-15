CREATE TABLE Personas.TipoPersona (
    TipoPersonaId TINYINT IDENTITY(0,1) NOT NULL,
	TipoPersona NVARCHAR(20) NOT NULL, 
    rowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL, 
    PRIMARY KEY (TipoPersonaId) 
);


--DROP TABLE Personas.TipoPersona
DECLARE
    @ErrorMessage NVARCHAR(4000),
    @ErrorSeverity INT,
    @ErrorState INT

BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.Personas.TipoPersona (TipoPersona)
        VALUES	('DESCONOCIDO'),
				('CLIENTE'),
				('PROVEDOR'),
				('APODERADO LEGAL'),
				('VENDEDOR'),
				('EJECUTIVO'),
				('GERENTE'),
				('SOPORTE TECNICO'),
				('SOCIO'),
				('SUBDIRECTOR'),
				('DIRECTOR'),
				('REGIONAL'),
				('RECURSOS HUMANOS'),
				('CAPACITADOR'),
				('AUDITOR'),
				('DESPACHO LEGAL')
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


UPDATE Examples.Personas.TipoPersona
SET ROWGUID = '00000000-0000-0000-0000-000000000000'
WHERE TipoPersonaiD = 0

SELECT * FROM Examples.Personas.TipoPersona
ORDER BY TipoPersonaId