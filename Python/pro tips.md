# Pandas
Eliminar acentos y todo en minusculas 
```
dfm["columns"] = dfm["columns"].apply(lambda x: unidecode(str(x)).lower())
```