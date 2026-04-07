Write-Host "========================================" -ForegroundColor Cyan
Write-Host "🚀 FLOOD PREDICTION SYSTEM DEPLOYMENT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This script will guide you through deployment" -ForegroundColor Yellow
Write-Host ""

# Step 1: Railway Backend
Write-Host "STEP 1: Deploy Backend to Railway" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Green
Write-Host "1. Open: https://railway.app" -ForegroundColor White
Write-Host "2. Sign up/Login with GitHub" -ForegroundColor White
Write-Host "3. Click 'New Project' → 'Deploy from GitHub repo'" -ForegroundColor White
Write-Host "4. Select: Magilesh/flood-prediction-management--ml" -ForegroundColor White
Write-Host "5. Wait for deployment (2-3 minutes)" -ForegroundColor White
Write-Host ""
Write-Host "Your backend URL will be: https://[project-name].up.railway.app" -ForegroundColor Magenta
Write-Host ""
Read-Host "Press Enter when you've completed Railway deployment"

# Step 2: Railway Environment Variables
Write-Host ""
Write-Host "STEP 2: Configure Railway Environment Variables" -ForegroundColor Green
Write-Host "===============================================" -ForegroundColor Green
Write-Host "In Railway dashboard:" -ForegroundColor White
Write-Host "1. Go to your project → Variables" -ForegroundColor White
Write-Host "2. Add these variables:" -ForegroundColor White
Write-Host ""
Write-Host "AUTHORITY_EMAIL=your-email@domain.com" -ForegroundColor Yellow
Write-Host "SMTP_SERVER=smtp.gmail.com" -ForegroundColor Yellow
Write-Host "SMTP_PORT=587" -ForegroundColor Yellow
Write-Host "SMTP_USERNAME=your-email@gmail.com" -ForegroundColor Yellow
Write-Host "SMTP_PASSWORD=your-app-password" -ForegroundColor Yellow
Write-Host ""
Write-Host "3. Redeploy (click Deploy button)" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter when environment variables are set"

# Step 3: Vercel Frontend
Write-Host ""
Write-Host "STEP 3: Deploy Frontend to Vercel" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host "1. Open: https://vercel.com" -ForegroundColor White
Write-Host "2. Sign up/Login with GitHub" -ForegroundColor White
Write-Host "3. Click 'New Project' → 'Import Git Repository'" -ForegroundColor White
Write-Host "4. Select: Magilesh/flood-prediction-management--ml" -ForegroundColor White
Write-Host "5. Configure build settings:" -ForegroundColor White
Write-Host "   - Framework Preset: Other" -ForegroundColor White
Write-Host "   - Root Directory: ./frontend" -ForegroundColor White
Write-Host "   - Build Command: pip install -r ../requirements.txt && echo 'Ready'" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter when Vercel project is created"

# Step 4: Vercel Environment
Write-Host ""
Write-Host "STEP 4: Set Vercel Environment Variable" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green
Write-Host "In Vercel project settings:" -ForegroundColor White
Write-Host "1. Go to Environment Variables" -ForegroundColor White
Write-Host "2. Add: BACKEND = [your-railway-backend-url]" -ForegroundColor Yellow
Write-Host "3. Click 'Deploy'" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter when Vercel deployment is complete"

# Success
Write-Host ""
Write-Host "🎉 DEPLOYMENT COMPLETE!" -ForegroundColor Green
Write-Host "=====================" -ForegroundColor Green
Write-Host "Your live application will be available at:" -ForegroundColor White
Write-Host "Frontend: https://flood-prediction.vercel.app" -ForegroundColor Cyan
Write-Host "Backend:  https://[your-railway-url].up.railway.app" -ForegroundColor Cyan
Write-Host "API Docs: https://[your-railway-url].up.railway.app/docs" -ForegroundColor Cyan
Write-Host ""
Write-Host "Test your deployment by visiting the frontend URL!" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to exit"