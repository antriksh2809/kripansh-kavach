@echo off
echo Starting local web server...
python -m http.server 8080
echo Server is running at http://localhost:8080
echo Press Ctrl+C to stop the server
pause
