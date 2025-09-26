#!/bin/bash

# Número a adivinar (fijo)
numero_secreto=42

echo "¡Bienvenido al juego de adivinar el número!"
echo "Estoy pensando en un número entre 1 y 100."
echo "Introduce 0 para rendirte."
echo "---"

# Bucle principal del juego
while true; do
  # Solicita un número al usuario
  read -p "Introduce tu suposición: " suposicion

  # Comprueba si el usuario quiere rendirse
  if [ "$suposicion" -eq 0 ]; then
    echo "Te has rendido. El número era $numero_secreto."
    break
  fi

  # Comprueba si el número introducido es un número válido
  if ! [[ "$suposicion" =~ ^[0-9]+$ ]]; then
    echo "Entrada no válida. Por favor, introduce un número entero."
    continue
  fi

  # Compara la suposición con el número secreto
  if [ "$suposicion" -eq "$numero_secreto" ]; then
    echo "¡Enhorabuena! ¡Has adivinado el número $numero_secreto!"
    break
  elif [ "$suposicion" -lt "$numero_secreto" ]; then
    echo "El número secreto es MAYOR que $suposicion."
  else
    echo "El número secreto es MENOR que $suposicion."
  fi
done
