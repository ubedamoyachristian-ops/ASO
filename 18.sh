#!/bin/bash

# Bucle principal para las filas
for i in {1..5}; do
  # Bucle anidado para los números en cada fila
  for j in $(seq 1 $i); do
    # Imprime el número sin una nueva línea
    echo -n "$j"
  done
  # Imprime una nueva línea al final de cada fila
  echo ""
done
