#!/bin/bash

# --- a) Controlar que se indiquen dos parámetros ---
if [ "$#" -ne 2 ]; then
  echo "Error: Se requieren exactamente dos parámetros."
  echo "Uso: $0 <archivo_origen> <archivo_destino>"
  exit 1
fi

archivo_origen="$1"
archivo_destino="$2"

# --- b) Controlar que el primer parámetro exista y sea un archivo ordinario ---
if [ ! -f "$archivo_origen" ]; then
  echo "Error: El archivo de origen '$archivo_origen' no existe o no es un archivo ordinario."
  exit 1
fi

# --- c) Controlar que el segundo parámetro no exista ---
if [ -e "$archivo_destino" ]; then
  echo "Error: El destino '$archivo_destino' ya existe."
  exit 1
fi

# Realizar la copia del archivo
cp "$archivo_origen" "$archivo_destino"
echo "El archivo '$archivo_origen' ha sido copiado a '$archivo_destino'."
