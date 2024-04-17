CREATE TABLE Examples.ADMINISTRADOR.Esquemas (
    SchemaId TINYINT IDENTITY(0,1) PRIMARY KEY NOT NULL,
	Schema_nombre NVARCHAR(30) NOT NULL, 
	ActivoId TINYINT DEFAULT 1 NOT NULL
);


--DROP TABLE Examples.ADMINISTRADOR.Esquemas
ALTER TABLE Examples.ADMINISTRADOR.Esquemas
ADD CONSTRAINT FK_Activos_Esquemas
FOREIGN KEY (ActivoId) REFERENCES Examples.Activo.Activos(Id);



BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.ADMINISTRADOR.Esquemas (Schema_nombre)
        VALUES	('DESCONOCIDO'),
				('ADMINISTRADOR'),
				('Activo'),
				('Provedores'),
				('Productos'),
				('Aplicaciones'),
				('Ventas'),
				('Direcciones'),
				('Nombres'),
				('Personas'),
				('Resultados')/*,
                ('')*/
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