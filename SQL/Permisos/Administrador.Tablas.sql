
CREATE TABLE Examples.ADMINISTRADOR.Tablas (
    TableId SMALLINT IDENTITY(0,1) PRIMARY KEY NOT NULL,
    SchemaId TINYINT DEFAULT 0,
	Table_nombre NVARCHAR(30) NOT NULL, 
	ActivoId TINYINT DEFAULT 1 NOT NULL
);


--DROP TABLE Examples.ADMINISTRADOR.Tablas
ALTER TABLE Examples.ADMINISTRADOR.Tablas
ADD CONSTRAINT FK_Activos_Tablas
FOREIGN KEY (ActivoId) REFERENCES Examples.Activo.Activos(Id);



BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.ADMINISTRADOR.Tablas (SchemaId,Table_nombre)
        VALUES	(0,'DESCONOCIDO'),
				(2,'Activos'),
				(1,'Esquemas'),
				(1,'RowChangeLog'),
				(1,'TipoAccion'),
				(1,'Tablas'),
				(8,'Nombre'),
				(8,'Apellido'),
				(9,'Persona'),
				(9,'Sexo'),
				(9,'TipoPersona')
				
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
