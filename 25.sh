#!/bin/bash

# Mostrar los últimos usuarios que iniciaron sesión, con su IP
last | egrep -o '^[^\s]+.*([0-9]{1,3}\.){3}[0-9]{1,3}'
