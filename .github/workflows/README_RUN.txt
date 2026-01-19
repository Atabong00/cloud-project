IMPORTANT: HOW TO RUN THIS APPLICATION

This application uses a detailed PHP Backend. It CANNOT be run using "Live Server" or by just opening the HTML files.

You verify_grade_db must run the included server script:

1. Double-click "start_server.bat" in this folder.
2. It will detect your PHP installation (I found it at: C:\New folder\php\php.exe).
3. It will open a black window (Server) and your web browser.
4. Use the application in the NEW browser tab that opens (http://localhost:8000).

Why you saw "Server Error":
You were running the app on Port 5502 (Live Server). This extension does not speak PHP, so it sent the raw code to the browser, causing the error.
