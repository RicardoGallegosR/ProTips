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