@echo off

echo       O RETORNO DO PRIMO
echo ------------------------
echo  	2020
echo ------------------------

pause
start ..\build\FXServer.exe +exec config.cfg +set onesync_enableInfinity 1 
exit