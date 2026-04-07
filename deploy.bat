@echo off
echo ========================================
echo 🚀 FLOOD PREDICTION SYSTEM DEPLOYMENT
echo ========================================
echo.
echo This script will guide you through deployment
echo.
echo STEP 1: Deploy Backend to Railway
echo ==================================
echo 1. Open: https://railway.app
echo 2. Sign up/Login with GitHub
echo 3. Click "New Project" → "Deploy from GitHub repo"
echo 4. Select: Magilesh/flood-prediction-management--ml
echo 5. Wait for deployment (2-3 minutes)
echo.
echo Your backend URL will be: https://[project-name].up.railway.app
echo.
pause

echo.
echo STEP 2: Configure Railway Environment Variables
echo ===============================================
echo In Railway dashboard:
echo 1. Go to your project → Variables
echo 2. Add these variables:
echo.
echo AUTHORITY_EMAIL=your-email@domain.com
echo SMTP_SERVER=smtp.gmail.com
echo SMTP_PORT=587
echo SMTP_USERNAME=your-email@gmail.com
echo SMTP_PASSWORD=your-app-password
echo.
echo 3. Redeploy (click Deploy button)
echo.
pause

echo.
echo STEP 3: Deploy Frontend to Vercel
echo ================================
echo 1. Open: https://vercel.com
echo 2. Sign up/Login with GitHub
echo 3. Click "New Project" → "Import Git Repository"
echo 4. Select: Magilesh/flood-prediction-management--ml
echo 5. Configure build settings:
echo    - Framework Preset: Other
echo    - Root Directory: ./frontend
echo    - Build Command: pip install -r ../requirements.txt && echo "Ready"
echo.
pause

echo.
echo STEP 4: Set Vercel Environment Variable
echo ======================================
echo In Vercel project settings:
echo 1. Go to Environment Variables
echo 2. Add: BACKEND = [your-railway-backend-url]
echo 3. Click "Deploy"
echo.
pause

echo.
echo 🎉 DEPLOYMENT COMPLETE!
echo =====================
echo Your live application will be available at:
echo Frontend: https://flood-prediction.vercel.app
echo Backend:  https://[your-railway-url].up.railway.app
echo API Docs: https://[your-railway-url].up.railway.app/docs
echo.
echo Test your deployment by visiting the frontend URL!
echo.
pause