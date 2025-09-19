#!/bin/bash

# Define la ruta del archivo de salida
output_file="listado_etc.txt"

# Lista el contenido del directorio /etc y redirige la salida al archivo
ls -la /etc > "$output_file"

# Muestra un mensaje para confirmar que el listado se ha guardado
echo "El listado de archivos y directorios de /etc se ha guardado en $output_file"

# Muestra el contenido del archivo en la pantalla
echo "Mostrando el contenido del listado:"
cat "$output_file"

# --- Análisis del archivo ---

# Usa wc para contar el número de líneas y palabras del archivo.
# wc -l cuenta las líneas, wc -w cuenta las palabras.
num_lines=$(wc -l < "$output_file")
num_words=$(wc -w < "$output_file")

# Muestra los resultados en la pantalla
echo "---"
echo "Análisis del archivo:"
echo "El archivo tiene $num_lines líneas."
echo "El archivo tiene $num_words palabras."

# Opcional: Elimina el archivo temporal
# rm "$output_file"
