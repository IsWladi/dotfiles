#!/usr/bin/env bash

# Nombres de tus monitores (CAMBIA ESTO)
LAPTOP="eDP-1"
# Busca cualquier monitor que NO sea la laptop
EXTERNAL=$(hyprctl monitors | grep -v "$LAPTOP" | grep "Monitor" | head -n1 | awk '{print $2}')

if [[ -z "$EXTERNAL" ]]; then
    # Si NO hay monitor externo, asegúrate de que la laptop esté encendida
    # aunque cierres la tapa (para que no se duerma o quede negra)
    hyprctl keyword monitor "$LAPTOP, preferred, auto, 1"
else
    # Si HAY monitor externo...
    # Chequeamos el estado de la tapa (open / closed)
    if grep -q open /proc/acpi/button/lid/LID0/state; then
        # Tapa abierta: Activar laptop
        hyprctl keyword monitor "$LAPTOP, preferred, auto, 1"
    else
        # Tapa cerrada: Desactivar laptop (Esto mueve los workspaces al externo)
        hyprctl keyword monitor "$LAPTOP, disable"
    fi
fi
