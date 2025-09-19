#!/bin/bash

# Pide al usuario que introduzca un número
read -p "Introduce un número entero: " numero

# Comprueba si la entrada es un número
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
  echo "Error: Entrada no válida. Por favor, introduce un número entero."
  exit 1
fi

# Usa el operador módulo (%) para determinar si el número es par o impar
# El resultado de $numero % 2 es 0 si es par, y 1 si es impar
if [ $((numero % 2)) -eq 0 ]; then
  echo "El número $numero es PAR."
else
  echo "El número $numero es IMPAR."
fi
