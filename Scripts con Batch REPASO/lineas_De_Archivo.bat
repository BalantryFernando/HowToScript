

:: Lee las lineas y por cada una imprime el texto linea:...

@echo off 
setlocal enabledelayedexpansion
:: En este bucle ten en cuenta todas las lineas, con la variable %%a en el archivo.txt realizando el siguiente codigo
for /f "tokens=* delims=" %%a in (archivo.txt) do (
    ::declara que la variable a(que es cada linea del texto) es linea
    set "linea=%%a"
    ::Manda el mensaje que cada linea tiene el siguiente contenido
    echo Linea: !linea!
)
pause
