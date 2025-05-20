

@echo off
setlocal enabledelayedexpansion

set "origen=archivo.txt"

for /L %%i in (1,1,5) do (
    copy "%origen%" "archivo_%%i.txt"
    echo Copiada como archivo_%%i.txt
)

endlocal

:: En este script si tenemos archivo.txt en la misma carpeta, se duplica una cantidad exacta de veces, como lo hemos definido seran unas 5 veces.