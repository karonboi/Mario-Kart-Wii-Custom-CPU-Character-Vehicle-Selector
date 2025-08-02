@echo off
@mode con lines=23 cols=100

:scene_explain
cls
echo.
echo    What is this thing? [1/3]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    This program is created as a wizard for one of Vega's Gecko codes for Mario Kart Wii:
echo    Choose Character+Vehicle For All Opponents (more about it on mariokartwii.com)
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
cmdmenusel %bg_color%%hl_color% " -> Next page" " -- -------- ----" " <  Return"
if %errorlevel% == 1 goto scene_explain_2
if %errorlevel% == 3 goto endoffile
goto scene_explain

:scene_explain_2
cls
echo.
echo    What is this thing? [2/3]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    The reason I created this is because the cheat code is [a bit] too complex to be configured by
echo    hand. The code requires the user to subject which character and vehicle each CPU player is
echo    allowed to use. Seems simple, but: first, there are 24 characters in the Mario Kart Wii roster
echo    (not counting the Miis: 3 outfits * 3 sizes * 2 genders). Each character has a set of 12
echo    vehicles (6 karts, 6 bikes), and they must match the character's size (three types of sizes:
echo    Small, Medium, and Large). Secondly, there are 11 CPU opponents. To input the combo, you need
echo    to do it manually in a fixed order (from CPU 1 to CPU 11, but even so, the CPUs will not appear
echo    in the order you've set), and none of them are allowed to be left empty.
echo    Finally, and also the main reason why it's one of the most painful parts of a cheat code
echo    configuration: to specify character and vehicle, you have to use hexadecimal, and, the
echo    characters' and the vehicles' list is reaaaaaaally long thanks to the possible combinations
echo    mentioned earlier.
echo.
echo.
cmdmenusel %bg_color%%hl_color% " -> Next page" " <- Previous page" " <  Return"
if %errorlevel% == 1 goto scene_explain_3
if %errorlevel% == 2 goto scene_explain
if %errorlevel% == 3 endoffile
goto endoffile

:scene_explain_3
cls
echo.
echo    What is this thing? [3/3]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    And so, to simplify the process, I created this DOS application in order to turn a  headaching
echo    rubble into this user-friendly GUI-based wizard.
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
cmdmenusel %bg_color%%hl_color% " -- ---- ----" " <- Previous page" " <  Return"
if %errorlevel% == 2 goto scene_explain_2
if %errorlevel% == 3 goto endoffile
goto scene_explain_3

:endoffile