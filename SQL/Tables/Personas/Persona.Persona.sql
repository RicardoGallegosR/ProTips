CREATE TABLE Personas.Persona (
    PersonaID INT IDENTITY(0,1),
    NombreId SMALLINT NOT NULL DEFAULT 0,
    ApellidoId1 SMALLINT NOT NULL DEFAULT 0,
    ApellidoId2 SMALLINT NOT NULL DEFAULT 0,
	FechaNacimiento DATE NOT NULL DEFAULT '19000101', -- Fecha de nacimiento por defecto
	SexoId TINYINT DEFAULT 0,
	TipoPersonaId TINYINT NOT NULL DEFAULT 1, -- La persona es cliente
    CURP CHAR(18),
    RFC CHAR(13), 
	Email NVARCHAR(255),
	lada CHAR(3) NOT NULL DEFAULT '+52',
	Telefono CHAR(10) NOT NULL DEFAULT '0000000000',
	CHECK (Telefono LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    CHECK (Email LIKE '%@%.%'),
	CHECK (CURP LIKE '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z][A-Z][A-Z][A-Z][0-9][0-9]'),
	CHECK (RFC LIKE '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z0-9][A-Z0-9][A-Z0-9]'),
	rowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL, 
	Activo TINYINT DEFAULT 1, -- La persona esta activa
	PRIMARY KEY (PersonaID) 
);

-- DROP TABLE Personas.Persona
ALTER TABLE Personas.Persona
ADD CONSTRAINT FK_Activos_Personas
FOREIGN KEY (Activo) REFERENCES Examples.Activo.Activos(Id);

ALTER TABLE Personas.Persona
ADD CONSTRAINT FK_TipoPersona_Personas
FOREIGN KEY (TipoPersonaId) REFERENCES Examples.Personas.TipoPersona(TipoPersonaId);

ALTER TABLE Personas.Persona
ADD CONSTRAINT FK_Nombre1_Personas
FOREIGN KEY (NombreId) REFERENCES Examples.Nombres.Nombre(NombreId);

ALTER TABLE Personas.Persona
ADD CONSTRAINT FK_Sexo_Personas
FOREIGN KEY (SexoId) REFERENCES Examples.Personas.Sexo(SexoId);

ALTER TABLE Personas.Persona
ADD CONSTRAINT FK_Apellido1_Personas
FOREIGN KEY (ApellidoId1) REFERENCES Examples.Nombres.Apellido(ApellidoId);

ALTER TABLE Personas.Persona
ADD CONSTRAINT FK_Apellido2_Personas
FOREIGN KEY (ApellidoId2) REFERENCES Examples.Nombres.Apellido(ApellidoId);






DECLARE
    @ErrorMessage NVARCHAR(4000),
    @ErrorSeverity INT,
    @ErrorState INT

BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.Personas.Persona (NombreId,ApellidoId1,ApellidoId2,CURP,RFC,rowguid,Email)
        VALUES	(0,0,0,'AAAA000101AAAAAA01','AAAA000101AAA','00000000-0000-0000-0000-000000000000','default@gmail.com')
        	
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
        INSERT INTO Examples.Personas.Persona (NombreId,ApellidoId1,ApellidoId2,CURP,RFC,FechaNacimiento,Email,Telefono,TipoPersonaId,SexoId)
        VALUES	(419,649,1329,'GARR970115HDFLDC01','GARR9701155D8','19970115','ricardoipn9@gmail.com','5539759778',7,1)
        	
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





-- SELECT * FROM Personas.Persona

SELECT NP.PersonaID,NN.Nombre +' '+ NA.Apellido +' '+ NA2.Apellido  AS 'NOMBRE COMPLETO', NP.FechaNacimiento, Sexo ,NP.CURP,NP.RFC, 
lada + ' ' +Telefono AS Tel,TipoPersona, Email, NP.rowguid, AA.tipo_Activo


FROM Examples.Personas.Persona AS NP				WITH (READUNCOMMITTED) 
	INNER JOIN Examples.Nombres.Nombre AS NN		WITH (READUNCOMMITTED)	ON NN.NombreId = NP.NombreId
	INNER JOIN Examples.Nombres.Apellido AS NA		WITH (READUNCOMMITTED)	ON NA.ApellidoId = NP.ApellidoId1 
	INNER JOIN Examples.Nombres.Apellido AS NA2		WITH (READUNCOMMITTED)  ON NA2.ApellidoId = NP.ApellidoId2
	INNER JOIN Examples.Personas.TipoPersona AS TP	WITH (READUNCOMMITTED)	ON TP.TipoPersonaId = NP.TipoPersonaId
	INNER JOIN Examples.Personas.Sexo AS PS			WITH (READUNCOMMITTED)	ON PS.SexoId = NP.SexoId
	INNER JOIN Examples.Activo.Activos AS AA		WITH (READUNCOMMITTED)	ON AA.id = NP.Activo
WHERE NP.Activo = 1