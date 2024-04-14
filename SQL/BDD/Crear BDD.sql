/*
Crear una bdd sin diferenciar eentre mayusculas y minisculas ademas no identifica acentos.
*/
CREATE DATABASE Examples
COLLATE SQL_Latin1_General_CP1_CI_AI;

/*
si ya tienes una bdd y deceas cambiarla solo debes de modificar la base de datos con 
*/

ALTER DATABASE Examples
SET COLLATE SQL_Latin1_General_CP1_CI_AI;
