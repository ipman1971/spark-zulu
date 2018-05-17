# spark-zulu
Imagen con Spark sobre YARN

Dispone de las siguientes variables de entorno:

+ SPARK_HOME

## Construción de imagen
```
make
```

## Creación de un contenedor
```
make run workspace=<directorio de proyecto> hostname=<hostname>
```

## Eliminación de un contenedor
```
make clean
```

## Eliminación de la imagen
```
make clean-image
```
