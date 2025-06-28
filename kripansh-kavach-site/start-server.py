import http.server
import socketserver
import webbrowser
import os

PORT = 8000

Handler = http.server.SimpleHTTPRequestHandler
Handler.extensions_map.update({
    '.js': 'application/javascript',
})

print(f"Starting server on port {PORT}")
print(f"Open your browser and go to http://localhost:{PORT}/final-website.html")

# Change directory to the script's location
os.chdir(os.path.dirname(os.path.abspath(__file__)))

# Start the server
with socketserver.TCPServer(("", PORT), Handler) as httpd:
    # Open browser
    webbrowser.open(f'http://localhost:{PORT}/final-website.html')
    print("Server started. Press Ctrl+C to stop.")
    httpd.serve_forever()
