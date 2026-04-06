"""
backend/notifications.py — Send alerts to authorities when flood risk is HIGH.

Supports email notifications via SMTP.
Configuration via environment variables:
  - AUTHORITY_EMAIL: Comma-separated list of recipient emails (e.g., "auth1@gov.com,auth2@gov.com")
  - SMTP_SERVER: SMTP server (default: "smtp.gmail.com")
  - SMTP_PORT: SMTP port (default: 587)
  - SMTP_USERNAME: Sender email address
  - SMTP_PASSWORD: Sender password or app-specific token
"""

import os
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from datetime import datetime
from typing import List, Optional

# ── Configuration ─────────────────────────────────────────────────────────────
AUTHORITY_EMAILS = os.getenv("AUTHORITY_EMAIL", "").split(",")
AUTHORITY_EMAILS = [email.strip() for email in AUTHORITY_EMAILS if email.strip()]

SMTP_SERVER = os.getenv("SMTP_SERVER", "smtp.gmail.com")
SMTP_PORT = int(os.getenv("SMTP_PORT", 587))
SMTP_USERNAME = os.getenv("SMTP_USERNAME", "")
SMTP_PASSWORD = os.getenv("SMTP_PASSWORD", "")


def send_high_risk_alert(location: str, latitude: float, longitude: float,
                         rainfall_mm: float, river_level_m: float,
                         humidity_pct: float, temperature_c: float,
                         wind_speed_kmh: float, risk_probability: float) -> bool:
    """
    Send flood risk alert email to all configured authorities.
    
    Returns:
        bool: True if email(s) sent successfully, False otherwise.
    """
    if not AUTHORITY_EMAILS or not all(AUTHORITY_EMAILS):
        print("[!] No authority emails configured. Skipping notification.")
        return False
    
    if not SMTP_USERNAME or not SMTP_PASSWORD:
        print("[!] SMTP credentials not configured. Skipping notification.")
        return False
    
    try:
        # Compose email
        subject = f"🚨 HIGH FLOOD RISK ALERT - {location}"
        
        body = f"""
FLOOD RISK ALERT NOTIFICATION

Location: {location}
Coordinates: ({latitude}, {longitude})
Timestamp: {datetime.now().strftime('%Y-%m-%d %H:%M:%S UTC')}
Risk Probability: {risk_probability * 100:.1f}%

WEATHER CONDITIONS:
  • Rainfall: {rainfall_mm} mm
  • River Level: {river_level_m} m
  • Humidity: {humidity_pct}%
  • Temperature: {temperature_c}°C
  • Wind Speed: {wind_speed_kmh} km/h

ACTION REQUIRED:
  ✓ Activate emergency response protocols
  ✓ Monitor water levels continuously
  ✓ Prepare evacuation routes
  ✓ Issue public warnings

This is an automated alert from the Flood Prediction System.
For more details, check the dashboard at http://localhost:8501
"""
        
        # Send email
        msg = MIMEMultipart()
        msg["From"] = SMTP_USERNAME
        msg["To"] = ", ".join(AUTHORITY_EMAILS)
        msg["Subject"] = subject
        msg.attach(MIMEText(body, "plain"))
        
        with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
            server.starttls()
            server.login(SMTP_USERNAME, SMTP_PASSWORD)
            server.send_message(msg)
        
        print(f"[✓] HIGH RISK alert sent to {len(AUTHORITY_EMAILS)} authority contact(s).")
        return True
    
    except Exception as e:
        print(f"[✗] Failed to send alert: {str(e)}")
        return False
