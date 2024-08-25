# Pandas
Eliminar acentos y todo en minusculas 
```
dfm["columns"] = dfm["columns"].apply(lambda x: unidecode(str(x)).lower())
```


# Programación 
multiples opciones 
```
def tipoCertificado (CeritificadoId):
    match CeritificadoId: 
        case 0:	return 'DESCONOCIDO'
        case 1: return 'REVISTA'
        # muchos más
        case _: return 'CERTIFICADO NO DEFINIDO'
```
un excel multiples hojas

```
def guardar_multiples_hojas(path: str, archivo: str, dfs: dict) -> None:
    full_path = f"{path}/{archivo}"
    with pd.ExcelWriter(full_path, engine='openpyxl') as writer:
        for nombre_hoja, df in dfs.items():
            df.to_excel(writer, sheet_name=nombre_hoja, index=False)

dfs = {'Hoja1': df1, 'Hoja2': df2}
guardar_multiples_hojas(dfs, 'multiples_hojas.xlsx')
```
# Entornos virtuales
```
pip install virtualenv
python -m venv venv
virtualenv venv
```
