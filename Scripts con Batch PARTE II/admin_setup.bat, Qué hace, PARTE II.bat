:: Este script tiene dos funcionalides
::        - Cambiar la IP, MASCARA, PUERTA segun lo que quiera el usuario
::        - Hacer una copia de seguridad del archivo 
:: Posteriormente crea un archivo log que contedra fecha y hora de estas dos funcionalidades 

@echo off
setlocal enabledelayedexpansion 
:: Para asigna variables  IP, MASCARA y PUERTA con la interacción del usuario
set/p IP=Introduce la IP estática: 
set/p MASCARA=Introduce la máscara de subred: 
set/p PUERTA=Introduce la puerta de enlace:
:: Mensaje para el leector y se pine como si se estuviese configurando la IP 
echo Configurando IP...
:: Este sirve para entrar a la configuración del adaptador, en este caso "Ethernet" y asignarle la IP, MASCARA y PUERTA  con las variables que escribio el usuario 
netsh interface ip set address "Ethernet" static %IP% %MASCARA% %PUERTA%
:: Mensaje para entregarle al lector de que la configuración ha sido aplicada 
echo Configuración aplicada.
:: Para pulsar una tecla y que el usuario entienda que finalizo el script como tal
::-------------------------------------------------:
:: Este codigo estaba mal, pues faltaba el '='
:: Definen la variable segun la ubiacación de la carpeta de lo que quieres copiar 
set/p ORIGEN Ruta de origen para la copia:
:: Define la variable segun la ubicación de la carpeta que quieres copiar
set/p DESTINO Ruta de destino para la copia: 
:: Se crea dicha carpeta si no existe
if not exist "%DESTINO%" mkdir "%DESTINO%" 
:: Comentario para el leector y sepa que se esta iniciando el backup
echo Iniciando backup... 
:: Se usara robocopy, en este caso  robocopy usara la ubicación escrito en origen y lo llevara a la ubicación como destino. Haciendo la copia de seguridad de tal archivo "log_admin.txt"
:: ! /E /Z /NP son parametros del robocopy!
robocopy "%ORIGEN%" "%DESTINO%" /E/Z/NP/LOG+:log_admin.txt 
:: este "---" puede confundir pero en verdad separa la ultima información puesta en el archivo log_admin.txt, para asi mantener un orden
echo --->> log_admin.txt 
:: imprime la siguiente información en la ultima linea de log_admin.txt sin sobrescribir nada(en este caso fecha y hora).
echo [%DATE% %TIME%] Configuración de red: IP=%IP%, MASK=%MASCARA%, GATEWAY=%PUERTA% >> log_admin.txt 
:: Tal información como hora y dia se imprimen en el archivo, sobre cuando fue modificada la IP, MASCARA y GATEWAY
echo [%DATE% %TIME%] Copia realizada de "%ORIGEN%" a "%DESTINO%" >> log_admin.txt 
:: Envia un mensaje para cambiar las ansias del leector para que sepa que las cosas ya estan hechas 
echo Operación completada. Revisa el archivo log_admin.txt
:: Para hacerle entender mediante el pulso de una tecla que el script ha terminado
