#!/usr/bin/env python3
"""
Quick Deploy Script - Expose local servers via ngrok
Run this to get temporary public URLs for your flood prediction system
"""

import os
import sys
import time
import subprocess
import signal
from pyngrok import ngrok
import requests

def check_servers():
    """Check if local servers are running"""
    try:
        # Check backend
        response = requests.get("http://localhost:8000/", timeout=5)
        backend_ok = response.status_code == 200
    except:
        backend_ok = False

    try:
        # Check frontend (this might not work as Streamlit has different endpoints)
        response = requests.get("http://localhost:8502/", timeout=5)
        frontend_ok = response.status_code == 200
    except:
        frontend_ok = False

    return backend_ok, frontend_ok

def start_servers():
    """Start the backend and frontend servers"""
    print("🚀 Starting Flood Prediction System...")

    # Start backend
    print("📡 Starting backend server...")
    backend_process = subprocess.Popen([
        sys.executable, "-m", "uvicorn",
        "backend.main:app",
        "--reload",
        "--host", "0.0.0.0",
        "--port", "8000"
    ], cwd=os.path.dirname(__file__))

    time.sleep(3)  # Wait for backend to start

    # Start frontend
    print("🌐 Starting frontend dashboard...")
    frontend_process = subprocess.Popen([
        sys.executable, "-m", "streamlit", "run", "frontend/app.py",
        "--server.port", "8502",
        "--server.address", "0.0.0.0"
    ], cwd=os.path.dirname(__file__))

    time.sleep(5)  # Wait for frontend to start

    return backend_process, frontend_process

def create_tunnels():
    """Create ngrok tunnels for both servers"""
    print("🌍 Creating public tunnels...")

    # Create tunnels
    backend_tunnel = ngrok.connect(8000, "http")
    frontend_tunnel = ngrok.connect(8502, "http")

    backend_url = backend_tunnel.public_url
    frontend_url = frontend_tunnel.public_url

    return backend_tunnel, frontend_tunnel, backend_url, frontend_url

def main():
    print("=" * 60)
    print("🚀 FLOOD PREDICTION SYSTEM - QUICK DEPLOY")
    print("=" * 60)
    print("This will expose your local servers via ngrok")
    print("You'll get temporary public URLs (valid for 8 hours)")
    print()

    # Check if servers are already running
    backend_ok, frontend_ok = check_servers()

    processes = []
    if not backend_ok or not frontend_ok:
        print("📡 Starting local servers...")
        backend_proc, frontend_proc = start_servers()
        processes = [backend_proc, frontend_proc]

        # Wait a bit more
        time.sleep(3)

        # Check again
        backend_ok, frontend_ok = check_servers()
        if not backend_ok:
            print("❌ Backend failed to start. Please run manually:")
            print("py -m uvicorn backend.main:app --reload --port 8000")
            return
        if not frontend_ok:
            print("❌ Frontend failed to start. Please run manually:")
            print("cd frontend && py -m streamlit run app.py")
            return

    print("✅ Local servers are running!")

    try:
        # Create ngrok tunnels
        backend_tunnel, frontend_tunnel, backend_url, frontend_url = create_tunnels()

        print("\n" + "=" * 60)
        print("🎉 DEPLOYMENT SUCCESSFUL!")
        print("=" * 60)
        print("🌐 Frontend Dashboard:", frontend_url)
        print("🔧 Backend API:", backend_url)
        print("📚 API Documentation:", backend_url + "/docs")
        print("=" * 60)
        print("📋 URLs are valid for 8 hours (free ngrok limit)")
        print("🔄 Keep this terminal open to maintain tunnels")
        print("❌ Press Ctrl+C to stop")
        print("=" * 60)

        # Keep running
        while True:
            time.sleep(1)

    except KeyboardInterrupt:
        print("\n🛑 Shutting down...")
    except Exception as e:
        print(f"\n❌ Error: {e}")
        print("💡 Make sure ngrok is properly configured")
    finally:
        # Cleanup
        ngrok.kill()
        for proc in processes:
            try:
                proc.terminate()
            except:
                pass

if __name__ == "__main__":
    main()