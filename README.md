# 🌊 Flood Prediction and Management Platform

An AI-powered real-time flood monitoring system using Machine Learning and live weather data.

## 🚀 Live Deployment

**Quick Deploy (5 minutes)**: Run `py quick_deploy.py` for instant public URLs!

**Full Cloud Deploy**: Railway + Vercel (permanent hosting)

### Quick Deploy with ngrok
1. Run `setup_ngrok.ps1` (PowerShell) or `setup_ngrok.bat` (Command Prompt)
2. Get your ngrok auth token from https://ngrok.com
3. Run `py quick_deploy.py`
4. Get instant public URLs!

### Full Cloud Deployment
1. Run `deploy.ps1` or `deploy.bat` for step-by-step cloud deployment
2. Or follow the visual guide: `deploy.html`

📖 **[Complete Deployment Guide](DEPLOYMENT_GUIDE.md)** | **[Quick Deploy Guide](QUICK_DEPLOY.md)**

---

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
