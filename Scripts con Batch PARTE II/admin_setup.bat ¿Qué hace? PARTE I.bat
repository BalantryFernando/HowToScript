:: Para una salida limpia y no ver como las lineas se ejecutan
@echo off 
:: Para que las variables usadas a continuación tengan en esta parte del codigo,
setlocal enabledelayedexpansion 
:: Para asigna variables  IP, MASCARA y PUERTA con la interacción del usuario
set/p IP=Introduce la IP estática: 
set/p MASCARA=Introduce la máscara de subred: 
set/p PUERTA=Introduce la puerta de enlace:
:: Mensaje para el leector y se pine como si se estuviese configurando la IP 
echo Configurando IP...
:: Este sirve para entrar a la configuración del adaptador, en este caso "Ethernet" y asignarle la IP, MASARA y PUERTA  con las variables que escribior el usuario 
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA%
:: Mensaje para entregarle al lector de que la configuración ha sido aplicada 
echo Configuración aplicada.
:: Para pulsar una tecla y que el usuario entienda que finalizo el script como tal
pause