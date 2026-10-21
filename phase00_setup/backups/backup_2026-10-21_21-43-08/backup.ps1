param(
    [string]$Source = ".",
    [string]$Destination = "..\backups"
)

$stamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$target = Join-Path $Destination "backup_$stamp"
New-Item -ItemType Directory -Force -Path $target | Out-Null

Copy-Item -Path (Join-Path $Source "*") -Destination $target -Recurse -Exclude ".venv", ".git"

Write-Host "Backed up $Source to $target"