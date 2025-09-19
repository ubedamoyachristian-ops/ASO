#!/bin/bash

# Muestra el menú de operaciones
echo "--- Menú de Operaciones Matemáticas ---"
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicar"
echo "4. Dividir"
echo "--------------------------------------"

# Pide al usuario que elija una opción
read -p "Elige una opción (1-4): " opcion

# Pide los dos números
read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2

# Estructura de control para ejecutar la operación seleccionada
case $opcion in
  1)
    resultado=$(echo "$num1 + $num2" | bc)
    echo "El resultado de la suma es: $resultado"
    ;;
  2)
    resultado=$(echo "$num1 - $num2" | bc)
    echo "El resultado de la resta es: $resultado"
    ;;
  3)
    resultado=$(echo "$num1 * $num2" | bc)
    echo "El resultado de la multiplicación es: $resultado"
    ;;
  4)
    # Comprobación para evitar la división por cero
    if [ "$num2" -eq 0 ]; then
      echo "Error: No se puede dividir por cero."
    else
      # 'scale=2' para mostrar el resultado con dos decimales
      resultado=$(echo "scale=2; $num1 / $num2" | bc)
      echo "El resultado de la división es: $resultado"
    fi
    ;;
  *)
    echo "Opción no válida. Por favor, elige un número del 1 al 4."
    ;;
esac
