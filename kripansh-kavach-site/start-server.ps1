# Simple web server script for hosting static files
$port = 8000
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Server running at http://localhost:$port"
Write-Host "Press Ctrl+C to stop the server"

# Open default browser
Start-Process "http://localhost:$port/final-website.html"

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $request = $context.Request
    $response = $context.Response
    
    # Get requested file path
    $file = Join-Path (Get-Location) ($request.Url.LocalPath -replace "/","\\")
    
    # Default to index.html if no file specified
    if($file -eq (Get-Location)) {
        $file = Join-Path (Get-Location) "final-website.html"
    }
    
    # Set content type based on file extension
    $contentType = "text/html"
    if($file -like "*.css") {
        $contentType = "text/css"
    } elseif($file -like "*.js") {
        $contentType = "application/javascript"
    } elseif($file -like "*.png") {
        $contentType = "image/png"
    } elseif($file -like "*.jpg" -or $file -like "*.jpeg") {
        $contentType = "image/jpeg"
    }
    
    # Read and serve the file
    if (Test-Path $file) {
        $buffer = [System.IO.File]::ReadAllBytes($file)
        $response.ContentLength64 = $buffer.Length
        $response.ContentType = $contentType
        $response.OutputStream.Write($buffer, 0, $buffer.Length)
    } else {
        $response.StatusCode = 404
    }
    
    $response.Close()
}
