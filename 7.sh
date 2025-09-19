#!/bin/bash

# Comprueba si se ha pasado un parámetro
if [ -z "$1" ]; then
  echo "Uso: $0 <directorio>"
  exit 1
fi

# Define el directorio a comprimir (el primer parámetro)
directorio="$1"

# Comprueba si el directorio existe
if [ ! -d "$directorio" ]; then
  echo "Error: El directorio '$directorio' no existe."
  exit 1
fi

# Obtiene la fecha actual en formato YYYY-MM-DD
fecha=$(date +%Y-%m-%d)

# Define el nombre del archivo de salida
nombre_archivo="${fecha}-${directorio}.tar.gz"

# Crea el archivo tar.gz
tar -czf "$nombre_archivo" "$directorio"

# Muestra un mensaje de confirmación
echo "Archivo comprimido creado: $nombre_archivo"
