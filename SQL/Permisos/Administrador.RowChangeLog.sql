CREATE TABLE ADMINISTRADOR.TipoAccion (
    ActionTypeId TINYINT IDENTITY(0,1) PRIMARY KEY, 
    ActionType NVARCHAR(12) NOT NULL, -- Tipo de acción:'DESCONOCIDO', 'INSERT', 'UPDATE', 'DELETE'
	rowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL, 
);

CREATE TABLE ADMINISTRADOR.RowChangeLog (
    LogID INT IDENTITY(0,1) PRIMARY KEY,			-- ID de registro único (clave primaria)
    ActionTypeId TINYINT DEFAULT 0 NOT NULL, 
    TableName NVARCHAR(128) NOT NULL,				-- Nombre de la tabla afectada
    RowCount_ INT NOT NULL,							-- Cantidad de filas cambiadas
    UserName NVARCHAR(128) NOT NULL,				-- Nombre del usuario que realizó la acción
    Timestamp DATETIME DEFAULT GETDATE() NOT NULL	-- Marca de tiempo de la acción
);
ALTER TABLE Examples.ADMINISTRADOR.RowChangeLog
ADD CONSTRAINT FK_RowChangeLog_TipoAccion
FOREIGN KEY (ActionTypeId) REFERENCES Examples.ADMINISTRADOR.TipoAccion(ActionTypeId);

GO


/*
INSERT INTO ADMINISTRADOR.TipoAccion (ActionType, rowguid)
VALUES ('DESCONOCIDO', '00000000-0000-0000-0000-000000000000')
INSERT INTO ADMINISTRADOR.TipoAccion (ActionType)
VALUES ('INSERT'),('UPDATE'),('DELETE')

--TRUNCATE TABLE ADMINISTRADOR.TipoAccion 
*/
SELECT * FROM ADMINISTRADOR.TipoAccion