# SCRIPT para modificar el archivo game28.dta para versiones de AGS 3.6.14 en adelanta y que funcione AGSUnpacker
# Se crea un game28.dta funcional, y una vez usado AGSUnpacker se debe volver a renombrar el game28.dta.bak
# Se sabe que AGSUnpacker v.0.7-110123 extrae los assets de cualquier juego, pero la creación del TRS y del GameID no funciona a partir de AGS 3.6.14
# debido a que hay nuevos bloques como "v361_objnames"
# v.0.1 by Kurt (23-11-24)
# Probado en AGS 3.6.1.14 a AGS 3.6.1.27

# REQUISITOS:
# Tener permisos de ejecución de scripts en powershell. Si no lo tienes, puedes obtenerlo con el comando en la misma ventana de powershell :  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Usar archivo game28.dta del juego como parámetro para que funcione el script.

# Cabecera
Write-Output "------------------------------------------------"
Write-Host "AGS_FIX Modificacion del archivo game28.dta" -BackgroundColor Blue -ForegroundColor White
Write-Output "Autor: Kurt (Abandonsocios)"
Write-Output "Version: 0.1"
Write-Output "Fecha creacion: 23-11-24"
Write-Output "------------------------------------------------"

# Verifica si se proporcionó la ruta como parámetro
if ($args.Count -eq 0) {
    Write-Error "Por favor, proporciona la ruta del archivo game28.dta como primer parametro."
    exit 1
}

# Obtiene el directorio del script actual
$scriptDirectory = $PSScriptRoot

# Toma la ruta del archivo binario desde el primer parámetro
$filePath = $args[0]

# Convierte la ruta relativa a absoluta, tomando como base el directorio del script
if (-not [System.IO.Path]::IsPathRooted($filePath)) {
    $filePath = [System.IO.Path]::Combine($scriptDirectory, $filePath)
}

Write-Output "Archivo binario : $filePath"

# Verifica si el archivo existe
if (-not (Test-Path -Path $filePath)) {
    Write-Error "El archivo especificado no existe: $filePath"
    exit 1
}

# Verifica que el nombre del archivo sea exactamente "game28.dta"
$fileName = [System.IO.Path]::GetFileName($filePath)

if ($fileName -ne "game28.dta") {
    $respuesta = Read-Host "Advertencia: El archivo no se llama 'game28.dta'. Deseas continuar? (S/N)"
    if ($respuesta -ne 'S' -and $respuesta -ne 's') {
        Write-Host "El script se ha detenido. El archivo debe llamarse 'game28.dta'."
        exit 1
    }
}

# Bytes a buscar
$searchBytes = 0x76, 0x33, 0x36, 0x31
$updateInterval = 10000 # Actualiza la barra de progreso cada 10,000 iteraciones

# Lee todo el archivo en memoria
$fileBytes = [System.IO.File]::ReadAllBytes($FilePath)

# Muestra el tamaño total del archivo
Write-Host "Tamaño del archivo: $($fileBytes.Length) bytes." -ForegroundColor Yellow

# Función para buscar los bytes dentro del archivo con barra de progreso optimizada
function Find-BytesPosition {
    param (
        [byte[]]$Data,       # Datos del archivo
        [byte[]]$Pattern,    # Patrón a buscar
        [int]$UpdateInterval # Frecuencia de actualización de la barra de progreso
    )

    $totalLength = $Data.Length
    $patternLength = $Pattern.Length
    $lastProgress = -1

    for ($i = 0; $i -le $totalLength - $patternLength; $i++) {
        # Actualiza la barra de progreso cada $UpdateInterval iteraciones
        if ($i % $UpdateInterval -eq 0) {
            $percentComplete = [math]::Floor(($i / ($totalLength - $patternLength)) * 100)
            if ($percentComplete -ne $lastProgress) {
                Write-Progress -Activity "Buscando bytes en el archivo" -Status "Completado: $percentComplete%" -PercentComplete $percentComplete
                $lastProgress = $percentComplete
            }
        }

        # Compara directamente los bytes del patrón con los bytes en la posición actual
        $match = $true
        for ($j = 0; $j -lt $patternLength; $j++) {
            if ($Data[$i + $j] -ne $Pattern[$j]) {
                $match = $false
                break
            }
        }

        if ($match) {
            return $i # Devuelve la posición
        }
    }

    return -1 # No encontrado
}

# Buscar los bytes en el archivo
Write-Host "Iniciando búsqueda de los bytes: $([BitConverter]::ToString($searchBytes))" -ForegroundColor Cyan
$position = Find-BytesPosition -Data $fileBytes -Pattern $searchBytes -UpdateInterval $updateInterval

# Resultado de la búsqueda
if ($position -ge 0) {
    Write-Host "Cadena encontrada en la posición: $position" -ForegroundColor Green

    # Restar una posición
    $position_v360 = $position - 1
    Write-Host "Nueva posición ajustada (v360): $position_v360" -ForegroundColor Cyan

    # Tamaño total del archivo
    $position_end = $fileBytes.Length - 1
    Write-Host "Última posición en el archivo: $position_end" -ForegroundColor Yellow

    # Seleccionar la parte del archivo a excluir
    $dataBefore = $fileBytes[0..($position_v360 - 1)] # Bytes antes de $position_v360
    $dataAfter = $fileBytes[($position_end + 1)..($fileBytes.Length - 1)] # Bytes después de $position_end

    # Combina las partes restantes del archivo
    $outputData = $dataBefore + $dataAfter
	
	# Creacion backup game28.dta a game28.dta.bak
	#$filePathBackup = $filePath + ".bak"
	#ren $filePath $filePathBackup
	
	#Crea una copia de seguridad del archivo original
	$backupFilePath = "$FilePath.bak"
	Copy-Item -Path $FilePath -Destination $backupFilePath -Force
	Write-Host "Copia de seguridad creada: $backupFilePath" -ForegroundColor Green

    # Ruta del archivo de salida
    $outputFilePath = [System.IO.Path]::Combine([System.IO.Path]::GetDirectoryName($FilePath), "game28.dta")

    # Escribe los datos en el nuevo archivo
    [System.IO.File]::WriteAllBytes($outputFilePath, $outputData)

    Write-Host "Archivo generado excluyendo la selección: $outputFilePath" -ForegroundColor Green
} else {
    Write-Host "Cadena no encontrada en el archivo." -ForegroundColor Red
}