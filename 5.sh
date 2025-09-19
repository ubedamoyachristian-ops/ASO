#!/bin/bash

# Pide al usuario el primer número
echo "Por favor, introduce el primer número:"
read num1

# Pide al usuario el segundo número
echo "Por favor, introduce el segundo número:"
read num2

# Calcula la media aritmética
# La media se calcula como (num1 + num2) / 2
# Se usa 'bc' para realizar operaciones de coma flotante
# La variable 'media' almacena el resultado
media=$(echo "scale=2; ($num1 + $num2) / 2" | bc)

# Muestra el resultado por pantalla
echo "---"
echo "La media aritmética de $num1 y $num2 es: $media"
