#!/bin/bash

ctrl_c () { 
  echo -e "[+] Saliendo..."
  exit 1
  tput cnorm
}

trap ctrl_c INT

tput civis
for i in $(seq 1 254); do
  timeout 1 bash -c "ping -c 1 192.168.1.$i &>/dev/null" && echo "[+] Host 192.168.1.$i - ACTIVE" &
done; wait
tput cnorm
