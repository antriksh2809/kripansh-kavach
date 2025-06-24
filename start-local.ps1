$site = Get-Content .\final-website.html
Start-Process "about:blank"
$ie = Get-Process | Where-Object { $_.MainWindowTitle -eq "" }
$ie[0].MainWindowHandle
[System.Runtime.Interopservices.Marshal]::GetActiveObject("InternetExplorer.Application") | ForEach-Object { $_.Navigate2("about:blank") }
[System.Runtime.Interopservices.Marshal]::GetActiveObject("InternetExplorer.Application") | ForEach-Object { $_.Document.body.innerHTML = $site }
