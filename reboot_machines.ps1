# Caminho para o arquivo com as máquinas
$filePath = "path"

# Verifica se o arquivo existe
if (-Not (Test-Path $filePath)) {
    Write-Host "Arquivo $filePath não encontrado." -ForegroundColor Red
    exit
}

# Lê cada linha do arquivo
$machines = Get-Content $filePath

foreach ($hhost in $machines) {
    Write-Host "Conectando-se a $hhost..." -ForegroundColor Cyan

    try {
         #Reinicia a máquina remotamente usando a credencial atual
        Invoke-Command -ComputerName $hhost -ScriptBlock {
            Restart-Computer -Force
        }

        Write-Host "Máquina $hhost reiniciada com sucesso." -ForegroundColor Green
    } catch {
        Write-Host "Erro ao conectar/reiniciar $hhost  $_" -ForegroundColor Red
    }
}

