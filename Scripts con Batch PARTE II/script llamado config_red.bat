
:: Crea un script llamado config_red.bat que: 
@echo off
setlocal Ejercicio1

set /p IP=Introduce tu IP estatica:
set /p MASCARA=Introduce la mascara de subred:
set /p PUERTA=Introduce la puerta de enlace:

echo Configurando IP...
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA%
echo Configuiración aplicada.
::● Cree un log (registro) con la fecha y la configuración aplicada. 
pause 

