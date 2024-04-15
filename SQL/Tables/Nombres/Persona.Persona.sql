
CREATE TABLE Nombres.Personas (
    PersonaID INT IDENTITY(0,1),
    Nombre1 SMALLINT NOT NULL DEFAULT 0,
    Nombre2 SMALLINT NOT NULL DEFAULT 0,
    Apellido1 SMALLINT NOT NULL DEFAULT 0,
    Apellido2 SMALLINT NOT NULL DEFAULT 0,
	FechaNacimiento DATE NOT NULL DEFAULT '19000101', -- Fecha de nacimiento por defecto
	TipoPersonaId TINYINT NOT NULL DEFAULT 1, -- La persona es cliente
    CURP CHAR(18),
    RFC CHAR(13), 
	CHECK (CURP LIKE '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9]'),
	CHECK (RFC LIKE '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z0-9][A-Z0-9][A-Z0-9]'),
	rowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL, 
	Activo TINYINT DEFAULT 1, -- La persona esta activa
	PRIMARY KEY (PersonaID) 
);

-- DROP TABLE Nombres.Personas
ALTER TABLE Nombres.Personas
ADD CONSTRAINT FK_Activos_Personas
FOREIGN KEY (Activo) REFERENCES Examples.Activo.Activos(Id);

ALTER TABLE Nombres.Personas
ADD CONSTRAINT FK_TipoPersona_Personas
FOREIGN KEY (TipoPersonaId) REFERENCES Examples.Nombres.TipoPersona(TipoPersonaId);

ALTER TABLE Nombres.Personas
ADD CONSTRAINT FK_Nombre1_Personas
FOREIGN KEY (Nombre1) REFERENCES Examples.Nombres.Nombre(NombreId);

ALTER TABLE Nombres.Personas
ADD CONSTRAINT FK_Nombre2_Personas
FOREIGN KEY (Nombre2) REFERENCES Examples.Nombres.Nombre(NombreId);

ALTER TABLE Nombres.Personas
ADD CONSTRAINT FK_Apellido1_Personas
FOREIGN KEY (Apellido1) REFERENCES Examples.Nombres.Apellido(ApellidoId);

ALTER TABLE Nombres.Personas
ADD CONSTRAINT FK_Apellido2_Personas
FOREIGN KEY (Apellido2) REFERENCES Examples.Nombres.Apellido(ApellidoId);






DECLARE
    @ErrorMessage NVARCHAR(4000),
    @ErrorSeverity INT,
    @ErrorState INT

BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.Nombres.Personas (Nombre1,Nombre2,Apellido1,Apellido2,CURP,RFC,rowguid)
        VALUES	(0,0,0,0,'AAAA000101AAAAAA01','AAAA000101AAA','00000000-0000-0000-0000-000000000000')
        	
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



BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.Nombres.Personas (Nombre1,Nombre2,Apellido1,Apellido2,CURP,RFC,FechaNacimiento)
        VALUES	(419,0,649,1329,'GARR970115HDFLDC01','GARR9701155D8','19970115')
        	
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





SELECT * FROM [Nombres].[Personas]

