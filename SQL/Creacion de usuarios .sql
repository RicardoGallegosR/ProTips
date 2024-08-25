CREATE LOGIN AreaTencnica WITH PASSWORD = '2019&AreaTecnica';
GO
CREATE USER AreaTencnica FOR LOGIN AreaTencnica;
GO
ALTER ROLE db_owner ADD MEMBER AreaTencnica;
GO
