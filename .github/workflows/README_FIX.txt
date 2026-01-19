IMPORTANT: HOW TO RUN THIS PROJECT
================================

You currently have a "Connection Error" because you are opening the files directly or using "Live Server" (Port 5502).
This project uses PHP, which requires a PHP Server to run.

HOW TO FIX:
1. Make sure XAMPP is installed.
2. Open XAMPP Control Panel and click "Start" next to "MySQL". (You don't need Apache if you use my script).
3. INITIALIZE DATABASE:
   - In the root folder, double-click "start_server.bat".
   - A browser window should open (http://localhost:8000).
   - Go to: http://localhost:8000/api/setup_db.php
   - You should see "Database setup completed successfully".

4. OPEN THE APP:
   - Go to: http://localhost:8000/
   - Login with: admin@test.com / 123

DO NOT USE "Right Click -> Open with Live Server". Use "start_server.bat".
