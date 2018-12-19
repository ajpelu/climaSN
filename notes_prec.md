# Process data 


* Download data from Linaria with the following sql: 

```sql
SELECT 
  cli_variables.codigo AS variable, 
  cli_datos_estaciones.valor, 
  date(cli_datos_estaciones.fecha) AS fecha, 
  cli_estaciones.codigo AS estacion, 
  cli_validaciones.codigo
FROM 
  public.cli_datos_estaciones, 
  public.cli_estaciones, 
  public.cli_variables, 
  public.cli_validaciones
WHERE 
  cli_datos_estaciones.cli_validacione_id = cli_validaciones.id AND
  cli_estaciones.id = cli_datos_estaciones.cli_estacion_id AND
  cli_variables.id = cli_datos_estaciones.cli_variable_id AND
  cli_variables.codigo IN ('PI1', 'PD1', 'PRECIPITACION_TOT_MAX');

```

* Store data as "/data_raw/prec_linaria.csv" (Include in gitignore because it's a large file) 

We retrieved values from three variables: 

| id  | codigo                | descripcion                              | unidades | codigo_oapn_v0        | rango_inferior | rango_superior | codigo_oapn               |
|-----|-----------------------|------------------------------------------|----------|-----------------------|----------------|----------------|---------------------------|
| 130 | PD1                   | PRECIPITACIóN TOTAL DIARIA DE 7 A 7      | mm       |                       |                |                |                           |
| 42  | PI1                   | PRECIPITACIóN CAíDA EN EL PERIODO        | mm       | PRECIPITACION_TOT     | 0              | 42             | PLU(mm)                   |
| 43  | PRECIPITACION_TOT_MAX | PRECIPITACIóN MáXIMA CAíDA EN EL PERIODO | mm       | PRECIPITACION_TOT_MAX | 0              | 42             | PRECIPITACION_TOT_MAX(mm) |



# Data of Stations


SELECT 
  cli_estaciones.id, 
  cli_estaciones.nombre, 
  cli_estaciones.codigo, 
  cli_estaciones.estado, 
  cli_estaciones.cli_red_id, 
  cli_estaciones.punto_x,
  cli_estaciones.punto_y, 
  ST_X (ST_Transform (geometria, 4326)) AS long,
  ST_Y (ST_Transform (geometria, 4326)) AS lat, 
  cli_estaciones.fecha_inicio, 
  cli_estaciones.fecha_fin, 
  cli_estaciones.numero_registros
FROM 
  public.cli_estaciones;
 
