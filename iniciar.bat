@echo off
REM ============================================
REM  Iniciar n8n + ngrok desde Docker Compose
REM ============================================
echo [1/3] Verificando Docker...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Docker no esta instalado o no esta en el PATH.
    pause
    exit /b
)

echo [2/3] Iniciando ngrok...
REM NOTA: Si usas ngrok gratuito y la URL cambia, quita la parte de "--url=..." 
REM y actualiza el archivo .env con la nueva URL que te dé ngrok.
start "ngrok - n8n tunnel" cmd /k "ngrok http 5678 --url=https://encourage-august-reach.ngrok-free.dev"

echo Esperando 3 segundos a que ngrok se estabilice...
timeout /t 3 /nobreak >nul

echo [3/3] Iniciando n8n con Docker Compose...
docker-compose up -d

echo.
echo ==========================================
echo  ¡Listo! n8n esta corriendo en segundo plano.
echo  Editor: https://encourage-august-reach.ngrok-free.dev
echo.
echo  Para detenerlo, ejecuta: docker-compose down
echo ==========================================
echo.
pause