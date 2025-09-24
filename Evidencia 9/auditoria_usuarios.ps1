$usuarios = Get-LocalUser
$sinLogon = @()
$conLogon = @()
$reporteTotal = @()

foreach ($u in $usuarios) {
    if (-not $u.LastLogon) {
        $sinLogon += "$($u.Name): Estado = $($u.Enabled), Último acceso = NUNCA"
        $reporteTotal += "$($u.Name): Estado = $($u.Enabled), Último acceso = NUNCA"
    } else {
        $conLogon += "$($u.Name): Estado = $($u.Enabled), Último acceso = $($u.LastLogon)"
        $reporteTotal += "$($u.Name): Estado = $($u.Enabled), Último acceso = $($u.LastLogon)"
    }
}

# Guardar en archivos separados
$sinLogon | Out-File -FilePath "$env:USERPROFILE\Desktop\usuarios_sin_logon.txt"
$conLogon | Out-File -FilePath "$env:USERPROFILE\Desktop\usuarios_con_logon.txt"

# Guardar el reporte total
$reporteTotal | Out-File -FilePath "$env:USERPROFILE\Desktop\reporte_usuarios.txt"

# Mostrar en pantalla
Write-Output "`n Usuarios que NUNCA han iniciado sesión:"
$sinLogon | ForEach-Object { Write-Output $_ }
Write-Output "`n Usuarios que SÍ han iniciado sesión:"
$conLogon | ForEach-Object { Write-Output $_ }