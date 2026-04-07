# 🌊 Flood Prediction and Management Platform

An AI-powered real-time flood monitoring system using Machine Learning and live weather data.

## 🚀 Live Deployment

**Frontend Dashboard**: [Deploy to Vercel](https://vercel.com)  
**Backend API**: [Deploy to Railway](https://railway.app)  
**API Documentation**: `https://your-backend-url.up.railway.app/docs`

### Quick Deploy
1. Run `deploy.ps1` (PowerShell) or `deploy.bat` (Command Prompt)
2. Follow the interactive guide
3. Get your live URLs in 10 minutes!

📖 **[Complete Deployment Guide](DEPLOYMENT_GUIDE.md)**

---

## Tech Stack
| Component | Technology |
|-----------|------------|
| ML Model  | Random Forest (scikit-learn) |
| Backend   | FastAPI + SQLite |
| Frontend  | Streamlit + Plotly |
| Weather   | Open-Meteo API (free, no key needed) |
| Deployment | Railway + Vercel (Free tiers) |

---

## Quick Start

### 1. Install dependencies
```powershell
cd d:\Flood_Prediction_system
pip install -r requirements.txt
```

### 2. Train the ML model
```powershell
python train_model.py
```
This will auto-generate the dataset and save `models/flood_model.pkl`.

### 3. Start the backend (Terminal 1)
```powershell
uvicorn backend.main:app --reload --port 8000
```

### 4. Start the dashboard (Terminal 2)
```powershell
cd frontend
streamlit run app.py
```
Dashboard opens at **http://localhost:8501**  
API docs available at **http://localhost:8000/docs**

---

## API Endpoints
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | Health check |
| GET | `/predict` | Predict for Chennai (default) |
| GET | `/predict/{lat}/{lon}` | Predict for custom location |
| GET | `/history?limit=50` | Get last N predictions |
| DELETE | `/history` | Clear all history |

---

## Project Structure
```
Flood_Prediction_system/
├── data/
│   ├── generate_dataset.py    # Synthetic data generator
│   └── flood_dataset.csv      # Generated dataset (after training)
├── models/
│   ├── flood_model.pkl        # Trained model (after training)
│   └── scaler.pkl             # Feature scaler
├── backend/
│   ├── main.py                # FastAPI app
│   ├── weather.py             # Open-Meteo integration
│   └── database.py            # SQLAlchemy ORM
├── frontend/
│   └── app.py                 # Streamlit dashboard
├── train_model.py             # Model training script
├── requirements.txt
└── README.md
```
