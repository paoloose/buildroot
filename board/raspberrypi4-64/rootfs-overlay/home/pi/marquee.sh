#!/usr/bin/env bash

# Marquee text
TEXT="Gutierrez Flores Juarez"

# Hide cursor while running
tput civis
trap 'tput cnorm; clear; exit' INT TERM

while true; do
    # Get current terminal width
    WIDTH=$(tput cols)

    # Move text from left to right
    for ((pos=0; pos<=WIDTH; pos++)); do
        clear
        printf "%*s%s\n" "$pos" "" "$TEXT"
        sleep 0.05
    done
done
