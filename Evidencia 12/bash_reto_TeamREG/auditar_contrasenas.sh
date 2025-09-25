#!/bin/bash

# 1. Combina los archivos de contraseñas en un formato que John entiende.
unshadow /etc/passwd /etc/shadow > hashes.txt

# 2. Ejecuta John con el diccionario rockyou.txt. La salida se oculta para no llenar la pantalla.
john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt > /dev/null 2>&1

# 3. Crea el encabezado del reporte.
echo "Usuario | Estado de contraseña" > reporte_contrasenas.txt
echo "--------|--------------------" >> reporte_contrasenas.txt

# 4. Guarda en una variable solo los nombres de usuario que John pudo descifrar.
cracked_users=$(john --show hashes.txt | cut -d: -f1)

# 5. Lee el archivo original de usuarios para saber a quiénes auditar.
while IFS=: read -r usuario _ ; do
  # Comprueba si el usuario actual está en la lista de usuarios descifrados.
  if echo "$cracked_users" | grep -q "^$usuario$"; then
    # Si está en la lista, la contraseña es DÉBIL.
    echo "$usuario | Débil" >> reporte_contrasenas.txt
  else
    # Si no está, se considera FUERTE.
    echo "$usuario | Fuerte" >> reporte_contrasenas.txt
  fi
done < "usuarios.txt"

# 6. Muestra el reporte final en la pantalla.
echo "--- Auditoría Finalizada. Reporte: ---"
cat reporte_contrasenas.txt

# 7. Limpia el archivo temporal que se creó.
rm hashes.txt
