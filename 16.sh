#!/bin/bash

echo "Calculando la suma de los números del 1 al 1000..."
echo "----------------------------------------------"

# 1. Suma con una estructura 'for'
suma_for=0
for i in $(seq 1 1000); do
  suma_for=$((suma_for + i))
done
echo "Suma (con bucle for): $suma_for"

echo "----------------------------------------------"

# 2. Suma con una estructura 'while'
suma_while=0
contador_while=1
while [ $contador_while -le 1000 ]; do
  suma_while=$((suma_while + contador_while))
  contador_while=$((contador_while + 1))
done
echo "Suma (con bucle while): $suma_while"

echo "----------------------------------------------"

# 3. Suma con una estructura 'until'
suma_until=0
contador_until=1
until [ $contador_until -gt 1000 ]; do
  suma_until=$((suma_until + contador_until))
  contador_until=$((contador_until + 1))
done
echo "Suma (con bucle until): $suma_until"

echo "----------------------------------------------"
