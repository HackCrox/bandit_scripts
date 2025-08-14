#!/bin/bash

ctrl_c() {
  echo -e "\n\n[!] Saliendo..."
  exit 1
}

# ctrl_c
trap ctrl_c INT

first_file_name="data.gz"
descompressed_file_name=$(7z l data.gz | tail -n3 | head -n1 | awk 'NF{print $NF}')

7z x $first_file_name &>/dev/null

while [[ $descompressed_file_name ]]; do
  echo -e "\n[+] Nuevo archivo comprimido $descompressed_file_name"
  7z x $descompressed_file_name &>/dev/null
  descompressed_file_name=$(7z l $descompressed_file_name 2>/dev/null | tail -n3 | head -n1 | awk 'NF{print $NF}')
done

