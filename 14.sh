#!/bin/bash

# Función para dar de alta a un usuario
function dar_alta() {
    # Extraer el nombre de usuario de los parámetros
    nombre_user=$(echo "$2" | cut -c1-1 | tr '[:upper:]' '[:lower:]')
    apellido1_user=$(echo "$3" | cut -c1-2 | tr '[:upper:]' '[:lower:]')
    apellido2_user=$(echo "$4" | cut -c1-2 | tr '[:upper:]' '[:lower:]')
    id_usuario="alu${apellido1_user}${apellido2_user}${nombre_user}"

    # Asignar el grupo
    if [ -z "$5" ]; then
        grupo="$id_usuario"
        groupadd "$grupo"
        echo "Se ha creado el nuevo grupo: $grupo"
    else
        grupo="$5"
        if ! getent group "$grupo" &>/dev/null; then
            echo "Error: El grupo '$grupo' no existe."
            exit 1
        fi
    fi

    # Dar de alta al usuario
    useradd -m -g "$grupo" -c "$2 $3 $4" "$id_usuario"
    if [ $? -eq 0 ]; then
        echo "Usuario '$id_usuario' dado de alta con éxito."
    else
        echo "Error al dar de alta al usuario."
        exit 1
    fi
}

# Función para dar de baja a un usuario
function dar_baja() {
    # Calcular el ID del usuario a partir de los parámetros
    nombre_user=$(echo "$2" | cut -c1-1 | tr '[:upper:]' '[:lower:]')
    apellido1_user=$(echo "$3" | cut -c1-2 | tr '[:upper:]' '[:lower:]')
    apellido2_user=$(echo "$4" | cut -c1-2 | tr '[:upper:]' '[:lower:]')
    id_usuario="alu${apellido1_user}${apellido2_user}${nombre_user}"

    # Comprobar si el usuario existe antes de intentar borrarlo
    if id "$id_usuario" &>/dev/null; then
        userdel -r "$id_usuario"
        if [ $? -eq 0 ]; then
            echo "Usuario '$id_usuario' dado de baja con éxito."
        else
            echo "Error al dar de baja al usuario."
            exit 1
        fi
    else
        echo "Error: El usuario '$id_usuario' no existe."
        exit 1
    fi
}

# --- Validación de la sintaxis y ejecución ---

# Comprobar el número de parámetros
if [ "$#" -lt 4 ]; then
    echo "Error. La sintaxis correcta es: ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi

# Asignar la opción a una variable
opcion="$1"

# Evaluar la opción elegida
case "$opcion" in
    "alta")
        if [ "$#" -lt 4 ] || [ "$#" -gt 5 ]; then
            echo "Error. La sintaxis para 'alta' es: ./gestionusuarios.sh alta nombre apellido1 apellido2 [grupo]"
            exit 1
        fi
        dar_alta "$@"
        ;;
    "baja")
        if [ "$#" -ne 4 ]; then
            echo "Error. La sintaxis para 'baja' es: ./gestionusuarios.sh baja nombre apellido1 apellido2"
            exit 1
        fi
        dar_baja "$@"
        ;;
    *)
        echo "Error. La sintaxis correcta es: ./gestionusuarios.sh alta/baja nombre apellido1 apellido2 [grupo]"
        exit 1
        ;;
esac

exit 0
