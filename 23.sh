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

  # Comprueba el tipo de entrada
  if [ -d "$entrada" ]; then
    echo "Directorio:           $entrada"
  elif [ -f "$entrada" ]; then
    echo "Fichero:              $entrada"
  elif [ -L "$entrada" ]; then
    echo "Enlace simbólico:     $entrada"
  elif [ -b "$entrada" ]; then
    echo "Archivo de bloque:    $entrada"
  elif [ -c "$entrada" ]; then
    echo "Archivo de caracter:  $entrada"
  else
    echo "Tipo de archivo desconocido:  $entrada"
  fi
done

echo "----------------------------------------------------"
echo "Total de entradas procesadas: $contador_entradas"
