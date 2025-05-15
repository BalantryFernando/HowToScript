
:: Para buenas practicas separe el script que enviaste en dos, pues asi lo entenida mejor

::Para no ver las lineas de script cuando se ejecuta
@echo off 
::Sirve para que todas las variables usadas, sirven en el entorno local
setlocal copiarlog
:: Este codigo estaba mal, pues faltaba el '='
:: Definen la variable segun la ubiacación de la carpeta de lo que quieres copiar 
set/p ORIGEN Ruta de origen para la copia:
:: Define la variable segun la ubicación de la carpeta que quieres copiar
set/p DESTINO Ruta de destino para la copia: 
:: Se crea dicha carpeta si no existe
if not exist "%DESTINO%" mkdir "%DESTINO%" 
:: Comentario para el leector y sepa que se esta iniciando el backup
echo Iniciando backup... 
:: Se usara robocopy 
robocopy "%ORIGEN%" "%DESTINO%" /E/Z/NP/LOG+:log_admin.txt 
echo --->> log_admin.txt 
echo [%DATE% %TIME%] Configuración de red: IP=%IP%, MASK=%MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt 
echo [%DATE% %TIME%] Copia realizada de "%ORIGEN%" a "%DESTINO%" >> log_admin.txt 
echo Operación completada. Revisa el archivo log_admin.txt 
pause