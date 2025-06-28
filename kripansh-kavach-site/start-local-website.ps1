$port = 8080
Write-Host "Starting local web server on port $port..."

# Start the web server
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd 'c:\Users\kripansh kavach\CascadeProjects\kripansh-kavach-site'; foreach($item in Get-ChildItem -File) { if($item.Name -eq 'index.html') { $url = 'http://localhost:$port'; Write-Host "Opening browser to $url"; Start-Process $url } }"

# Keep the script running
while($true) {
    Start-Sleep -Seconds 1
}
