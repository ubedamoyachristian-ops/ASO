#!/bin/bash

# Define el nombre del archivo
output_file="lista.txt"

# Pide al usuario que introduzca una palabra
echo "Por favor, introduce una palabra:"
read palabra

# Añade la palabra al final del archivo lista.txt
# El operador >> se usa para la adición
echo "$palabra" >> "$output_file"

# Muestra un mensaje de confirmación
echo "La palabra '$palabra' ha sido añadida a '$output_file'."

# Opcional: Muestra el contenido actual del archivo para verificar
echo "---"
echo "Contenido actual de '$output_file':"
cat "$output_file"
