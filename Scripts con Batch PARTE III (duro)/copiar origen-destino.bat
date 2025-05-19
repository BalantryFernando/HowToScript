


:: Si queremos copiar los 5 primeros archivos.txt (se seguria un orden como tal) + se renombraran como copia_1.txt y en orden...
@echo off 
setlocal enabledelayedexpansion

set "origen=C:\Users\Delune1\Documents"
set "destino=C:\Copias_respaldo_documentos"
:: Lo que depende como tal es el numero, porque si ponemos un nombre claramente funcionaria
set contador=1

::Se crea el directorio destino si no existe, la carpeta como tal
if not exist "%destino%" mkdir "%destino%"

:: Es la configuración dinamica para hacer copias de archivos con numero
:: y todo
for %%F in (%origen%\*.txt) do (
:: En el directorio "origen", ten en cuenta los txt y haz lo siguiente
    copy "%%F" "%destino%\copia_!contador!.txt"
    :: copia el "archiv_origen.txt" al destino, el archivo copiado tendra el nombre copia_1
    echo Copiado: %%F como_copia_!contador!.txt
    ::envia el mensaje Copiado: %%F que sera el archivo.txt original para que el usuario etienda que copia es "como_copia_1"
    set /a contador+=1+
    :: ira en ascendente osea, se sumara uno
    if !contador! gtr 5 goto:fin
    ::hasta llegar a 5
)
:fin
pause
endlocal
