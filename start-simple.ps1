$port = 8080
Write-Host "Starting server on port $port..."
Write-Host "Opening browser..."

# Open browser
Start-Process "http://localhost:$port/final-website.html"

# Start simple web server
Start-Process powershell -ArgumentList "-NoExit -Command `"python -m http.server $port`" -WorkingDirectory 'c:\Users\kripansh kavach\CascadeProjects\kripansh-kavach-site' -Verb RunAs
