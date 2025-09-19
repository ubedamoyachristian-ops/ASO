#!/bin/bash

# Pide al usuario el primer número
echo "Por favor, introduce el primer número:"
read num1

# Pide al usuario el segundo número
echo "Por favor, introduce el segundo número:"
read num2

# Compara los dos números
if [ "$num1" -gt "$num2" ]; then
  echo "$num1 es mayor que $num2."
elif [ "$num2" -gt "$num1" ]; then
  echo "$num2 es mayor que $num1."
else
  echo "Ambos números son iguales."
fi
