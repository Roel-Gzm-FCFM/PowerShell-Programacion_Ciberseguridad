Get-Process | Where-Object {$_.WorkingSet -gt 100MB} | Format-Table @(
'ProcessName'
'Id'
@{ Name = 'WS(K)'; Expression = { [int] ($_.WS / 1MB) } }
) -AutoSize | Out-File "Procesos_Filtrados_$($(Get-Date -Format dd_MM_yyyy)).txt"
