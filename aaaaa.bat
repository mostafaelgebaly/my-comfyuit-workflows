@echo off
setlocal

:: --- Configuration ---
set "repo_path=C:\Users\Gebaly\Documents\ComfyUI_windows_portable\ComfyUI\user\default\workflows"
set "remote_origin=origin"
set "remote_branch=master"  :: Or your desired branch (e.g., main)

:: --- Get Local and Remote Versions ---
for /f "tokens=*" %%a in ('git rev-parse HEAD') do set "local_version=%%a"
for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref HEAD') do set "local_branch=%%a"

for /f "tokens=*" %%a in ('git rev-parse --abbrev-ref %remote_branch%') do set "remote_version=%%a"

:: --- Compare Versions ---
echo Local version: %local_version%
echo Remote version: %remote_version%

if "%local_version%" GTR "%remote_version%" (
  echo Local repository is more updated. Pushing changes...
  cd "%repo_path%"
  git add .
  git commit -m "Automatic push"
  git push %remote_origin% %remote_branch%
) else if "%remote_version%" GTR "%local_version%" (
  echo Remote repository is more updated. Pulling changes...
  cd "%repo_path%"
  git pull --allow-unrelated-histories %remote_origin% %remote_branch%
) else (
   echo Local and remote repositories are synchronized. No action needed.
)

endlocal
pause
