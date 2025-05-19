

::Y por último para ser completamente feliz. ¿Qué tal si le preguntamos al usuario las carpetas de origen y de destino?  (Y su nombre para personalizar). 

@echo off
setlocal enabledelayedexpansion

::Se pide el nombre del usuario
set /p nombre= Nombre de usuario:

:: Se pide la carpeta de origen
set /p origen= Introduce la ruta de la carpeta de origen (ej: C:\Users\Windows)

:: Se pide la carpeta de destino
set /p destino= Introduce la ruta de la carpeta de destino (ej: C:\Copias_respaldo_documentos)
:: Asignamos una variable de contador para que se marque que nuemero estamos usando (mas adelante)
set contador=1

:: Creamos el directorio destino si no existe
if not exist "%destino%" mkdir "%destino%"

:: Lo configuramos de forma dinamica para hacer copias de archivos, contandolo y sabiendo que informacion pillar
for %%F in (%origen%\.txt) do (
    ::Copias el archivo de origen, teniendo en cuenta el destino y su contador
    copy "%%F" "%destino%\copia_!contador!.txt"
    :: Mandas este mensaje de forma dinamica segun las variables
    echo Copiado: %%F como copia_!contador!.txt
    :: Se le ira sumando 1 a la variable contador, que aparecera arriba
    set /a contador+=1
    :: Se sumara hasta el numero 5
    if !contador! gtr 5 goto:fin
)

:fin
echo Copias realizadas por: %nombre% que es un duroo
pause
endlocal