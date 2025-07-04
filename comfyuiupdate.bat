@echo off
cd "C:\Users\Gebaly\Documents\ComfyUI_windows_portable\ComfyUI\user\default\workflows"
echo Pulling changes from GitHub...
git pull --allow-unrelated-histories origin master
if errorlevel 1 (
    echo Pull failed. Check for conflicts.
) else (
    echo Pull successful!
)
pause  REM Optional: Pause the script so you can see the output in the console
