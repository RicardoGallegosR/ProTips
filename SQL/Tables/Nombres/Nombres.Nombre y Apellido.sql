CREATE TABLE Nombres.Nombre (
    NombreId SMALLINT IDENTITY(0,1) NOT NULL,
    Nombre NVARCHAR(20) NOT NULL,
    NombreRowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
    Activo TINYINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (NombreId)
);

ALTER TABLE Nombres.Nombre
ADD CONSTRAINT FK_Activos_Nombre
FOREIGN KEY (Activo) REFERENCES Activo.Activos(Id);



CREATE TABLE Nombres.Apellido (
    ApellidoId SMALLINT IDENTITY(0,1) NOT NULL,
	Apellido NVARCHAR(20) NOT NULL, 
    ApellidoRowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
	Activo TINYINT DEFAULT 1 NOT NULL,
    PRIMARY KEY (ApellidoId) 
);

ALTER TABLE Nombres.Apellido
ADD CONSTRAINT FK_Activos_Apellido
FOREIGN KEY (Activo) REFERENCES Examples.Activo.Activos(Id);


/*
DROP TABLE Nombres.Nombre
DROP TABLE Nombres.Apellido
*/
