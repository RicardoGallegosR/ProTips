# Pandas
Eliminar acentos y todo en minusculas 
```
dfm["columns"] = dfm["columns"].apply(lambda x: unidecode(str(x)).lower())
```


# Programaicon 
multiples opciones 
def tipoCertificado (CeritificadoId):
    match CeritificadoId: 
        case 0:	return 'DESCONOCIDO'
        case 1:	return 'RECHAZO'
        case 2:	return 'DOS'
        case 3:	return 'UNO'
        case 4:	return 'CERO'
        case 5:	return 'DOBLE CERO'
        case 6:	return 'GLP'
        case 7:	return 'GNC'
        case 8:	return 'DIESEL'
        case 9:	return 'EXENTO'
        case 10: return 'VALIDACION'
        case 11: return 'REVISTA'
        case _: return 'CERTIFICADO NO DEFINIDO'

def guardar_multiples_hojas(dfs: dict, archivo: str) -> None:
    """
    Guarda múltiples DataFrames en un archivo Excel, cada uno en una hoja separada.

    :param dfs: Diccionario donde la clave es el nombre de la hoja y el valor es el DataFrame
    :param archivo: Ruta del archivo Excel a guardar
    """
    with pd.ExcelWriter(archivo, engine='openpyxl') as writer:
        for nombre_hoja, df in dfs.items():
            df.to_excel(writer, sheet_name=nombre_hoja, index=False)
