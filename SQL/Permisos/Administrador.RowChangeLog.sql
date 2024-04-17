/*
CREATE TABLE Examples.ADMINISTRADOR.TipoAccion (
    ActionTypeId TINYINT IDENTITY(0,1) PRIMARY KEY, 
    ActionType NVARCHAR(12) NOT NULL, -- Tipo de acción:'DESCONOCIDO', 'INSERT', 'UPDATE', 'DELETE'
	rowguid UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL, 
);
*/
CREATE TABLE Examples.ADMINISTRADOR.RowChangeLog (
    LogID INT IDENTITY(0,1) PRIMARY KEY,			-- ID de registro único (clave primaria)
    ActionTypeId TINYINT DEFAULT 0 NOT NULL, 
    TableId SMALLINT DEFAULT 0 NOT NULL,			-- Nombre de la tabla afectada
    RowCount_ INT NOT NULL,							-- Cantidad de filas cambiadas
    UserName NVARCHAR(128) NOT NULL,				-- Nombre del usuario que realizó la acción
    Timestamp DATETIME DEFAULT GETDATE() NOT NULL,	-- Marca de tiempo de la acción
	Authorized BIT DEFAULT 0						-- Cambio Authorizado
);

-- DROP TABLE Examples.ADMINISTRADOR.RowChangeLog


ALTER TABLE Examples.ADMINISTRADOR.RowChangeLog
ADD CONSTRAINT FK_RowChangeLog_TipoAccion
FOREIGN KEY (ActionTypeId) REFERENCES Examples.ADMINISTRADOR.TipoAccion(ActionTypeId);

ALTER TABLE Examples.ADMINISTRADOR.RowChangeLog
ADD CONSTRAINT FK_RowChangeLog_TableId
FOREIGN KEY (TableId) REFERENCES Examples.ADMINISTRADOR.Tablas(TableId);
/*
INSERT INTO Examples.ADMINISTRADOR.RowChangeLog (ActionTypeId,TableId,RowCount_,UserName)
VALUES (0,0,0,'DESCONOCIDO')
*/

GO


/*
INSERT INTO ADMINISTRADOR.TipoAccion (ActionType, rowguid)
VALUES ('DESCONOCIDO', '00000000-0000-0000-0000-000000000000')
INSERT INTO ADMINISTRADOR.TipoAccion (ActionType)
VALUES ('INSERT'),('UPDATE'),('DELETE')

--TRUNCATE TABLE ADMINISTRADOR.TipoAccion 
*/
SELECT * FROM ADMINISTRADOR.TipoAccion
SELECT * FROM ADMINISTRADOR.tABLAS


SELECT * FROM Examples.ADMINISTRADOR.RowChangeLog