#!/bin/bash

# Función para mostrar el mensaje de uso y salir
function mostrar_uso_y_salir() {
  echo "Error: Se requiere un único parámetro, la ruta de un directorio."
  echo "Uso: $0 <ruta_directorio>"
  exit 1
}

# 1. Validación de parámetros
# Comprobar si se ha pasado un único parámetro
if [ "$#" -ne 1 ]; then
  mostrar_uso_y_salir
fi

directorio="$1"

# Comprobar si la ruta existe y es un directorio
if [ ! -d "$directorio" ]; then
  echo "Error: '$directorio' no es un directorio válido o no existe."
  exit 1
fi

# 2. Conteo de archivos y directorios
# Inicializar contadores
ficheros=0
directorios=0

# Usar find para contar archivos y subdirectorios
# El directorio '.' se excluye del conteo
ficheros=$(find "$directorio" -maxdepth 1 -type f | wc -l)
directorios=$(find "$directorio" -maxdepth 1 -type d | wc -l)

# 3. Mostrar los resultados
# El número de directorios incluye el directorio base (.), por lo que se resta 1
echo "--- Estadísticas para el directorio '$directorio' ---"
echo "Número de ficheros:     $ficheros"
echo "Número de subdirectorios: $((directorios - 1))"
