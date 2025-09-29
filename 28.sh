#!/bin/bash
# informe_ips_libres.sh
# Genera un informe de las IP libres y usadas en la red local, usando funciones.

# =============================
# FUNCIONES
# =============================

# Función para obtener los datos de red (IP, máscara, red, broadcast)
obtener_datos_red() {
    # Interfaz con dirección IP (ignoramos loopback y virtuales)
    INTERFAZ=$(ip -o -4 addr show up | grep -v '127.0.0.1' | awk '{print $2}' | head -n1)
    
    if [ -z "$INTERFAZ" ]; then
        echo "No se encontró una interfaz de red activa."
        exit 1
    fi

    # Obtener IP/CIDR (ej: 192.168.1.34/24)
    IP_CIDR=$(ip -o -4 addr show "$INTERFAZ" | awk '{print $4}')
    # Obtener solo la IP
    IP_LOCAL=${IP_CIDR%/*}
    # Obtener la máscara de red en formato decimal
    MASCARA=$(ipcalc -m "$IP_CIDR" | awk -F': ' '/Netmask/ {print $2}')
    # Obtener dirección de red
    RED=$(ipcalc "$IP_CIDR" | awk -F': ' '/Network/ {print $2}')
    # Obtener broadcast
    BROADCAST=$(ipcalc "$IP_CIDR" | awk -F': ' '/Broadcast/ {print $2}')
    # CIDR
    CIDR=$(echo "$IP_CIDR" | cut -d/ -f2)
}

# Función para comprobar si una IP está libre usando ping
comprobar_ip() {
    local ip="$1"
    ping -c 1 -W 1 "$ip" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$ip --> OCUPADA"
    else
        echo "$ip --> LIBRE"
    fi
}

# Función principal que genera el informe
generar_informe() {
    obtener_datos_red

    echo "================= INFORME DE RED ================="
    echo "Interfaz:        $INTERFAZ"
    echo "IP local:        $IP_LOCAL"
    echo "Red:             $RED"
    echo "Máscara:         $MASCARA"
    echo "Broadcast:       $BROADCAST"
    echo "CIDR:            /$CIDR"
    echo "=================================================="
    echo "Escaneando IPs disponibles en la red ($RED)..."
    echo

    # Obtener rango de IPs de la red
    IFS='.' read -r oct1 oct2 oct3 oct4 <<< "$RED"
    IFS='.' read -r _ _ _ last <<< "$BROADCAST"

    # Iterar por todas las IPs válidas (excluye red y broadcast)
    for i in $(seq 1 $((last - 1))); do
        ip="$oct1.$oct2.$oct3.$i"
        comprobar_ip "$ip"
    done
}

# =============================
# INICIO DEL SCRIPT
# =============================
generar_informe
