#!/usr/bin/env bash

# Marquee text
TEXT="Gutierrez Flores Juarez"

# Hide cursor while running (usando codigos ANSI en lugar de tput)
printf "\033[?25l"
trap 'printf "\033[?25h"; clear; exit' INT TERM

while true; do
    # Fijamos el ancho de la terminal manualmente
    WIDTH=80

    # Move text from left to right
    pos=0

    # MUY IMPORTANTE: Nota los espacios despues de while y dentro de los corchetes
    while [ $pos -lt $WIDTH ]; do
        clear
        printf "%*s%s\n" "$pos" "" "$TEXT"
        sleep 0.05
        pos=$((pos + 1))
    done
done
