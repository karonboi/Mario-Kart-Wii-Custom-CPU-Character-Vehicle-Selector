@echo off
@mode con lines=23 cols=100

:scene_instruct
cls
echo.
echo    How do I use it? [1/5]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Simply specify which character and vehicle you want for a CPU opponent. If you want to set one
echo    config for all CPU opponents, go to 'Other options - Set all CPUs selection'.
echo    Once done, you can click the 'Generate Gecko code' button to create the cheat code with the
echo    configs done before. Then just copy the code and you're ready to go^^!
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
cmdmenusel %bg_color%%hl_color% " -> Next page" " -- -------- ----" " <  Return"
if %errorlevel% == 1 goto scene_instruct_2
if %errorlevel% == 3 goto endoffile
goto scene_instruct

:scene_instruct_2
cls
echo.
echo    Does this Gecko code have any known issues? [2/5]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Once the code is applied, all the characters - including the one that the players have 
echo    selected - will be locked. Unless the game is closed or force reset, they cannot be changed
echo    whatsoever. It can get a little bit annoying, but if you can put up with it, then that's good.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
cmdmenusel %bg_color%%hl_color% " -> Next page" " <- Previous page" " <  Return"
if %errorlevel% == 1 goto scene_instruct_3
if %errorlevel% == 2 goto scene_instruct
if %errorlevel% == 3 goto endoffile
goto endoffile

:scene_instruct_3
cls
echo.
echo    Does this code compatible with other regions? [3/5]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    The cheat code supports other regional copies of the game, so make sure you have the right
echo    settings. To switch the region of the code, go to 'Other options - Code region'.
echo    The default option is NTSC-U.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
cmdmenusel %bg_color%%hl_color% " -> Next page" " <- Previous page" " <  Return"
if %errorlevel% == 1 goto scene_instruct_4
if %errorlevel% == 2 goto scene_instruct_2
if %errorlevel% == 3 goto endoffile
goto endoffile

:scene_instruct_4
cls
echo.
echo    Does this code work with hidden characters? [4/5]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Yes. Even if the unlockable characters aren't showing up in the selection screen, you still
echo    can let the CPUs use them with this code.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
cmdmenusel %bg_color%%hl_color% " -> Next page" " <- Previous page" " <  Return"
if %errorlevel% == 1 goto scene_instruct_5
if %errorlevel% == 2 goto scene_instruct_3
if %errorlevel% == 3 goto endoffile
goto endoffile

:scene_instruct_5
cls
echo.
echo    Can Mii racers be added in this tool? [5/5]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    You can also configure the CPUs to play as the Mii in your game's profile^^! But before 
echo    doing so, you must take a careful look at your Mii's size and gender so that they can be
echo    paired correctly with corresponding vehicles.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
cmdmenusel %bg_color%%hl_color% " -- ---- ----" " <- Previous page" " <  Return"
if %errorlevel% == 2 goto scene_instruct_4
if %errorlevel% == 3 goto endoffile
goto scene_instruct_5

:endoffile