@echo off
setlocal

REM --- Configuration ---
set "repo_path=C:\Users\Gebaly\Documents\ComfyUI_windows_portable\ComfyUI\user\default\workflows"  REM Your repo path
set "remote_origin=origin"  REM Name of your remote (usually 'origin')
set "remote_branch=master" REM Branch to compare against


echo Checking local and remote repository versions...

REM Get local version
for /f "tokens=*" %%a in ('git rev-parse HEAD') do set "local_version=%%a"

REM Get remote version
for /f "tokens=*" %%a in ('git rev-parse !--ref %remote_branch%') do set "remote_version=%%a"


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
