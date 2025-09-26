#!/bin/bash

# Comprobamos si se ha proporcionado un parámetro
if [ -z "$1" ]; then
  echo "Error: Debes proporcionar un número como parámetro."
  echo "Uso: $0 <numero>"
  exit 1
fi

# Asignamos el primer parámetro a la variable 'n'
n=$1

# Bucle para mostrar la tabla de multiplicar del 1 al 10
for i in {1..10}; do
  # Calcula el resultado de la multiplicación
  resultado=$((i * n))
  
  # Muestra la línea con el formato deseado
  echo "$i x $n = $resultado"
done
