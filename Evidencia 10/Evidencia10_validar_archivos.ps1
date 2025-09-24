function Validar-Archivo {
    param ([string]$Ruta)
    try {
        if (Test-Path $Ruta) {
            $contenido = Get-Content $Ruta -ErrorAction Stop
            return "Archivo encontrado y accesible: $Ruta"
        } else {
            throw "El archivo no existe."
        }
    }
    catch {
        return "Error: $_"
    }
    finally {
        Write-Host "Validación finalizada para: $Ruta" -ForegroundColor Cyan
    }
}

# Prueba de la función
Validar-Archivo -Ruta "C:\archivo_inexistente.txt"

# Obtener Fecha
$Fecha = Get-Date -Format ddMMyyyy

# Creando archivo
New-Item  "$env:USERPROFILE\Desktop\Evidencia10_reporte_$($Fecha).txt"

#Asegúrate de crear un archivo txt con el nombre archivo en el Escritorio
Validar-Archivo -Ruta "$env:USERPROFILE\Desktop\Evidencia10_reporte_$($Fecha).txt"
