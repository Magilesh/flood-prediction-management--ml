# 🚨 Flood Prediction System - Authority Notifications Setup

## Overview
The flood prediction system now includes an automatic notification feature that sends alerts to authorized personnel when HIGH flood risk is detected.

## How It Works

When the system detects **HIGH flood risk** (probability ≥ 50%):
1. ✅ Prediction is logged to the database
2. 📧 Email notification is sent to configured authorities
3. 📝 Notification record is stored for audit trails

## Setting Up Authority Email Notifications

### Step 1: Configure Environment Variables

Set the following environment variables before starting the backend:

#### For Gmail:
```bash
# PowerShell example:
$env:AUTHORITY_EMAIL = "authority1@gov.com,authority2@gov.com"
$env:SMTP_SERVER = "smtp.gmail.com"
$env:SMTP_PORT = "587"
$env:SMTP_USERNAME = "your_email@gmail.com"
$env:SMTP_PASSWORD = "your_app_specific_password"

# Then start the backend:
py -m uvicorn backend.main:app --reload --port 8000
```

#### For Other Email Providers:

**Microsoft Outlook/Office365:**
```bash
$env:SMTP_SERVER = "smtp-mail.outlook.com"
$env:SMTP_PORT = "587"
```

**Yahoo Mail:**
```bash
$env:SMTP_SERVER = "smtp.mail.yahoo.com"
$env:SMTP_PORT = "587"
```

**Custom SMTP Server:**
```bash
$env:SMTP_SERVER = "your-server.com"
$env:SMTP_PORT = "587"  # or 465 for SSL
```

### Step 2: Get Gmail App Password (Recommended for Gmail)

1. Go to https://myaccount.google.com/security
2. Enable "2-Step Verification" (if not already enabled)
3. Go to **App passwords**
4. Select "Mail" and "Windows Computer"
5. Google will generate a 16-character password
6. Use this password as `SMTP_PASSWORD`

### Step 3: Start the Backend Server

```bash
cd 'c:\Users\Magil\Downloads\Flood_Prediction_system-main\Flood_Prediction_system-main'

# Set environment variables (PowerShell):
$env:AUTHORITY_EMAIL = "authority1@gov.com,authority2@gov.com"
$env:SMTP_USERNAME = "your_email@gmail.com"
$env:SMTP_PASSWORD = "your_app_password"

# Start backend:
py -m uvicorn backend.main:app --reload --port 8000
```

You should see:
```
[✓] Notification system active — 2 authority contact(s) configured.
```

### Step 4: Test Notifications

#### Trigger a High-Risk Prediction:
```bash
# Via API:
curl "http://localhost:8000/predict"

# Or manually set high rainfall:
# The system will send alerts based on real weather data
```

#### Check Sent Notifications:
```bash
# View all notifications via API (if implemented):
GET http://localhost:8000/history
```

## Email Template

When HIGH risk is detected, authorities receive an email like:

```
Subject: 🚨 HIGH FLOOD RISK ALERT - Chennai, India

FLOOD RISK ALERT NOTIFICATION

Location: Chennai, India
Coordinates: (13.0827, 80.2707)
Timestamp: 2026-04-06 14:23:45 UTC
Risk Probability: 89.5%

WEATHER CONDITIONS:
  • Rainfall: 125.3 mm
  • River Level: 9.2 m
  • Humidity: 92%
  • Temperature: 28.4°C
  • Wind Speed: 45.2 km/h

ACTION REQUIRED:
  ✓ Activate emergency response protocols
  ✓ Monitor water levels continuously
  ✓ Prepare evacuation routes
  ✓ Issue public warnings
```

## Database Tracking

All notifications are logged in the `notifications` table with:
- **Timestamp** — When the alert was sent
- **Location** — Affected area
- **Risk Probability** — Flood risk percentage
- **Recipients** — Email addresses notified
- **Status** — "SENT" or "FAILED"

## API Endpoint to View Notifications

You can query sent notifications:
```bash
GET http://localhost:8000/notifications
```

## Troubleshooting

### "No authority emails configured" Warning
- **Solution**: Set `AUTHORITY_EMAIL` environment variable with comma-separated emails

### "SMTP credentials not configured"
- **Solution**: Set `SMTP_USERNAME` and `SMTP_PASSWORD` environment variables

### "Failed to send alert: Connection refused"
- **Solution**: Check SMTP_SERVER and SMTP_PORT are correct
- **For Gmail**: Verify you're using an app-specific password, not your regular Gmail password

### "Authentication failed"
- **Solution**: Verify SMTP username and password are correct
- **For Gmail**: Use the 16-character app password generated from Account Settings

### Email not received
- **Solution**: 
  - Check spam/junk folder
  - Verify recipient email addresses are correct
  - Check server logs for detailed error messages

## Security Best Practices

⚠️ **Never hardcode credentials in code!**

Instead:
1. Use environment variables (shown above)
2. Create a `.env` file (add to .gitignore):
   ```
   AUTHORITY_EMAIL=authority1@gov.com,authority2@gov.com
   SMTP_USERNAME=your_email@gmail.com
   SMTP_PASSWORD=your_app_password
   ```

3. Load it in your startup:
   ```python
   from dotenv import load_dotenv
   load_dotenv()
   ```

## Feature Enhancements

Future improvements can include:
- 📱 SMS notifications (Twilio integration)
- 🔔 Push notifications (Firebase)
- 📞 Phone calls (VoIP integration)
- 🌐 Webhook notifications to emergency systems
- ⏰ Rate limiting to prevent alert fatigue
- 🔗 Integration with government alert systems

## Support

For issues or feature requests, refer to the main README.md
