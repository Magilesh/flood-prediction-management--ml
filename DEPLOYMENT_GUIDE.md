# 🚀 Flood Prediction System - Cloud Deployment Guide

## Overview
Deploy your flood prediction system to the cloud using **Railway** (backend) and **Vercel** (frontend) - both offer generous free tiers perfect for open source projects.

## 🌐 Live Demo Links
- **Frontend Dashboard**: [Deployed on Vercel]
- **Backend API**: [Deployed on Railway]
- **API Documentation**: [Railway URL]/docs

---

## 1. Backend Deployment (Railway)

### Step 1: Create Railway Account
1. Go to https://railway.app
2. Sign up with GitHub (recommended for open source projects)
3. Connect your GitHub repository

### Step 2: Deploy Backend
1. Click **"New Project"** → **"Deploy from GitHub repo"**
2. Select your `flood-prediction-system` repository
3. Railway will auto-detect Python and use the `Dockerfile`
4. Wait for deployment (usually 2-3 minutes)

### Step 3: Configure Environment Variables
In Railway dashboard, go to your project → **Variables** and add:

```
AUTHORITY_EMAIL=your-email@domain.com,backup@domain.com
SMTP_SERVER=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-email@gmail.com
SMTP_PASSWORD=your-app-password
```

### Step 4: Get Backend URL
Railway will provide a URL like: `https://flood-prediction-backend.up.railway.app`

---

## 2. Frontend Deployment (Vercel)

### Step 1: Create Vercel Account
1. Go to https://vercel.com
2. Sign up with GitHub
3. Import your repository

### Step 2: Deploy Frontend
1. Click **"New Project"** → **"Import Git Repository"**
2. Select your repository
3. Configure build settings:
   - **Framework Preset**: Other
   - **Root Directory**: `./frontend`
   - **Build Command**: `pip install -r ../requirements.txt && echo "Dependencies installed"`
   - **Output Directory**: (leave empty)

### Step 3: Set Environment Variables
In Vercel project settings → **Environment Variables**:

```
BACKEND=https://your-railway-backend-url.up.railway.app
```

### Step 4: Deploy
1. Click **"Deploy"**
2. Wait for build completion
3. Get your frontend URL: `https://flood-prediction.vercel.app`

---

## 3. Update Frontend Configuration

### Update vercel.json
Replace `your-railway-backend-url` in `vercel.json` with your actual Railway URL:

```json
{
  "env": {
    "BACKEND": "https://your-actual-railway-url.up.railway.app"
  }
}
```

### Update Vercel Environment
In Vercel dashboard → Project Settings → Environment Variables:
- Set `BACKEND` to your Railway backend URL

---

## 4. Testing Deployment

### Test Backend API
```bash
# Health check
curl https://your-railway-url.up.railway.app/

# Get prediction
curl https://your-railway-url.up.railway.app/predict

# View API docs
open https://your-railway-url.up.railway.app/docs
```

### Test Frontend
- Open your Vercel URL
- Dashboard should load and connect to backend
- Try making predictions

---

## 5. Enable Notifications (Optional)

To enable email alerts for high-risk floods:

1. **Get Gmail App Password**:
   - Go to https://myaccount.google.com/apppasswords
   - Generate password for "Flood Prediction System"

2. **Update Railway Environment Variables**:
   ```
   AUTHORITY_EMAIL=authority1@gov.com,authority2@gov.com
   SMTP_USERNAME=your-email@gmail.com
   SMTP_PASSWORD=your-16-char-app-password
   ```

3. **Test Notifications**:
   - Make a prediction that triggers HIGH risk
   - Check authority emails for alerts

---

## 6. Troubleshooting

### Backend Issues
- **Build fails**: Check Railway logs for Python dependency errors
- **Port issues**: Railway auto-assigns ports, code handles this
- **Database**: SQLite works fine on Railway free tier

### Frontend Issues
- **Connection fails**: Verify BACKEND environment variable is set correctly
- **Build fails**: Ensure requirements.txt is in root directory
- **Streamlit issues**: Vercel supports Streamlit, but monitor build logs

### Common Fixes
```bash
# Test local backend before deploying
uvicorn backend.main:app --reload --port 8000

# Test local frontend
cd frontend && streamlit run app.py
```

---

## 7. Cost & Limits

### Railway (Backend)
- **Free Tier**: 512MB RAM, 1GB storage, 100 hours/month
- **Perfect for**: API with light database usage

### Vercel (Frontend)
- **Free Tier**: 100GB bandwidth, unlimited static sites
- **Perfect for**: Streamlit dashboards

### Total Cost: $0/month for basic usage

---

## 8. Production Optimizations

### Database Migration (Optional)
For production, consider PostgreSQL:
1. Add PostgreSQL plugin in Railway
2. Update `database.py` to use PostgreSQL URL
3. Railway provides `DATABASE_URL` environment variable

### Monitoring
- Railway provides basic logs and metrics
- Add health checks and error monitoring
- Set up uptime monitoring (e.g., UptimeRobot free tier)

### Security
- Keep credentials in environment variables only
- Use Railway's private networking for database
- Enable HTTPS (automatic on both platforms)

---

## 9. Update Process

When you push code changes to GitHub:
1. **Railway**: Auto-deploys backend
2. **Vercel**: Auto-deploys frontend
3. **Test**: Verify both services work together

---

## 10. Support & Resources

- **Railway Docs**: https://docs.railway.app/
- **Vercel Docs**: https://vercel.com/docs
- **Streamlit on Vercel**: Search for community guides
- **FastAPI on Railway**: Railway has great Python support

---

## 🎯 Quick Deploy Checklist

- [ ] Push code to GitHub
- [ ] Deploy backend to Railway
- [ ] Deploy frontend to Vercel
- [ ] Set BACKEND environment variable in Vercel
- [ ] Configure notification emails (optional)
- [ ] Test both services
- [ ] Share your live URLs!

---

*This deployment setup is perfect for open source projects and provides a professional, scalable solution for your flood prediction system.*