#!/bin/bash

# Obtiene la hora actual del sistema en formato de 24 horas
# La opción %H del comando date devuelve la hora (00-23)
hora=$(date +%H)

# Comprueba la hora para mostrar el mensaje adecuado
if (( hora >= 8 && hora < 15 )); then
  echo "Buenos días"
elif (( hora >= 15 && hora < 20 )); then
  echo "Buenas tardes"
else
  echo "Buenas noches"
fi
