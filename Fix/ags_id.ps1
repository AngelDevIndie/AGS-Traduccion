# SCRIPT para extraer el GameID y el GameName del juego en AGS 3.6
# Genera un archivo de salida translation.trs listo para añadir las líneas a traducir
# v.0.2 by Kurt (23-11-24)
# Probado en AGS 3.6.1.xx

# REQUISITOS:
# Tener permisos de ejecución de scripts en powershell. Si no lo tienes, puedes obtenerlo con el comando en la misma ventana de powershell :  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# Usar archivo game28.dta del juego como parámetro para que funcione el script.

# Cabecera
Write-Output "------------------------------------------------"
Write-Host "AGS_ID Extraccion del ID y nombre del juego AGS" -BackgroundColor Blue -ForegroundColor White
Write-Output "Autor: Kurt (Abandonsocios)"
Write-Output "Version: 0.2.0"
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

# Posición inicial para la lectura de la cadena
$startPositionString = 50  # Cambia este valor según tu necesidad

# Posición inicial para leer los 4 bytes
$positionHex = 1830  # Cambia este valor según tu necesidad

# Ruta para guardar el archivo "translation.trs"
$outputFilePath = "translation.trs"

# Abre el archivo en modo binario
$fileStream = [System.IO.File]::OpenRead($filePath)

try {
    ### Parte 1: Leer la cadena que termina en 0x00 ###
    # Mueve el puntero del archivo a la posición especificada para la cadena
    $fileStream.Seek($startPositionString, [System.IO.SeekOrigin]::Begin) | Out-Null

    # Crea una lista para almacenar los bytes leídos
    $byteList = @()

    # Variable para almacenar el byte actual
    $currentByte = 0

    # Leer byte por byte hasta encontrar 0x00 o el final del archivo
    do {
        $currentByte = $fileStream.ReadByte()

        # Si no es 0x00 ni el final del archivo (-1), agregar a la lista
        if ($currentByte -ne 0x00 -and $currentByte -ne -1) {
            $byteList += [byte]$currentByte
        }
    } while ($currentByte -ne 0x00 -and $currentByte -ne -1)

    # Convierte la lista de bytes a una cadena de texto
    $stringResult = [System.Text.Encoding]::ASCII.GetString($byteList)

    # Imprime la cadena encontrada en la consola
    Write-Output "GameName: $stringResult"

    ### Parte 2: Leer los 4 bytes en la posición 1830 ###
    # Mueve el puntero del archivo a la posición especificada para los 4 bytes
    $fileStream.Seek($positionHex, [System.IO.SeekOrigin]::Begin) | Out-Null

    # Crea un buffer para almacenar los 4 bytes
    $bufferHex = New-Object byte[] 4

    # Lee los 4 bytes
    $bytesRead = $fileStream.Read($bufferHex, 0, 4)

    # Convierte los bytes leídos a su representación hexadecimal
    $hexValue = ($bufferHex | ForEach-Object { $_.ToString("X2") }) -join " "

    # Imprime el valor hexadecimal en la consola
    Write-Output "GameID en hexadecimal : $hexValue"
	
	### Parte 3: Convertir a decimal Little Endian ###
    # Invierte el orden de los bytes para interpretar como Little Endian
    $littleEndianBytes = [System.BitConverter]::ToUInt32($bufferHex, 0)

    # Imprime el valor en decimal interpretado como Little Endian
    Write-Output "GameID en decimal : $littleEndianBytes"
	
	### Parte 4: Crear el archivo de texto "translation.trs" ###
    # Plantilla del archivo de salida
    $template = "//#GameId=$littleEndianBytes
//#GameName=$stringResult
//#Encoding=ASCII
"
	# Escribir la plantilla en el archivo
    $template | Set-Content -Path $outputFilePath -Encoding ASCII

    Write-Host "Archivo generado en: $outputFilePath" -BackgroundColor Cyan -ForegroundColor Black

} finally {
    # Asegúrate de cerrar el archivo después de usarlo
    $fileStream.Close()
}
