@echo off 

:scene_system_askUpdateMeta
cls
echo.
echo    Other options - Check for updates - Perform an update
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Drag the updateMeta.txt file from the update data you have downloaded from the app's
echo    GitHub page to this window (or enter its path here) then press Enter to begin update.
echo.
echo    Type "-cancel" to go back.
echo.
set /p "pathUpdateMeta="
if "%pathUpdateMeta%" == "-cancel" goto endoffile
if "%pathUpdateMeta%" == "" goto scene_system_noUpdateMetaFound
if not exist %pathUpdateMeta% goto scene_system_noUpdateMetaFound
goto scene_system_checkUpdateMeta

:scene_system_noUpdateMetaFound
echo.
echo    Could not find the update meta data file.
echo.
cmdmenusel %bg_color%%hl_color% "   Try again" "   Cancel"
if %errorlevel% == 2 goto endoffile
goto scene_system_askUpdateMeta

:scene_system_checkUpdateMeta


:endoffile