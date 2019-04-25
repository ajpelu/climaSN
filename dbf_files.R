

# Dowload data from 

# http://descargasrediam.cica.es/repo/s/RUR?path=%2F04_RECURSOS_NATURALES%2F03_CLIMA%2F01_REDES_DE_OBSERVACION%2F01_ESTACIONES_METEOROLOGICAS%2FEstaciones_meteorologicas




# Descargas REDIAM
# http://descargasrediam.cica.es/repo/s/RUR 

# Estaciones meteorologicas 
# http://descargasrediam.cica.es/repo/s/RUR?path=%2F04_RECURSOS_NATURALES%2F03_CLIMA%2F01_REDES_DE_OBSERVACION%2F01_ESTACIONES_METEOROLOGICAS 



## He llamado a M. Corzo y me comenta que la consulta de datos de estaciones sigue tal y como estaba (obsoleta)

## JM Barea me pasa ppt para consultar la forma de acceder a datos de clima (cursillos de formación que le han dado a final de Diciembre)

## En general tengo la sensación de que hay poco o nada documentado la forma en la que los datos de las estaciones entran en Linaria, o al menos yo no las conozco. Supongo que Curro estaba al tanto, pero no lo dejo escrito o no lo sabemos donde está. 



# Read dbf files 

library("foreign")

d <- read.dbf(file = '/Users/ajpelu/Downloads/DATOS.DBF')
tail(d)




Datos diarios aemet 
http://www.aemet.es/es/serviciosclimaticos/cambio_climat/datos_diarios?w=2

# Series largas 

http://www.aemet.es/es/serviciosclimaticos/cambio_climat/datos_diarios?w=2&w2=2 