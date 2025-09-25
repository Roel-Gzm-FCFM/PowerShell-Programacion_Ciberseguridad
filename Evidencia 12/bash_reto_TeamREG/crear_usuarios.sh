#!/bin/bash

# Lee el archivo "usuarios.txt" línea por línea
while IFS=':' read -r usuario contrasena
do
  # Crea el usuario con su carpeta personal (-m)
  useradd -m "$usuario"

  # Asigna la contraseña que viene en el archivo
  echo "$usuario:$contrasena" | chpasswd

  # Muestra en pantalla que el usuario fue creado
  echo "Usuario '$usuario' creado exitosamente."

done < "usuarios.txt"
