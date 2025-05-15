
:: Crea un script llamado config_red.bat que: 
@echo off
setlocal Ejercicio1

set /p IP=Introduce tu IP estatica:
set /p MASCARA=Introduce la mascara de subred:
set /p PUERTA=Introduce la puerta de enlace:

echo Configurando IP...
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA%
echo Configuiración aplicada.
echo Iniciando registro con fecha y configuración aplicada
echo [%DATE% %TIME%] Configuración de red: IP=%IP%, %MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt
echo Operación realiada con exito, revisa log_admin.txt para comprobarlo
pause 

