@echo off
setlocal enabledelayedexpansion

:: Set source and destination folders
set "source_folder=D:\kripansh kavach images"
set "dest_folder=%CD%\assets\img"

:: Create destination directories if they don't exist
mkdir "%dest_folder%\products" 2>nul
mkdir "%dest_folder%\clients" 2>nul
mkdir "%dest_folder%\backgrounds" 2>nul
mkdir "%dest_folder%\logos" 2>nul

:: Copy images with proper naming
xcopy "%source_folder%\holsters*.jpg" "%dest_folder%\products\holsters.jpg" /Y
xcopy "%source_folder%\ammo-boxes*.jpg" "%dest_folder%\products\ammo-boxes.jpg" /Y
xcopy "%source_folder%\hero-background*.jpg" "%dest_folder%\backgrounds\hero-background.jpg" /Y
xcopy "%source_folder%\logo*.png" "%dest_folder%\logos\logo-small.png" /Y
xcopy "%source_folder%\logo-watermark*.png" "%dest_folder%\logos\logo-watermark.png" /Y
xcopy "%source_folder%\armed-forces*.png" "%dest_folder%\clients\armed-forces.png" /Y
xcopy "%source_folder%\paramilitary*.png" "%dest_folder%\clients\paramilitary.png" /Y
xcopy "%source_folder%\state-police*.png" "%dest_folder%\clients\state-police.png" /Y
xcopy "%source_folder%\security*.png" "%dest_folder%\clients\security.png" /Y

:: Optimize images using PowerShell
powershell -Command "^& {\$images = Get-ChildItem -Path '%dest_folder%' -Recurse -Include *.jpg,*.png; foreach (\$img in \$images) { \$img | ConvertTo-WebP -Quality 80 }}"

echo Images have been copied and optimized!
pause
