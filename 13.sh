#!/bin/bash

# Define el nombre del archivo de la agenda
agenda_file="lista.txt"

# Función para añadir un registro
function anadir_registro() {
  read -p "Nombre: " nombre
  read -p "Dirección: " direccion
  read -p "Teléfono: " telefono
  echo "$nombre,$direccion,$telefono" >> "$agenda_file"
  echo "Registro añadido con éxito."
}

# Función para buscar registros
function buscar_registro() {
  read -p "Introduce el término de búsqueda (nombre, dirección o teléfono): " termino
  if grep -q -i "$termino" "$agenda_file"; then
    echo "--- Resultados de la búsqueda ---"
    grep -i "$termino" "$agenda_file"
  else
    echo "No se encontraron registros que coincidan con '$termino'."
  fi
}

# Función para listar todos los registros
function listar_registros() {
  if [ -s "$agenda_file" ]; then
    echo "--- Lista de Registros ---"
    cat "$agenda_file"
  else
    echo "La agenda está vacía."
  fi
}

# Función para ordenar los registros
function ordenar_registros() {
  if [ -s "$agenda_file" ]; then
    sort -o "$agenda_file" "$agenda_file"
    echo "Registros ordenados alfabéticamente."
  else
    echo "La agenda está vacía. No hay nada que ordenar."
  fi
}

# Función para borrar el archivo
function borrar_archivo() {
  read -p "¿Estás seguro de que quieres borrar la agenda completa? (s/n): " confirmacion
  if [ "$confirmacion" == "s" ] || [ "$confirmacion" == "S" ]; then
    rm -f "$agenda_file"
    echo "El archivo '$agenda_file' ha sido borrado."
  else
    echo "Operación cancelada."
  fi
}

# Bucle principal del menú
while true; do
  echo "--- Menú de la Agenda ---"
  echo "1) Añadir un registro"
  echo "2) Buscar un registro"
  echo "3) Listar todos los registros"
  echo "4) Ordenar los registros"
  echo "5) Borrar la agenda"
  echo "6) Salir"
  echo "--------------------------"
  read -p "Elige una opción: " opcion

  case $opcion in
    1) anadir_registro ;;
    2) buscar_registro ;;
    3) listar_registros ;;
    4) ordenar_registros ;;
    5) borrar_archivo ;;
    6) echo "Saliendo de la agenda. ¡Hasta pronto!"; exit 0 ;;
    *) echo "Opción no válida. Por favor, elige una opción del 1 al 6." ;;
  esac
  echo
done
