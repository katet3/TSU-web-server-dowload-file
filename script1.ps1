# URL для скачивания файла QT.zip
$url = "http://192.168.1.200:6000/download/QT.zip"

# Путь для сохранения временного ZIP-архива
$tempZipPath = "C:\tmp\QT.zip"  # Используйте полный путь к файлу

# Путь для распаковки архива
$extractPath = "C:\"

# Создаем временный каталог, если его нет
if (-not (Test-Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath
}

if (-not (Test-Path "C:\tmp")) {
    New-Item -ItemType Directory -Path "C:\tmp"
}


# Скачиваем ZIP-архив
Invoke-WebRequest -Uri $url -OutFile $tempZipPath

# Распаковываем ZIP-архив
Expand-Archive -Path $tempZipPath -DestinationPath $extractPath -Force

# Удаляем временный ZIP-архив
Remove-Item $tempZipPath -Force