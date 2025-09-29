#!/bin/bash
# buscar_peligrosos.sh
# Busca ficheros regulares que puedan ser modificados por cualquier usuario (o+w)
# Guarda la lista de rutas absolutas en archivos_peligrosos.txt

OUTFILE="archivos_peligrosos.txt"

# Cabecera en el fichero de salida con fecha
echo "Listado de ficheros world-writable (others write) - $(date)" > "$OUTFILE"
echo "Ruta absoluta" >> "$OUTFILE"
echo "----------------" >> "$OUTFILE"

# Buscar desde el directorio actual (usa pwd para obtener ruta absoluta)
find "$(pwd)" -type f -perm -o=w -print >> "$OUTFILE"

# Contar y mostrar resumen
COUNT=$(wc -l < "$OUTFILE")
echo "Hecho. $COUNT líneas escritas en $OUTFILE"
