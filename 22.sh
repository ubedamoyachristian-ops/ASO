#!/bin/bash

# Comprueba si se ha proporcionado un único parámetro
if [ "$#" -ne 1 ]; then
  echo "Error: Se requiere un único parámetro, la ruta completa de un directorio."
  echo "Uso: $0 <ruta_directorio>"
  exit 1
fi

# Asigna el parámetro a una variable
directorio="$1"

# Comprueba si la ruta existe y es un directorio
if [ ! -d "$directorio" ]; then
  echo "Error: '$directorio' no es un directorio válido o no existe."
  exit 1
fi

# Inicializa el contador de entradas
contador_entradas=0

echo "--- Listado de entradas en '$directorio' ---"

# Recorre cada entrada dentro del directorio
for entrada in "$directorio"/* "$directorio"/.*; do
  # Ignora las entradas . y ..
  if [ "$(basename "$entrada")" = "." ] || [ "$(basename "$entrada")" = ".." ]; then
    continue
  fi

  # Incrementa el contador
  contador_entradas=$((contador_entradas + 1))

  # Comprueba si la entrada es un directorio
  if [ -d "$entrada" ]; then
    echo "Directorio: $entrada"
  # Comprueba si la entrada es un archivo
  elif [ -f "$entrada" ]; then
    echo "Fichero:    $entrada"
  # En caso de otro tipo de entrada (enlace simbólico, etc.)
  else
    echo "Otro:       $entrada"
  fi
done
