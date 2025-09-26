#!/bin/bash

# Inicializa la variable para almacenar la suma
suma_total=0

echo "Introduce números para sumarlos. Introduce '0' para finalizar."
echo "---"

# Bucle principal que se ejecuta indefinidamente hasta que se rompa
while true; do
  read -p "Introduce un número: " numero

  # Comprueba si el número es 0
  if [ "$numero" -eq 0 ]; then
    echo "---"
    echo "¡Has introducido un 0! El script ha terminado."
    echo "La suma total es: $suma_total"
    break
  fi

  # Suma el número introducido al total acumulado
  suma_total=$((suma_total + numero))
  echo "Suma actual: $suma_total"
done
