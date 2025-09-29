#!/bin/bash
# ej27_existe.sh
# Uso: ./ej27_existe.sh <ruta_fichero>
# Función: existe <fichero> comprueba existencia; si existe, pone exec solo para el propietario.

# Función 'existe' que recibe el nombre del fichero como parámetro
existe() {
    local fichero="$1"

    if [ -z "$fichero" ]; then
        echo "Error: no se ha proporcionado nombre de fichero."
        return 2
    fi

    if [ -e "$fichero" ]; then
        # Fichero existe
        echo "El fichero '$fichero' existe."
        # Añadir permiso de ejecución para el propietario y eliminar ejecución para grupo y otros
        chmod u+x,go-x "$fichero"
        if [ $? -eq 0 ]; then
            echo "Permisos cambiados: ejecución habilitada solo para el propietario."
            # Mostrar permisos resultantes (opcional)
            ls -l "$fichero"
            return 0
        else
            echo "Error al cambiar permisos en '$fichero'." >&2
            return 3
        fi
    else
        # No existe
        echo "El fichero '$fichero' NO existe."
        return 1
    fi
}

# --- Script principal ---
if [ $# -lt 1 ]; then
    echo "Uso: $0 <ruta_fichero>"
    exit 2
fi

# Llamada a la función con el primer parámetro del script
existe "$1"
exit $?
