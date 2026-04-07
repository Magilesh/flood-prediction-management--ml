Write-Host "========================================" -ForegroundColor Cyan
Write-Host "🚀 FLOOD PREDICTION SYSTEM - NGROK SETUP" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This script will set up ngrok for public deployment" -ForegroundColor Yellow
Write-Host ""

# Step 1: Instructions
Write-Host "STEP 1: Get ngrok auth token" -ForegroundColor Green
Write-Host "============================" -ForegroundColor Green
Write-Host "1. Open: https://ngrok.com" -ForegroundColor White
Write-Host "2. Sign up for a free account" -ForegroundColor White
Write-Host "3. Go to: https://dashboard.ngrok.com/get-started/your-authtoken" -ForegroundColor White
Write-Host "4. Copy your auth token" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter when you have your auth token"

# Step 2: Configure ngrok
Write-Host ""
Write-Host "STEP 2: Configure ngrok" -ForegroundColor Green
Write-Host "========================" -ForegroundColor Green
$NGROK_TOKEN = Read-Host "Paste your ngrok auth token"
ngrok config add-authtoken $NGROK_TOKEN
Write-Host ""
Write-Host "✅ ngrok configured successfully!" -ForegroundColor Green
Write-Host ""

# Step 3: Deploy
Write-Host "STEP 3: Deploy your application" -ForegroundColor Green
Write-Host "===============================" -ForegroundColor Green
Write-Host "Now run the deployment script:" -ForegroundColor White
Write-Host "py quick_deploy.py" -ForegroundColor Yellow
Write-Host ""
Write-Host "This will:" -ForegroundColor White
Write-Host "- Start your local servers" -ForegroundColor White
Write-Host "- Create public tunnels" -ForegroundColor White
Write-Host "- Give you live URLs" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to exit"