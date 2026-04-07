@echo off
echo ========================================
echo 🚀 FLOOD PREDICTION SYSTEM - NGROK SETUP
echo ========================================
echo.
echo This script will set up ngrok for public deployment
echo.
echo STEP 1: Get ngrok auth token
echo =============================
echo 1. Open: https://ngrok.com
echo 2. Sign up for a free account
echo 3. Go to: https://dashboard.ngrok.com/get-started/your-authtoken
echo 4. Copy your auth token
echo.
pause

echo.
echo STEP 2: Configure ngrok
echo ========================
set /p NGROK_TOKEN="Paste your ngrok auth token: "
ngrok config add-authtoken %NGROK_TOKEN%
echo.
echo ✅ ngrok configured successfully!
echo.

echo STEP 3: Deploy your application
echo ================================
echo Now run the deployment script:
echo py quick_deploy.py
echo.
echo This will:
echo - Start your local servers
echo - Create public tunnels
echo - Give you live URLs
echo.
pause