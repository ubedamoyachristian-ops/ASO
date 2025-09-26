#!/bin/bash

# Función para verificar si un número es primo
function es_primo() {
  num=$1

  # Los números menores o iguales a 1 no son primos
  if [ "$num" -le 1 ]; then
    echo "$num no es un número primo."
    return
  fi

  # Se comprueba la divisibilidad desde 2 hasta la raíz cuadrada del número
  # La raíz cuadrada del número es el límite para optimizar la comprobación
  for (( i=2; i*i<=num; i++ )); do
    # Si el número es divisible por 'i', no es primo
    if [ $((num % i)) -eq 0 ]; then
      echo "$num no es un número primo."
      return
    fi
  done

  # Si no se encontraron divisores, el número es primo
  echo "$num es un número primo."
}

# Comprueba si se pasó un parámetro
if [ -z "$1" ]; then
  echo "Error: Debes proporcionar un número como parámetro."
  echo "Uso: $0 <numero>"
  exit 1
fi

# Llama a la función para verificar el número
es_primo "$1"
