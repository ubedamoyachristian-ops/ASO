#!/bin/bash

# Bucle principal para las filas, del 1 al 5
for i in {1..5}; do
  # Bucle anidado para imprimir el número 'i' 'i' veces
  for j in $(seq 1 $i); do
    # Imprime el número 'i' sin una nueva línea
    echo -n "$i"
  done
  # Imprime una nueva línea para pasar a la siguiente fila
  echo ""
done
