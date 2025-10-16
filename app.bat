@echo off
title Mario Kart Wii: Custom CPU Character/Vehicle Selector
echo.
echo    Starting up...
echo.
setlocal EnableDelayedExpansion > nul
chcp 65001 > nul

:: Every part of this source code is written manually, plus they are connected by kindergarten paper glue and who-knows-how-long-it-has-existed duct tape, so don't expect it to run properly
:: I will still fix up any bugs that (may frequently) appear
:: It is also relying on life supports- uh, I mean the external packages to reach this level of "advancement" for a DOS program, to the point of making it fit for r/programminghorror
:: Some anti-virus software will definitely pick this as a threat, and there's nothing I can do to stop such false alarms. You and I are gonna deal with this for the rest of our lives

:: A little (and unrelated) trivia about this program: to this revision, three different laptops had carried its source code, with the first being Dell Latitude 3340, sencond is Lenovo ThinkPad T420i, third is HP EliteBook 8560w, and now Dell Precision 7720. The two early ones are still alive and in my room, with the Latutide having Linux installed
:: I started developing this app since late March 2023 after I've done fantasizing a Mario Kart race full of Dry Bones, and it had remained close-source for the past two years, until the August of 2025 when I finally decided to publish this horror to GitHub
:: Now I'm a university's freshman with a lot of other stuffs to do, but I will occasinally return here to continue the app's development

:: Preparing common variables and create directories
:system_preparingParameters
:: fileVer, relsVer and updateLink were intended for use with an auto-update feature using winget, but was later scrapped because... nah
set "fileVer=4.0.3.2"
set "relsVer=1.0.1.2"
set "updateLink=https://github.com/karonboi/Mario-Kart-Wii-Custom-CPU-Character-Vehicle-Selector/releases"
set i=0
set slot_num=0
set opponent=0
set code_wasWaitingforInput=0
set isDataRead=0
set subfunction=0
set adva_datManCache_intervent=0
set "win11_note="
set "darkmode="
set "remem_selectData="
set "slot_lock="
set "lockToggle="
set "askLockonSave="
set "adva_endoffileExit="
set "adva_datManCache="
set "adva_datManCachePersist="
if not exist C:\karonboi\KaronWizard\tmp mkdir C:\karonboi\KaronWizard\tmp > nul
if not exist "C:\karonboi\KaronWizard\exported_selections" mkdir "C:\karonboi\KaronWizard\exported_selections" > nul 
if not exist "C:\karonboi\KaronWizard\saved_selections" mkdir "C:\karonboi\KaronWizard\saved_selections" > nul
if not exist "C:\karonboi\KaronWizard\options.bat" call :system_createOptionsData > nul
call C:\karonboi\KaronWizard\options.bat
if "%win11_note%" == "" set win11_note=1 && call :system_saveOptionsData
if "%darkmode%" == "" set darkmode=1 && call :system_saveOptionsData
if "%adva_endoffileExit%" == "" set adva_endoffileExit=0 && call :system_saveOptionsData
if "%adva_datManCache%" == "" set adva_datManCache=0 && call :system_saveOptionsData
if "%adva_datManCachePersist%" == "" set adva_datManCachePersist=0 && call :system_saveOptionsData
if "%remem_selectData%" == "" set remem_selectData=1 && call :system_saveOptionsData
if "%slot_lock%" == "" set slot_lock=0 && call :system_saveOptionsData
if "%lockToggle%" == "" set lockToggle=0 && call :system_saveOptionsData
if "%askLockonSave%" == "" set askLockonSave=0 && call :system_saveOptionsData
if %darkmode% == 1 set "bg_color=07" && set "hl_color=70"
if %darkmode% == 0 set "bg_color=70" && set "hl_color=07"
for /l %%a in (1, 1, 100) do set "data_%%a=░"
if %adva_datManCache% == 1 (
	if %adva_datManCachePersist% == 1 (
		if not exist C:\karonboi\KaronWizard\cache.bat (
			call :system_readFiles
			call createPersistentCache.bat
			set "cache_lastUpdated=%date% %time%"
			set isDataRead=1
		)
	) else if %adva_datManCachePersist% == 0 (
		if exist C:\karonboi\KaronWizard\cache.bat del C:\karonboi\KaronWizard\cache.bat
	)
) else if %adva_datManCache% == 0 (
	if exist C:\karonboi\KaronWizard\cache.bat del C:\karonboi\KaronWizard\cache.bat
)
color %bg_color%
call :system_createSlots

:: Create characters and vehicle's name placeholders. It also acts as a reset function, which I forgot to add in for 3 revisions of this source code
:system_createCharPlaceholders
for /l %%x in (1, 1, 11) do (
    set char%%x=0
    set "char%%x_name=(none)"
	set veh%%x=0
    set "veh%%x_name=(none)"
)
if %win11_note% == 1 goto scene_system_win11Note
if %win11_note% == 0 goto scene_select_opponent
goto scene_select_opponent

:: Erases all slots files
:: No other code blocks use this, as the reset function is only used in one single case of the user prompting to delete the app's data, which it already has its own deletion commands
:: This thing will stay here as a relic of my mistakes during the making of this app
:system_resetSlots
for /l %%a in (1, 1, 100) do (
	set slot_num=%%a
	del "C:\karonboi\KaronWizard\saved_selections\%slot_num%.slt"
)
call :system_createSlots
goto endoffile

:: Checks for missing slot files, then create new ones
:system_createSlots
if %slot_num% gtr 99 goto endoffile
set /a slot_num=%slot_num%+1
if not exist "C:\karonboi\KaronWizard\saved_selections\%slot_num%.slt" call :system_addSlot
goto system_createSlots

:system_addSlot
(
	echo @echo off
	echo set "slot_name=(none)"
	echo set "lock_state=0"
	echo set "char1=0"
	echo set "char2=0"
	echo set "char3=0"
	echo set "char4=0"
	echo set "char5=0"
	echo set "char6=0"
	echo set "char7=0"
	echo set "char8=0"
	echo set "char9=0"
	echo set "char10=0"
	echo set "char11=0"
	echo set "char1_name=(none)"
	echo set "char2_name=(none)"
	echo set "char3_name=(none)"
	echo set "char4_name=(none)"
	echo set "char5_name=(none)"
	echo set "char6_name=(none)"
	echo set "char7_name=(none)"
	echo set "char8_name=(none)"
	echo set "char9_name=(none)"
	echo set "char10_name=(none)"
	echo set "char11_name=(none)"
	echo set "veh1=0"
	echo set "veh2=0"
	echo set "veh3=0"
	echo set "veh4=0"
	echo set "veh5=0"
	echo set "veh6=0"
	echo set "veh7=0"
	echo set "veh8=0"
	echo set "veh9=0"
	echo set "veh10=0"
	echo set "veh11=0"
	echo set "veh1_name=(none)"
	echo set "veh2_name=(none)"
	echo set "veh3_name=(none)"
	echo set "veh4_name=(none)"
	echo set "veh5_name=(none)"
	echo set "veh6_name=(none)"
	echo set "veh7_name=(none)"
	echo set "veh8_name=(none)"
	echo set "veh9_name=(none)"
	echo set "veh10_name=(none)"
	echo set "veh11_name=(none)"
) > "C:\karonboi\KaronWizard\saved_selections\%slot_num%.slt"
goto endoffile

:: This section may be retired soon
:scene_system_win11Note
@mode con lines=24 cols=92
cls
echo.
echo    Note to Windows 11 users
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    (you can ignore this if you open the app via the app.bat file and everything appears
echo    to be normal)
echo.
echo    Make sure you have started this app as administrator to force it to use the vanilla
echo    Command Prompt window, as starting this app in Terminal will cause severe visual
echo    glitches in the app's menus. However, you don't need to if the OS has been updated to
echo    the latest build of version 23H2, or the Terminal app has been updated to version
echo    1.22.10731.0 or newer.
echo.
echo    Also, if you want to resize the app's window, just hover the mouse pointer to here and
echo    use the scroll wheel while holding the Ctrl key. This won't work in Terminal though.
echo.
echo    You can disable this message later in Other options.
echo.
cmdmenusel %bg_color%%hl_color% "   Can I disable it now?" "   OK"
if %errorlevel% == 1 set win11_note=0 && call :system_saveOptionsData
goto scene_select_opponent

:: Main menu, obviously.
:: Sometimes you will see this menu being mentioned as a "workspace"
:scene_select_opponent
title Mario Kart Wii: Custom CPU Character/Vehicle Selector
@mode con lines=20 cols=92
if exist C:\karonboi\KaronWizard\tmp\clip.txt del C:\karonboi\KaronWizard\tmp\clip.txt > nul
if %remem_selectData% == 1 call C:\karonboi\KaronWizard\tmp\select_data.bat > nul
if %remem_selectData% == 0 del C:\karonboi\KaronWizard\tmp\select_data.bat > nul
if "%code%" == "wait_input" set "code_name=Ask when generating code"
if not "%code%" == "wait_input" set "code_name=%code%"
cls
echo.
echo    Select a CPU opponent:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "       CPU 1 [%char1_name%, %veh1_name%]" "       CPU 2 [%char2_name%, %veh2_name%]" "       CPU 3 [%char3_name%, %veh3_name%]" "       CPU 4 [%char4_name%, %veh4_name%]" "       CPU 5 [%char5_name%, %veh5_name%]" "       CPU 6 [%char6_name%, %veh6_name%]" "       CPU 7 [%char7_name%, %veh7_name%]" "       CPU 8 [%char8_name%, %veh8_name%]" "       CPU 9 [%char9_name%, %veh9_name%]" "       CPU 10 [%char10_name%, %veh10_name%]" "       CPU 11 [%char11_name%, %veh11_name%]" " (...) Other options" "   >   Generate Gecko code [Region: %code_name%]" "   X   Exit"
if %errorlevel% == 12 goto scene_others
if %errorlevel% == 13 goto system_checkDataValidity
if %errorlevel% == 14 (
	if %adva_endoffileExit% == 1 goto endoffile
	if %adva_endoffileExit% == 0 exit
)
set opponent=%errorlevel%
goto scene_select_character

:: There's always more than one option in your life
:scene_others
:: This starting part converts in-app variables to eligible texts to properly represents the options' status
if %win11_note% == 0 set "win11_note_name=Disabled"
if %win11_note% == 1 set "win11_note_name=Enabled"
if %darkmode% == 0 set "darkmode_name=Disabled"
if %darkmode% == 1 set "darkmode_name=Enabled"
if "%code%" == "wait_input" set "code_name=Ask when generating code"
if not "%code%" == "wait_input" set "code_name=%code%"
@mode con lines=21 cols=92
cls
call :system_saveSelectDatatoTMP
echo.
:: See the symbol below the file/release version string? Can you guess what it is?
:: (spoilers alert, you will hear me mention about that figure multiple times as you progress)
echo                                                                File version: %fileVer%
echo    Other options                                               Release ver.: %relsVer%
echo                                                                ◥Ө┴Ө◤
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Code region [%code_name%]" "   Reset workspace" "   Set all CPUs' selections in workspace" "   Randomize CPUs' selections" "   Data management" "   View exported codes" "   Windows 11 message [%win11_note_name%]" "   Dark mode [%darkmode_name%]" "   Advanced settings" "   Check for updates" "   What is this thing?" "   How do I use it?" " < Back"
cls
if %errorlevel% == 1 goto scene_code_region
if %errorlevel% == 2 del C:\karonboi\KaronWizard\tmp\select_data.bat & goto system_createCharPlaceholders
if %errorlevel% == 3 goto scene_set_all
if %errorlevel% == 4 goto scene_randomize
if %errorlevel% == 5 goto scene_selectionsManagement
if %errorlevel% == 6 start C:\karonboi\KaronWizard\exported_selections
if %errorlevel% == 7 goto scene_others_win11Note_ref
if %errorlevel% == 8 goto scene_others_darkMode
if %errorlevel% == 9 goto scene_others_advanced
if %errorlevel% == 10 goto scene_others_checkUpdates
if %errorlevel% == 11 goto scene_explain
if %errorlevel% == 12 goto scene_instruction
if %errorlevel% == 13 goto scene_select_opponent
goto scene_others

:: Temporarily saves selections data from the workspace
:: Since the %charX% and %vehX% variables (as well as %charX_name% and %vehX_name% variants) are shared across processes, their values can change constantly, resulting in ungodly inconsistencies without a recalling system
:: If %remem_selectData% is 1, this file will not be deleted upon startup
:system_saveSelectDatatoTMP
(
	echo @echo off
	echo set "char1=%char1%"
	echo set "char2=%char2%"
	echo set "char3=%char3%"
	echo set "char4=%char4%"
	echo set "char5=%char5%"
	echo set "char6=%char6%"
	echo set "char7=%char7%"
	echo set "char8=%char8%"
	echo set "char9=%char9%"
	echo set "char10=%char10%"
	echo set "char11=%char11%"
	echo set "char1_name=%char1_name%"
	echo set "char2_name=%char2_name%"
	echo set "char3_name=%char3_name%"
	echo set "char4_name=%char4_name%"
	echo set "char5_name=%char5_name%"
	echo set "char6_name=%char6_name%"
	echo set "char7_name=%char7_name%"
	echo set "char8_name=%char8_name%"
	echo set "char9_name=%char9_name%"
	echo set "char10_name=%char10_name%"
	echo set "char11_name=%char11_name%"
	echo set "veh1=%veh1%"
	echo set "veh2=%veh2%"
	echo set "veh3=%veh3%"
	echo set "veh4=%veh4%"
	echo set "veh5=%veh5%"
	echo set "veh6=%veh6%"
	echo set "veh7=%veh7%"
	echo set "veh8=%veh8%"
	echo set "veh9=%veh9%"
	echo set "veh10=%veh10%"
	echo set "veh11=%veh11%"
	echo set "veh1_name=%veh1_name%"
	echo set "veh2_name=%veh2_name%"
	echo set "veh3_name=%veh3_name%"
	echo set "veh4_name=%veh4_name%"
	echo set "veh5_name=%veh5_name%"
	echo set "veh6_name=%veh6_name%"
	echo set "veh7_name=%veh7_name%"
	echo set "veh8_name=%veh8_name%"
	echo set "veh9_name=%veh9_name%"
	echo set "veh10_name=%veh10_name%"
	echo set "veh11_name=%veh11_name%"
) > C:\karonboi\KaronWizard\tmp\select_data.bat
goto endoffile

:: This is used in case the settings file is not found
:system_createOptionsData
echo set "code=NTSC-U" >> C:\karonboi\KaronWizard\options.bat
echo set remem_selectData=1 >> C:\karonboi\KaronWizard\options.bat
echo set win11_note=1 >> C:\karonboi\KaronWizard\options.bat
echo set adva_endoffileExit=0 >> C:\karonboi\KaronWizard\options.bat
echo set adva_datManCache=0 >> C:\karonboi\KaronWizard\options.bat
echo set adva_datManCachePersist=0 >> C:\karonboi\KaronWizard\options.bat
echo set slot_lock=0 >> C:\karonboi\KaronWizard\options.bat
echo set lockToggle=0 >> C:\karonboi\KaronWizard\options.bat
echo set askLockonSave=0 >> C:\karonboi\KaronWizard\options.bat
echo set darkmode=1 >> C:\karonboi\KaronWizard\options.bat
goto endoffile

:: Does what it says
:system_saveOptionsData
echo.
del C:\karonboi\KaronWizard\options.bat > nul
echo set "code=%code%" >> C:\karonboi\KaronWizard\options.bat
echo set remem_selectData=%remem_selectData% >> C:\karonboi\KaronWizard\options.bat
echo set win11_note=%win11_note% >> C:\karonboi\KaronWizard\options.bat
echo set adva_endoffileExit=%adva_endoffileExit% >> C:\karonboi\KaronWizard\options.bat
echo set adva_datManCache=%adva_datManCache% >> C:\karonboi\KaronWizard\options.bat
echo set adva_datManCachePersist=%adva_datManCachePersist% >> C:\karonboi\KaronWizard\options.bat
echo set slot_lock=%slot_lock% >> C:\karonboi\KaronWizard\options.bat
echo set lockToggle=%lockToggle% >> C:\karonboi\KaronWizard\options.bat
echo set askLockonSave=%askLockonSave% >> C:\karonboi\KaronWizard\options.bat
echo set darkmode=%darkmode% >> C:\karonboi\KaronWizard\options.bat
echo    Settings saved.⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
goto endoffile

:: I have the memory capacity of a goldfish
:: And I feel like I'm insulting the fish
:scene_others_rememSaveData
bg locate 0 0
set "optn1= "
set "optn2= "
if %remem_selectData% == 1 set "optn1=*"
if %remem_selectData% == 0 set "optn2=*"
echo.
echo    Other options - Data management - Remember workspace's selection data
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Enable the app to recall the selection data modified since the last time this app was on?
echo.
cmdmenusel %bg_color%%hl_color% " %optn1% Enable" " %optn2% Disable" " < Back"
if %errorlevel% == 1 set remem_selectData=1
if %errorlevel% == 2 set remem_selectData=0
if %errorlevel% == 3 goto scene_selectionsManagement
call :system_saveOptionsData
goto scene_others_rememSaveData

:scene_others_darkMode
:: You know who's this mode for
if %darkmode% == 1 set "bg_color=07" && set "hl_color=70"
if %darkmode% == 0 set "bg_color=70" && set "hl_color=07"
color %bg_color%
bg locate 0 0
set "optn1= "
set "optn2= "
if %darkmode% == 1 set "optn1=*"
if %darkmode% == 0 set "optn2=*"
echo.
echo    Other options - Dark mode
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    (be a Discord user and avoid thy sun light)
echo.
cmdmenusel %bg_color%%hl_color% " %optn1% Enable" " %optn2% Disable" " < Back"
if %errorlevel% == 1 set darkmode=1
if %errorlevel% == 2 set darkmode=0
if %errorlevel% == 3 goto scene_others
call :system_saveOptionsData
goto scene_others_darkMode

:scene_others_checkUpdates
cls
echo.
echo    Other options - Check for updates
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Check for new updates (both stable and beta) at the app's GitHub page.
echo.
cmdmenusel %bg_color%%hl_color% "   Go to GitHub page" " < Back"
if %errorlevel% == 1 start %updateLink%
if %errorlevel% == 2 goto scene_others
goto scene_others_checkUpdates

:scene_others_advanced
if %adva_endoffileExit% == 0 set "adva_endoffileExit_name=Disabled"
if %adva_endoffileExit% == 1 set "adva_endoffileExit_name=Enabled"
if %adva_datManCache% == 0 set "adva_datManCache_name=Disabled"
if %adva_datManCache% == 1 (
	if %adva_datManCachePersist% == 1 set "adva_datManCache_name=Enabled, with persistent caching"
	if %adva_datManCachePersist% == 0 set "adva_datManCache_name=Enabled"
)
@mode con lines=21 cols=92
cls
echo.
echo    Other options - Advanced settings
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Some settings here are for debug purposes or may affect how the app works normally.
echo.
cmdmenusel %bg_color%%hl_color% "   Use 'endoffile' to close app [%adva_endoffileExit_name%]" "   Data management caching [%adva_datManCache_name%]" " < Back"
cls
if %errorlevel% == 1 goto scene_others_advanced_endoffileExit
if %errorlevel% == 2 @mode con lines=30 cols=92 && goto scene_others_advanced_datManCache
if %errorlevel% == 3 goto scene_others
goto scene_others_advanced

:scene_others_advanced_endoffileExit
bg locate 0 0
set "optn1= "
set "optn2= "
if %adva_endoffileExit% == 1 set "optn1=*"
if %adva_endoffileExit% == 0 set "optn2=*"
echo.
echo    Other options - Advanced settings - Use 'endoffile' to exit
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Enable the app to exit by redirecting to the 'endoffile' code block instead of using
echo    the 'exit' command? (useful for diagnostics if the app is opened via Command Prompt)
echo.
cmdmenusel %bg_color%%hl_color% " %optn1% Enable" " %optn2% Disable" " < Back"
if %errorlevel% == 1 set adva_endoffileExit=1
if %errorlevel% == 2 set adva_endoffileExit=0
if %errorlevel% == 3 goto scene_others_advanced
call :system_saveOptionsData
goto scene_others_advanced_endoffileExit

:scene_others_advanced_datManCache
bg locate 0 0
set "optn1= "
set "optn2= "
set "optn3= "
if %adva_datManCache% == 1 set "optn1=*"
if %adva_datManCache% == 0 set "optn2=*"
if %adva_datManCachePersist% == 1 set "optn3=*"
echo.
echo    Other options - Advanced settings - Data management caching
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Enable the app to cache the list of slots' names the first time Data management menu
echo    is opened?
echo.
echo    The cache will not be updated until the app closes, only minor changes made by saving
echo    or erasing slots will update a small portion of that. This will disable full cache
echo    updating, thus reducing loading times.
echo.
echo    Persistent caching keeps the cache data of the previous session available even after
echo    the app has closed. This will further improve loading times in the 'Data management'
echo    menu, but it will also increase the risk of data desync if the cached content no
echo    longer matches with the original one. Has no effect if the core feature is disabled
echo    and requires the app to be restarted to take effect.
echo.
echo    If you are disabling this, enter and exit Data management menu for the change to take    
echo    effect.
echo.
cmdmenusel %bg_color%%hl_color% " %optn1% Enable" " %optn3% Persistent caching" " %optn2% Disable" " < Back"
if %errorlevel% == 1 set adva_datManCache=1
if %errorlevel% == 2 (
	if %adva_datManCachePersist% == 1 (
		set adva_datManCachePersist=0
		if exist C:\karonboi\KaronWizard\cache.bat del C:\karonboi\KaronWizard\cache.bat
	) else if %adva_datManCachePersist% == 0 (
		set adva_datManCachePersist=1
		if not exist C:\karonboi\KaronWizard\cache.bat (
			call :system_readFiles
			call createPersistentCache.bat
			title Mario Kart Wii: Custom CPU Character/Vehicle Selector
		)
	)
)
if %errorlevel% == 3 (
	set adva_datManCache=0
	if exist C:\karonboi\KaronWizard\cache.bat del C:\karonboi\KaronWizard\cache.bat
)
if %errorlevel% == 4 goto scene_others_advanced
call :system_saveOptionsData
goto scene_others_advanced_datManCache

:: Microsoft, can you please just stop inflating Windows with your AI bullshit?
:: Valve released SteamOS which means you're about to die
:scene_others_win11Note_ref
bg locate 0 0
set "optn1= "
set "optn2= "
if %win11_note% == 1 set "optn1=*"
if %win11_note% == 0 set "optn2=*"
echo.
echo    Other options - Windows 11 message
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Enable the app to remind Windows 11 users to use this app as administrator at every
echo    startup?
echo.
cmdmenusel %bg_color%%hl_color% " %optn1% Enable" " %optn2% Disable" " < Back"
if %errorlevel% == 1 set win11_note=1
if %errorlevel% == 2 set win11_note=0
if %errorlevel% == 3 goto scene_others
call :system_saveOptionsData
goto scene_others_win11Note_ref

:: Average day of an Amazon warehouse manager
:: I'm not paid enough for this
:scene_selectionsManagement
color %bg_color%
if %remem_selectData% == 0 set "remem_selectData_name=Disabled"
if %remem_selectData% == 1 set "remem_selectData_name=Enabled"
set slottoLoad=0
cls
@mode con lines=20 cols=100
echo.
echo    Please wait...
echo.
set i=0
if %adva_datManCache% == 0 set adva_datManCache_intervent=0
if %isDataRead% == 0 set free_slot=0 && call :system_readFiles
if %adva_datManCache% == 1 set adva_datManCache_intervent=1
if %slot_lock% == 0 (
	set "slot_lock_name=Disabled completely"
) else if %slot_lock% == 1 (
	if %lockToggle% == 1 set "slot_lock_name=In-menu toggle"
	if %askLockonSave% == 1 set "slot_lock_name=In-menu toggle and ask lock on save"
)
if %adva_datManCache% == 1 (
	if %adva_datManCachePersist% == 1 call C:\karonboi\KaronWizard\cache.bat
)
cls
title Mario Kart Wii: Custom CPU Character/Vehicle Selector
echo.
echo    Other options - Data management
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Free space: %free_slot% out of 100
if %adva_datManCache% == 1 (
	if %adva_datManCachePersist% == 1 echo    [Last persistent cache update: %cache_lastUpdated%]
	if %adva_datManCachePersist% == 0 echo    [Data management caching is enabled]
)
echo.
echo %data_1%%data_2%%data_3%%data_4%%data_5%%data_6%%data_7%%data_8%%data_9%%data_10%%data_11%%data_12%%data_13%%data_14%%data_15%%data_16%%data_17%%data_18%%data_19%%data_20%%data_21%%data_22%%data_23%%data_24%%data_25%%data_26%%data_27%%data_28%%data_29%%data_30%%data_31%%data_32%%data_33%%data_34%%data_35%%data_36%%data_37%%data_38%%data_39%%data_40%%data_41%%data_42%%data_43%%data_44%%data_45%%data_46%%data_47%%data_48%%data_49%%data_50%%data_51%%data_52%%data_53%%data_54%%data_55%%data_56%%data_57%%data_58%%data_59%%data_60%%data_61%%data_62%%data_63%%data_64%%data_65%%data_66%%data_67%%data_68%%data_69%%data_70%%data_71%%data_72%%data_73%%data_74%%data_75%%data_76%%data_77%%data_78%%data_79%%data_80%%data_81%%data_82%%data_83%%data_84%%data_85%%data_86%%data_87%%data_88%%data_89%%data_90%%data_91%%data_92%%data_93%%data_94%%data_95%%data_96%%data_97%%data_98%%data_99%%data_100%
echo.
cmdmenusel %bg_color%%hl_color% "   View selections' data" "   Save current selections" "   Load selections to workspace" "   Erase selections" "   View exported codes" "   Remember workspace's selection data [%remem_selectData_name%]" "   Slot locking options [%slot_lock_name%]" "   Delete options and selection data from this computer" " < Back"
cls
if %errorlevel% == 1 goto scene_viewSelections
if %errorlevel% == 2 goto scene_saveSelections
if %errorlevel% == 3 goto scene_loadSelections
if %errorlevel% == 4 goto scene_deleteSelections
if %errorlevel% == 5 start C:\karonboi\KaronWizard\exported_selections
if %errorlevel% == 6 goto scene_others_rememSaveData
if %errorlevel% == 7 goto scene_others_slotLockOptions
if %errorlevel% == 8 goto scene_deleteReferences
if %errorlevel% == 9 (
	if %adva_datManCache% == 1 goto scene_others
	if %adva_datManCache% == 0 set isDataRead=0 && goto scene_others
) else set isDataRead=0 && goto scene_others
goto scene_selectionsManagement

:: Reads the selection slots' data
:: Originally, this code block was in the three separate slot management menus, which means the slot data is read every time the menu switches from one to another, introducing unneccessary delays
:: The %isDataRead% variable prevents the app from refreshing the slots' data if the user is still in the Data management menu and only do so to a single slot that is recently edited by the user
:: If %adva_datManCache% is 1, this code block will be only used once since the app's startup
:: And if %adva_datManCachePersist% is 1, this code block's core functions will be skipped entirely
:system_readFiles
if %adva_datManCache_intervent% == 1 goto endoffile
if %adva_datManCache% == 1 (
	if %adva_datManCachePersist% == 1 (
		if exist C:\karonboi\KaronWizard\cache.bat call C:\karonboi\KaronWizard\cache.bat && goto endoffile
	)
)	
if %i% gtr 99 set isDataRead=1 && goto endoffile
set /a i=%i%+1
copy "C:\karonboi\KaronWizard\saved_selections\%i%.slt" "C:\karonboi\KaronWizard\tmp\save_slt.bat" > nul
call C:\karonboi\KaronWizard\tmp\save_slt.bat
if "%slot_name%" == "(none)" set /a free_slot=%free_slot%+1
if not "%slot_name%" == "(none)" set "data_%i%=█"
set slot%i%_name=%slot_name%
del C:\karonboi\KaronWizard\tmp\save_slt.bat
:: Since 4.0.2, the data-reading process was visualized by a loading bar. Peak innovation, for it had taken a developer 4 revisions to add a basic UI feature
:: ... and since 4.0.2.7, this feature was temporarily removed because it caused too much slowdowns
:: ... and since 4.0.2.8, this feature was re-designed to eliminate the slowdowns
set /a i_loadBar=%i%-1
title [%i%/100]
goto system_readFiles

:: From scene_saveSelections to scene_instruction, the corresponding applets will be called instead
:scene_saveSelections
call select_save.bat
goto scene_selectionsManagement

:scene_loadSelections
call select_load.bat
goto scene_selectionsManagement

:scene_viewSelections
call select_view.bat
goto scene_selectionsManagement

:scene_others_slotLockOptions
bg locate 0 0
set "optn1= "
set "optn2= "
set "optn3= "
:: I exist just to suffer
if %slot_lock% == 0 set "optn1=*"
if %slot_lock% == 1 (
	if %lockToggle% == 1 set "optn2=*"
	if %askLockonSave% == 1 set "optn3=*"
)
if %askLockonSave% == 1 (
	if %lockToggle% == 0 (
		set askLockonSave=0
		set slot_lock=0
		set "optn1= "
		set "optn3= "
		call :system_saveOptionsData
	)
)
echo.
echo    Other options - Data management - Slot locking options
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    This is a mistake-proof feature that prevents selected slots from being altered on accident.
:: The reason this feature was added was because the developer commited a brain fart and destroyed his own ideal racer set
echo    Choose how this feature should behave in the app.
echo.
cmdmenusel %bg_color%%hl_color% " %optn1% Disable completely" " %optn2% Lock/unlock toggle in 'View selections data' menu" " %optn3% Ask to lock in each save" " < Back"
:: The logic nightmare begins
if %errorlevel% == 1 call :system_subProc_others_slotLockOptions_disableAll
if %errorlevel% == 2 (
	if %lockToggle% == 0 (
		set slot_lock=1
		set lockToggle=1
		call :system_saveOptionsData
	) else if %lockToggle% == 1 (
		if %askLockonSave% == 1 call :scene_system_others_slotLockOptions_askDisable
		if %askLockonSave% == 0 (
			if %lockToggle% == 0 set lockToggle=1 && set slot_lock=1
			if %lockToggle% == 1 set lockToggle=0 && set slot_lock=0
			call :system_saveOptionsData
		)
	)
) else if %errorlevel% == 3 (
	if %lockToggle% == 0 call :scene_system_others_slotLockOptions_askEnable
	if %lockToggle% == 1 (
		if %askLockonSave% == 0 set askLockonSave=1
		if %askLockonSave% == 1 set askLockonSave=0
		call :system_saveOptionsData
	)
) else if %errorlevel% == 4 goto scene_selectionsManagement
goto scene_others_slotLockOptions

:scene_system_others_slotLockOptions_askDisable
echo.
echo    To disable this, asking to lock on each save must be disabled as well.
echo    Do you want to continue?
echo.
cmdmenusel %bg_color%%hl_color% "   Yes" "   No"
if %errorlevel% == 1 call :system_subProc_others_slotLockOptions_disableAll
if %errorlevel% == 2 call :system_cleanSubMenu_others_slotLockOptions && goto scene_others_slotLockOptions
goto endoffile

:scene_system_others_slotLockOptions_askEnable
echo.
echo    To enable this, the lock/unlock toggle must be enabled as well.
echo    Do you want to continue?
echo.
cmdmenusel %bg_color%%hl_color% "   Yes" "   No"
if %errorlevel% == 1 call :system_subProc_others_slotLockOptions_enableAll
if %errorlevel% == 2 call :system_cleanSubMenu_others_slotLockOptions && goto scene_others_slotLockOptions
goto endoffile

:system_subProc_others_slotLockOptions_disableAll
set slot_lock=0
set lockToggle=0
set askLockonSave=0
call :system_cleanSubMenu_others_slotLockOptions
call :system_saveOptionsData
goto endoffile

:system_subProc_others_slotLockOptions_enableAll
set slot_lock=1
set lockToggle=1
set askLockonSave=1
call :system_cleanSubMenu_others_slotLockOptions
call :system_saveOptionsData
goto endoffile

:system_cleanSubMenu_others_slotLockOptions
bg locate 13 0
echo ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
echo ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
echo.
echo ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
echo ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
bg locate 12 0
goto endoffile
		
:scene_randomize
:: Hey there, did you bring in the dice?
call randomizer.bat
call :system_saveSelectDatatoTMP
goto scene_others

:scene_deleteSelections
call select_eras.bat
goto scene_selectionsManagement

:scene_explain
call scene_explain.bat
goto scene_others

:scene_instruction
:: Screw the Switch 2 Welcome Tour, I'm homebrewing one my own
call scene_instruct.bat
goto scene_others

:: I main Donkey Kong, Link and Kirby in Smash Ultimate (mostly DK cuz spiking good)
:: At random times, I may play as Cloud, Sephiroth, or Min Min (last one's a lie don't believe him)
:: I also main Greninja but only occasinally due to the lack of combo-openers besides dash attack, which is really hard to pull out, and being a lightweight character, heavyweights don't even need to break a sweat to slap that poor amphibian to death
:: Also unrelated, but I have a male Greninja named "Ballison" in Pokemon X, as well as a female one WITH THE SAME NAME but because that didn't sound right so I later made a new file and renamed her "Konuichi" in Y. However, I still kept the "Ballison" naming as her canonical first name (in my head at least)
:: Off-topic, but it sounds like they could live a happy life together in Tarrey Village by the way
:scene_code_region
bg locate 0 0
set "optn1= "
set "optn2= "
set "optn3= "
set "optn4= "
set "optn5= "
if "%code%" == "NTSC-U" set "optn1=*"
if "%code%" == "PAL" set "optn2=*"
if "%code%" == "NTSC-J" set "optn3=*"
if "%code%" == "NTSC-K" set "optn4=*"
if "%code%" == "wait_input" set "optn5=*" 
echo.
echo    Other options - Code region
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Select a region for the Gecko code:
echo.
cmdmenusel %bg_color%%hl_color% " %optn1% NTSC-U" " %optn2% PAL" " %optn3% NTSC-J" " %optn4% NTSC-K" " %optn5% Ask when generating code" " < Back"
if %errorlevel% == 1 set "code=NTSC-U"
if %errorlevel% == 2 set "code=PAL"
if %errorlevel% == 3 set "code=NTSC-J"
if %errorlevel% == 4 set "code=NTSC-K"
if %errorlevel% == 5 set "code=wait_input"
if %errorlevel% == 6 goto scene_others
call :system_saveOptionsData
goto scene_code_region

:: Give you up
:scene_deleteReferences
cls
@mode con lines=20 cols=92
echo.
echo    Delete the app's selection storage files and configurations' data from this device?
echo    (exported selection data in form of text files will not be affected).
echo    Once done, the app will close.
echo.
echo    Those data cannot be recovered once lost, so be careful^^!
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Delete" "   Cancel"
if %errorlevel% == 2 goto scene_selectionsManagement
if %errorlevel% == 1 (
	:: Let you down
	echo.
	echo    THIS IS THE LAST CONFIRMATION^^! Are you sure you want to do this?
	echo.
	cmdmenusel %bg_color%%hl_color% "   Nah, on second thought..." "   I am aware of what I am about to do"
	set errorlevel_confirm=%errorlevel%
)
if %errorlevel_confirm% == 2 (
	echo.
	echo    Deleting...
	:: Run around and desert you
	call :system_deleteSaveSlots
	del "C:\karonboi\KaronWizard\options.bat"
	del "C:\karonboi\KaronWizard\tmp\select_data.bat"
	cls.
	echo.
	echo    Goodbye.
	timeout 3 > nul
	exit
)
if %errorlevel_confirm% == 1 goto scene_selectionsManagement
goto scene_others

:system_deleteSaveSlots
for /l %%a in (1, 1, 100) do del "C:\karonboi\KaronWizard\saved_selections\%%a.slt" > nul
goto endoffile

:: Have you seen Mega Greninja's design from Pokémon Legends Z-A? I do agree the new color schemes look way cooler than the Ash- variant, but the upside-down posture might take a while to get used to
:: Still couldn't believe we got a DLC for a game that wasn't even out yet

:: Checks for any invalidity of the character-vehicle size-relative rule
:: For example, a lightweight character must be paired with small vehicles and vice versa
:system_checkDataValidity
bg locate 1 3
echo Validating data... This could take a while.
call validator.bat
if %isChar1Invalid% == 1 goto scene_stop_generateCode
if %isChar2Invalid% == 1 goto scene_stop_generateCode
if %isChar3Invalid% == 1 goto scene_stop_generateCode
if %isChar4Invalid% == 1 goto scene_stop_generateCode
if %isChar5Invalid% == 1 goto scene_stop_generateCode
if %isChar6Invalid% == 1 goto scene_stop_generateCode
if %isChar7Invalid% == 1 goto scene_stop_generateCode
if %isChar8Invalid% == 1 goto scene_stop_generateCode
if %isChar9Invalid% == 1 goto scene_stop_generateCode
if %isChar10Invalid% == 1 goto scene_stop_generateCode
if %isChar11Invalid% == 1 goto scene_stop_generateCode
if %isVeh1Invalid% == 1 goto scene_stop_generateCode
if %isVeh2Invalid% == 1 goto scene_stop_generateCode
if %isVeh3Invalid% == 1 goto scene_stop_generateCode
if %isVeh4Invalid% == 1 goto scene_stop_generateCode
if %isVeh5Invalid% == 1 goto scene_stop_generateCode
if %isVeh6Invalid% == 1 goto scene_stop_generateCode
if %isVeh7Invalid% == 1 goto scene_stop_generateCode
if %isVeh8Invalid% == 1 goto scene_stop_generateCode
if %isVeh9Invalid% == 1 goto scene_stop_generateCode
if %isVeh10Invalid% == 1 goto scene_stop_generateCode
if %isVeh11Invalid% == 1 goto scene_stop_generateCode
if "%code%" == "wait_input" goto scene_code_region_waiting
goto scene_generateCode_done

:scene_code_region_waiting
set code_wasWaitingforInput=1
cls
echo.
echo    Select a region for the Gecko code:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   NTSC-U" "   PAL" "   NTSC-J" "   NTSC-K" " < Back"
if %errorlevel% == 1 set "code=NTSC-U"
if %errorlevel% == 2 set "code=PAL"
if %errorlevel% == 3 set "code=NTSC-J"
if %errorlevel% == 4 set "code=NTSC-K"
if %errorlevel% == 5 goto scene_select_opponent
goto scene_generateCode_done

:: Displays the Gecko code to use with Dolphin Emulator or any other Wii/GameCube emulators (if they exist)
:: The only difference between four regions of the code is the first chunk in the first line, likely to determine with regional copy of the game the code will be loaded in
:scene_generateCode_done
@mode con lines=26 cols=92
cls
echo.
echo    The Gecko code creation is complete.
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
if "%code%" == "NTSC-U" (
    echo    [NTSC-U]
    echo    C252B7F8 0000000E
	echo    90C4000C 4800001D
    echo    %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo    %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo    %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo    7CC802A6 38C6FFFF
    echo    38E40008 3980000B
    echo    7D8903A6 8D860001
    echo    918700F4 8D860001
    echo    958700F0 4200FFF0
    echo    3CC04800 60C60010
    echo    3CE08052 60E7B7EC
    echo    90C70000 7C00386C
    echo    7C0004AC 7C003FAC
    echo    4C00012C 00000000
	(
	echo C252B7F8 0000000E
	echo 90C4000C 4800001D
    echo %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo 7CC802A6 38C6FFFF
    echo 38E40008 3980000B
    echo 7D8903A6 8D860001
    echo 918700F4 8D860001
    echo 958700F0 4200FFF0
    echo 3CC04800 60C60010
    echo 3CE08052 60E7B7EC
    echo 90C70000 7C00386C
    echo 7C0004AC 7C003FAC
    echo 4C00012C 00000000
	) > C:\karonboi\KaronWizard\tmp\clip.txt
) else if "%code%" == "PAL" (
    echo    [PAL]
	echo    C2530340 0000000E
	echo    90C4000C 4800001D
    echo    %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo    %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo    %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo    7CC802A6 38C6FFFF
    echo    38E40008 3980000B
    echo    7D8903A6 8D860001
    echo    918700F4 8D860001
    echo    958700F0 4200FFF0
    echo    3CC04800 60C60010
    echo    3CE08053 60E7B7EC
    echo    90C70000 7C00386C
    echo    7C0004AC 7C003FAC
    echo    4C00012C 00000000
	(
	echo C2530340 0000000E
	echo 90C4000C 4800001D
    echo %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo 7CC802A6 38C6FFFF
    echo 38E40008 3980000B
    echo 7D8903A6 8D860001
    echo 918700F4 8D860001
    echo 958700F0 4200FFF0
    echo 3CC04800 60C60010
    echo 3CE08053 60E7B7EC
    echo 90C70000 7C00386C
    echo 7C0004AC 7C003FAC
    echo 4C00012C 00000000
	) > C:\karonboi\KaronWizard\tmp\clip.txt
) else if "%code%" == "NTSC-J" (
    echo    [NTSC-J]
	echo    C252FCC0 0000000E
	echo    90C4000C 4800001D
    echo    %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo    %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo    %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo    7CC802A6 38C6FFFF
    echo    38E40008 3980000B
    echo    7D8903A6 8D860001
    echo    918700F4 8D860001
    echo    958700F0 4200FFF0
    echo    3CC04800 60C60010
    echo    3CE08052 60E7B7EC
    echo    90C70000 7C00386C
    echo    7C0004AC 7C003FAC
    echo    4C00012C 00000000
	(
	echo C252FCC0 0000000E
	echo 90C4000C 4800001D
    echo %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo 7CC802A6 38C6FFFF
    echo 38E40008 3980000B
    echo 7D8903A6 8D860001
    echo 918700F4 8D860001
    echo 958700F0 4200FFF0
    echo 3CC04800 60C60010
    echo 3CE08052 60E7B7EC
    echo 90C70000 7C00386C
    echo 7C0004AC 7C003FAC
    echo 4C00012C 00000000
	) > C:\karonboi\KaronWizard\tmp\clip.txt
) else if "%code%" == "NTSC-K" (
    echo    [NTSC-K]
	echo    C251E398 0000000E
	echo    90C4000C 4800001D
    echo    %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo    %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo    %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo    7CC802A6 38C6FFFF
    echo    38E40008 3980000B
    echo    7D8903A6 8D860001
    echo    918700F4 8D860001
    echo    958700F0 4200FFF0
    echo    3CC04800 60C60010
    echo    3CE08051 60E7B7EC
    echo    90C70000 7C00386C
    echo    7C0004AC 7C003FAC
    echo    4C00012C 00000000
	(
	echo C251E398 0000000E
	echo 90C4000C 4800001D
    echo %char1%%veh1%%char2%%veh2% %char3%%veh3%%char4%%veh4%
    echo %char5%%veh5%%char6%%veh6% %char7%%veh7%%char8%%veh8%
    echo %char9%%veh9%%char10%%veh10% %char11%%veh11%0000
    echo 7CC802A6 38C6FFFF
    echo 38E40008 3980000B
    echo 7D8903A6 8D860001
    echo 918700F4 8D860001
    echo 958700F0 4200FFF0
    echo 3CC04800 60C60010
    echo 3CE08051 60E7B7EC
    echo 90C70000 7C00386C
    echo 7C0004AC 7C003FAC
    echo 4C00012C 00000000
	) > C:\karonboi\KaronWizard\tmp\clip.txt
)
echo.
cmdmenusel %bg_color%%hl_color% "   Copy to clipboard" "   Export to text file (view them in Other options)" " < Return"
if %errorlevel% == 1 type C:\karonboi\KaronWizard\tmp\clip.txt|clip && goto scene_generateCode_done
if %errorlevel% == 2 goto scene_exportSelect
if %code_wasWaitingforInput% == 1 set "code=wait_input"
set code_wasWaitingforInput=0
del C:\karonboi\KaronWizard\tmp\clip.txt
goto scene_select_opponent

:: Exports the Gecko code as text file
:: File name syntax: ExportedSelections_<date-time>.txt
:: Note that on Windows 10 or older, the <date-time> section may change depending on the system's clock format
:scene_exportSelect
if not exist "C:\karonboi\KaronWizard\exported_selections" mkdir "C:\karonboi\KaronWizard\exported_selections" > nul
set "output=%date%-%time%"
set output_2=%output:/=-%
set output_3=%output_2::=-%
set datetime=%output_3: =%
copy C:\karonboi\KaronWizard\tmp\clip.txt "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt" > nul
echo. >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo Region: %code% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo Characters: >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 1: %char1_name%, %veh1_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 2: %char2_name%, %veh2_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 3: %char3_name%, %veh3_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 4: %char4_name%, %veh4_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 5: %char5_name%, %veh5_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 6: %char6_name%, %veh6_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 7: %char7_name%, %veh7_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 8: %char8_name%, %veh8_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 9: %char9_name%, %veh9_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 10: %char10_name%, %veh10_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
echo - CPU 11: %char11_name%, %veh11_name% >> "C:\karonboi\KaronWizard\exported_selections\ExportedSelections_%datetime%.txt"
goto scene_generateCode_done

:: I forgot how to breathe
:scene_stop_generateCode
@mode con lines=10 cols=92
cls
echo.
echo    Could not generate the Gecko code because invalid data has been found.
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Can't decide what to pick? Try randomizing one.
echo.
cmdmenusel %bg_color%%hl_color% "   Randomize CPUs' selections" " < Back"
if %errorlevel% == 1 call randomizer.bat
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:: Random facts: Rosalina's name in France is 'Harmony'; Toad's Japanese name is pronounced 'Kinopio', and Bowser is simply called 'Koopa'
:: Which leads to Koopa Troopa being called 'Nokonoko'. Sorry if I butchered that
:scene_select_character
set char=0
set veh=0
cls
@mode con lines=32 cols=92
color %bg_color%
echo.
echo    Select a character for CPU %opponent%:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Mario" "   Baby Peach" "   Waluigi" "   Bowser" "   Baby Daisy" "   Dry Bones" "   Baby Mario" "   Luigi" "   Toad" "   Donkey Kong" "   Yoshi" "   Wario" "   Baby Luigi" "   Toadette" "   Koopa Troopa" "   Daisy" "   Peach" "   Birdo" "   Diddy Kong" "   King Boo" "   Bowser Jr." "   Dry Bowser" "   Funky Kong" "   Rosalina" "   Mii (read instructions carefully)" " < Back a step"
if %errorlevel% == 1 set "char=00" && set "char_name=Mario"
if %errorlevel% == 2 set "char=01" && set "char_name=Baby Peach"
if %errorlevel% == 3 set "char=02" && set "char_name=Waluigi"
if %errorlevel% == 4 set "char=03" && set "char_name=Bowser"
if %errorlevel% == 5 set "char=04" && set "char_name=Baby Daisy"
if %errorlevel% == 6 set "char=05" && set "char_name=Dry Bones"
if %errorlevel% == 7 set "char=06" && set "char_name=Baby Mario"
if %errorlevel% == 8 set "char=07" && set "char_name=Luigi"
if %errorlevel% == 9 set "char=08" && set "char_name=Toad"
if %errorlevel% == 10 set "char=09" && set "char_name=Donkey Kong"
if %errorlevel% == 11 set "char=0A" && set "char_name=Yoshi"
if %errorlevel% == 12 set "char=0B" && set "char_name=Wario"
if %errorlevel% == 13 set "char=0C" && set "char_name=Baby Luigi"
if %errorlevel% == 14 set "char=0D" && set "char_name=Toadette"
if %errorlevel% == 15 set "char=0E" && set "char_name=Koopa Troopa"
if %errorlevel% == 16 set "char=0F" && set "char_name=Daisy"
if %errorlevel% == 17 set "char=10" && set "char_name=Peach"
if %errorlevel% == 18 set "char=11" && set "char_name=Birdo"
if %errorlevel% == 19 set "char=12" && set "char_name=Diddy Kong"
if %errorlevel% == 20 set "char=13" && set "char_name=King Boo"
if %errorlevel% == 21 set "char=14" && set "char_name=Bowser Jr."
if %errorlevel% == 22 set "char=15" && set "char_name=Dry Bowser"
if %errorlevel% == 23 set "char=16" && set "char_name=Funky Kong"
if %errorlevel% == 24 set "char=17" && set "char_name=Rosalina"
if %errorlevel% == 25 goto scene_mii
if %errorlevel% == 26 goto scene_select_opponent
goto scene_select_vehicles

:: I don't want to piss off people that think using they/them pronouns on a Mii with a specific gender is offensive... just in case
:scene_mii
cls
echo.
echo    Now CPU %opponent% plays as Mii, select the Mii's gender:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Male" "   Female" " < Back a step"
if %errorlevel% == 1 set "mii_gen=M" && set "mii_gen_name=male" && set "mii_gen_name_2=Male" && set "mii_gen_pronoun=his"
if %errorlevel% == 2 set "mii_gen=F" && set "mii_gen_name=female" && set "mii_gen_name_2=Female" && set "mii_gen_pronoun=her"
if %errorlevel% == 3 goto scene_select_character
goto scene_mii_2

:scene_mii_2
cls
echo.
echo    Now CPU %opponent% plays as %mii_gen_name% Mii, select %mii_gen_pronoun% outfit:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Outfit A" "   Outfit B" "   Outfit C" " < Back a step"
if %errorlevel% == 1 set "mii_outfit=A"
if %errorlevel% == 2 set "mii_outfit=B"
if %errorlevel% == 3 set "mii_outfit=C"
if %errorlevel% == 4 goto scene_mii
goto scene_mii_3

:: Gender inequality partially led to this
:scene_mii_3
cls
echo.
echo    Now CPU %opponent% plays as %mii_gen_name% Mii and wears outfit %mii_outfit%, select %mii_gen_pronoun% size:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Small" "   Medium" "   Large" " < Back a step"
if %errorlevel% == 1 set "mii_size=S" && set "mii_size_name=small"
if %errorlevel% == 2 set "mii_size=M" && set "mii_size_name=medium"
if %errorlevel% == 3 set "mii_size=L" && set "mii_size_name=large"
if %errorlevel% == 4 goto scene_mii_2
call :system_mii_process
goto scene_mii_4

:: Code nests, again I guess
:system_mii_process
:: Decides which hexadecimal number to use to call the proper Mii character depeding on their gender, size and outfit
if "%mii_gen%" == "M" (
	if "%mii_outfit%" == "A" (
		if "%mii_size%" == "S" set "char=18"
		if "%mii_size%" == "M" set "char=1E"
		if "%mii_size%" == "L" set "char=24"
		)
	if "%mii_outfit%" == "B" (
		if "%mii_size%" == "S" set "char=1A"
		if "%mii_size%" == "M" set "char=20"
		if "%mii_size%" == "L" set "char=26"
		)
	if "%mii_outfit%" == "C" (
		if "%mii_size%" == "S" set "char=1C"
		if "%mii_size%" == "M" set "char=22"
		if "%mii_size%" == "L" set "char=28"
	)
) else if "%mii_gen%" == "F" (
	if "%mii_outfit%" == "A" (
		if "%mii_size%" == "S" set "char=19"
		if "%mii_size%" == "M" set "char=1F"
		if "%mii_size%" == "L" set "char=25"
		)
	if "%mii_outfit%" == "B" (
		if "%mii_size%" == "S" set "char=1B"
		if "%mii_size%" == "M" set "char=21"
		if "%mii_size%" == "L" set "char=27"
		)
	if "%mii_outfit%" == "C" (
		if "%mii_size%" == "S" set "char=1D"
		if "%mii_size%" == "M" set "char=23"
		if "%mii_size%" == "L" set "char=29"
	)
)
goto endoffile

:scene_select_vehicles
:: This reference table lets the app know the characters' size so it can sort what vehicles to use
:: There's a second table that serves the same puropse, but it's only three lines long and is used for the Mii racers
cls
echo.
echo    Now CPU %opponent% plays as %char_name%, select a vehicle for the opponent to use:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
if "%char%" == "01" goto scene_select_vehicles_s
if "%char%" == "04" goto scene_select_vehicles_s
if "%char%" == "05" goto scene_select_vehicles_s
if "%char%" == "06" goto scene_select_vehicles_s
if "%char%" == "08" goto scene_select_vehicles_s
if "%char%" == "0C" goto scene_select_vehicles_s
if "%char%" == "0D" goto scene_select_vehicles_s
if "%char%" == "0E" goto scene_select_vehicles_s
if "%char%" == "00" goto scene_select_vehicles_m
if "%char%" == "07" goto scene_select_vehicles_m
if "%char%" == "0A" goto scene_select_vehicles_m
if "%char%" == "0F" goto scene_select_vehicles_m
if "%char%" == "10" goto scene_select_vehicles_m
if "%char%" == "11" goto scene_select_vehicles_m
if "%char%" == "12" goto scene_select_vehicles_m
if "%char%" == "14" goto scene_select_vehicles_m
if "%char%" == "02" goto scene_select_vehicles_l
if "%char%" == "03" goto scene_select_vehicles_l
if "%char%" == "09" goto scene_select_vehicles_l
if "%char%" == "0B" goto scene_select_vehicles_l
if "%char%" == "13" goto scene_select_vehicles_l
if "%char%" == "15" goto scene_select_vehicles_l
if "%char%" == "16" goto scene_select_vehicles_l
if "%char%" == "17" goto scene_select_vehicles_l
goto scene_select_vehicles

:scene_mii_4
cls
echo.
echo    Now CPU %opponent% plays as %mii_size_name% %mii_gen_name% Mii and wears outfit %mii_outfit%, select %mii_gen_pronoun% vehicle:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
if "%mii_size%" == "S" call :scene_select_vehicles_s_mii
if "%mii_size%" == "M" call :scene_select_vehicles_m_mii
if "%mii_size%" == "L" call :scene_select_vehicles_l_mii
goto scene_mii_3

:: The vehicle selection menus are split into three types: Small, Medium, Large
:: There are three other menus with the same functions, but they are specifically used for the Mii racers. The code blocks containing those menus are marked with the "_mii" suffix
:: I am currently unable to optimize this section because nesting commands in DOS is a bad idea (as well as stacking, it's basically spaghettifying the code), but I may find out the way, eventually
:scene_select_vehicles_s
echo    [Small Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart S" "   Booster Seat" "   Mini Beast" "   Cheep Charger" "   Tiny Titan" "   Blue Falcon" "   Standard Bike S" "   Bullet Bike" "   Bit Bike" "   Quacker" "   Magikruiser" "   Jet Bubble" " < Back a step"
if %errorlevel% == 1 set "veh%opponent%=00" && set "veh%opponent%_name=Standard Kart S"
if %errorlevel% == 2 set "veh%opponent%=03" && set "veh%opponent%_name=Booster Seat"
if %errorlevel% == 3 set "veh%opponent%=06" && set "veh%opponent%_name=Mini Beast"
if %errorlevel% == 4 set "veh%opponent%=09" && set "veh%opponent%_name=Cheep Charger"
if %errorlevel% == 5 set "veh%opponent%=0C" && set "veh%opponent%_name=Tiny Titan"
if %errorlevel% == 6 set "veh%opponent%=0F" && set "veh%opponent%_name=Blue Falcon"
if %errorlevel% == 7 set "veh%opponent%=12" && set "veh%opponent%_name=Standard Bike S"
if %errorlevel% == 8 set "veh%opponent%=15" && set "veh%opponent%_name=Bullet Bike"
if %errorlevel% == 9 set "veh%opponent%=18" && set "veh%opponent%_name=Bit Bike"
if %errorlevel% == 10 set "veh%opponent%=1B" && set "veh%opponent%_name=Quacker"
if %errorlevel% == 11 set "veh%opponent%=1E" && set "veh%opponent%_name=Magikruiser"
if %errorlevel% == 12 set "veh%opponent%=21" && set "veh%opponent%_name=Jet Bubble"
if %errorlevel% == 13 goto scene_select_character
set char%opponent%=%char%
set char%opponent%_name=%char_name%
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:: *suddenly feels gay*
:scene_select_vehicles_s_mii
echo    [Small Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart S" "   Booster Seat" "   Mini Beast" "   Cheep Charger" "   Tiny Titan" "   Blue Falcon" "   Standard Bike S" "   Bullet Bike" "   Bit Bike" "   Quacker" "   Magikruiser" "   Jet Bubble" " < Back a step"
if %errorlevel% == 1 set "veh%opponent%=00" && set "veh%opponent%_name=Standard Kart S"
if %errorlevel% == 2 set "veh%opponent%=03" && set "veh%opponent%_name=Booster Seat"
if %errorlevel% == 3 set "veh%opponent%=06" && set "veh%opponent%_name=Mini Beast"
if %errorlevel% == 4 set "veh%opponent%=09" && set "veh%opponent%_name=Cheep Charger"
if %errorlevel% == 5 set "veh%opponent%=0C" && set "veh%opponent%_name=Tiny Titan"
if %errorlevel% == 6 set "veh%opponent%=0F" && set "veh%opponent%_name=Blue Falcon"
if %errorlevel% == 7 set "veh%opponent%=12" && set "veh%opponent%_name=Standard Bike S"
if %errorlevel% == 8 set "veh%opponent%=15" && set "veh%opponent%_name=Bullet Bike"
if %errorlevel% == 9 set "veh%opponent%=18" && set "veh%opponent%_name=Bit Bike"
if %errorlevel% == 10 set "veh%opponent%=1B" && set "veh%opponent%_name=Quacker"
if %errorlevel% == 11 set "veh%opponent%=1E" && set "veh%opponent%_name=Magikruiser"
if %errorlevel% == 12 set "veh%opponent%=21" && set "veh%opponent%_name=Jet Bubble"
if %errorlevel% == 13 goto scene_mii_3
set char%opponent%=%char%
set "char%opponent%_name=%mii_gen_name_2% Mii, outfit %mii_outfit%, small size"
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:: I consume YouTube videos via osmosis
:scene_select_vehicles_m
echo    [Medium Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart M" "   Classic Dragster" "   Wild Wing" "   Super Blooper" "   Daytripper" "   Sprinter" "   Standard Bike M" "   Mach Bike" "   Sugarscoot" "   Zip Zip" "   Sneakster" "   Dolphin Dasher" " < Back a step"
if %errorlevel% == 1 set "veh%opponent%=01" && set "veh%opponent%_name=Standard Kart M"
if %errorlevel% == 2 set "veh%opponent%=04" && set "veh%opponent%_name=Classic Dragster"
if %errorlevel% == 3 set "veh%opponent%=07" && set "veh%opponent%_name=Wild Wing"
if %errorlevel% == 4 set "veh%opponent%=0A" && set "veh%opponent%_name=Super Blooper"
if %errorlevel% == 5 set "veh%opponent%=0D" && set "veh%opponent%_name=Daytripper"
if %errorlevel% == 6 set "veh%opponent%=10" && set "veh%opponent%_name=Sprinter"
if %errorlevel% == 7 set "veh%opponent%=13" && set "veh%opponent%_name=Standard Bike M"
if %errorlevel% == 8 set "veh%opponent%=16" && set "veh%opponent%_name=Mach Bike"
if %errorlevel% == 9 set "veh%opponent%=19" && set "veh%opponent%_name=Sugarscoot"
if %errorlevel% == 10 set "veh%opponent%=1C" && set "veh%opponent%_name=Zip Zip"
if %errorlevel% == 11 set "veh%opponent%=1F" && set "veh%opponent%_name=Sneakster"
if %errorlevel% == 12 set "veh%opponent%=22" && set "veh%opponent%_name=Dolphin Dasher"
if %errorlevel% == 13 goto scene_select_character
set char%opponent%=%char%
set char%opponent%_name=%char_name%
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:scene_select_vehicles_m_mii
echo    [Medium Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart M" "   Classic Dragster" "   Wild Wing" "   Super Blooper" "   Daytripper" "   Sprinter" "   Standard Bike M" "   Mach Bike" "   Sugarscoot" "   Zip Zip" "   Sneakster" "   Dolphin Dasher" " < Back a step"
if %errorlevel% == 1 set "veh%opponent%=01" && set "veh%opponent%_name=Standard Kart M"
if %errorlevel% == 2 set "veh%opponent%=04" && set "veh%opponent%_name=Classic Dragster"
if %errorlevel% == 3 set "veh%opponent%=07" && set "veh%opponent%_name=Wild Wing"
if %errorlevel% == 4 set "veh%opponent%=0A" && set "veh%opponent%_name=Super Blooper"
if %errorlevel% == 5 set "veh%opponent%=0D" && set "veh%opponent%_name=Daytripper"
if %errorlevel% == 6 set "veh%opponent%=10" && set "veh%opponent%_name=Sprinter"
if %errorlevel% == 7 set "veh%opponent%=13" && set "veh%opponent%_name=Standard Bike M"
if %errorlevel% == 8 set "veh%opponent%=16" && set "veh%opponent%_name=Mach Bike"
if %errorlevel% == 9 set "veh%opponent%=19" && set "veh%opponent%_name=Sugarscoot"
if %errorlevel% == 10 set "veh%opponent%=1C" && set "veh%opponent%_name=Zip Zip"
if %errorlevel% == 11 set "veh%opponent%=1F" && set "veh%opponent%_name=Sneakster"
if %errorlevel% == 12 set "veh%opponent%=22" && set "veh%opponent%_name=Dolphin Dasher"
if %errorlevel% == 13 goto scene_mii_3
set char%opponent%=%char%
set "char%opponent%_name=%mii_gen_name_2% Mii, outfit %mii_outfit%, medium size"
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:: My biggest achievement when I turned 18 was realizing I can print a document with lots of pages without the need of a duplex printer by printing the odd pages first on one side of the papers, then the even ones on the other
:scene_select_vehicles_l
echo    [Large Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart L" "   Offroader" "   Flame Flyer" "   Piranha Prowler" "   Jetsetter" "   Honeycoupe" "   Standard Bike L" "   Flame Runner" "   Wario Bike" "   Shooting Star" "   Spear" "   Phantom" " < Back a step"
if %errorlevel% == 1 set "veh%opponent%=02" && set "veh%opponent%_name=Standard Kart L"
if %errorlevel% == 2 set "veh%opponent%=05" && set "veh%opponent%_name=Offroader"
if %errorlevel% == 3 set "veh%opponent%=08" && set "veh%opponent%_name=Flame Flyer"
if %errorlevel% == 4 set "veh%opponent%=0B" && set "veh%opponent%_name=Piranha Prowler"
if %errorlevel% == 5 set "veh%opponent%=0E" && set "veh%opponent%_name=Jetsetter"
if %errorlevel% == 6 set "veh%opponent%=11" && set "veh%opponent%_name=Honeycoupe"
if %errorlevel% == 7 set "veh%opponent%=14" && set "veh%opponent%_name=Standard Bike L"
if %errorlevel% == 8 set "veh%opponent%=17" && set "veh%opponent%_name=Flame Runner"
if %errorlevel% == 9 set "veh%opponent%=1A" && set "veh%opponent%_name=Wario Bike"
if %errorlevel% == 10 set "veh%opponent%=1D" && set "veh%opponent%_name=Shooting Star"
if %errorlevel% == 11 set "veh%opponent%=20" && set "veh%opponent%_name=Spear"
if %errorlevel% == 12 set "veh%opponent%=23" && set "veh%opponent%_name=Phantom"
if %errorlevel% == 13 goto scene_select_character
set char%opponent%=%char%
set char%opponent%_name=%char_name%
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:scene_select_vehicles_l_mii
echo    [Large Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart L" "   Offroader" "   Flame Flyer" "   Piranha Prowler" "   Jetsetter" "   Honeycoupe" "   Standard Bike L" "   Flame Runner" "   Wario Bike" "   Shooting Star" "   Spear" "   Phantom" " < Back a step"
if %errorlevel% == 1 set "veh%opponent%=02" && set "veh%opponent%_name=Standard Kart L"
if %errorlevel% == 2 set "veh%opponent%=05" && set "veh%opponent%_name=Offroader"
if %errorlevel% == 3 set "veh%opponent%=08" && set "veh%opponent%_name=Flame Flyer"
if %errorlevel% == 4 set "veh%opponent%=0B" && set "veh%opponent%_name=Piranha Prowler"
if %errorlevel% == 5 set "veh%opponent%=0E" && set "veh%opponent%_name=Jetsetter"
if %errorlevel% == 6 set "veh%opponent%=11" && set "veh%opponent%_name=Honeycoupe"
if %errorlevel% == 7 set "veh%opponent%=14" && set "veh%opponent%_name=Standard Bike L"
if %errorlevel% == 8 set "veh%opponent%=17" && set "veh%opponent%_name=Flame Runner"
if %errorlevel% == 9 set "veh%opponent%=1A" && set "veh%opponent%_name=Wario Bike"
if %errorlevel% == 10 set "veh%opponent%=1D" && set "veh%opponent%_name=Shooting Star"
if %errorlevel% == 11 set "veh%opponent%=20" && set "veh%opponent%_name=Spear"
if %errorlevel% == 12 set "veh%opponent%=23" && set "veh%opponent%_name=Phantom"
if %errorlevel% == 13 goto scene_mii_3
set char%opponent%=%char%
set "char%opponent%_name=%mii_gen_name_2% Mii, outfit %mii_outfit%, large size"
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:scene_set_all
:: There is a different type of this code block, written specifically for handling Mii selections
:: The entire program itself is already terribly unoptimized, so this shouldn't be a surprise
set char=0
set veh=0
cls
@mode con lines=32 cols=92
color %bg_color%
echo.
echo    Select a character for all CPU opponents:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Mario" "   Baby Peach" "   Waluigi" "   Bowser" "   Baby Daisy" "   Dry Bones" "   Baby Mario" "   Luigi" "   Toad" "   Donkey Kong" "   Yoshi" "   Wario" "   Baby Luigi" "   Toadette" "   Koopa Troopa" "   Daisy" "   Peach" "   Birdo" "   Diddy Kong" "   King Boo" "   Bowser Jr." "   Dry Bowser" "   Funky Kong" "   Rosalina" "   Mii (read instructions carefully)" " < Back a step"
if %errorlevel% == 1 set "char=00" && set "char_name=Mario"
if %errorlevel% == 2 set "char=01" && set "char_name=Baby Peach"
if %errorlevel% == 3 set "char=02" && set "char_name=Waluigi"
if %errorlevel% == 4 set "char=03" && set "char_name=Bowser"
if %errorlevel% == 5 set "char=04" && set "char_name=Baby Daisy"
if %errorlevel% == 6 set "char=05" && set "char_name=Dry Bones"
if %errorlevel% == 7 set "char=06" && set "char_name=Baby Mario"
if %errorlevel% == 8 set "char=07" && set "char_name=Luigi"
if %errorlevel% == 9 set "char=08" && set "char_name=Toad"
if %errorlevel% == 10 set "char=09" && set "char_name=Donkey Kong"
if %errorlevel% == 11 set "char=0A" && set "char_name=Yoshi"
if %errorlevel% == 12 set "char=0B" && set "char_name=Wario"
if %errorlevel% == 13 set "char=0C" && set "char_name=Baby Luigi"
if %errorlevel% == 14 set "char=0D" && set "char_name=Toadette"
if %errorlevel% == 15 set "char=0E" && set "char_name=Koopa Troopa"
if %errorlevel% == 16 set "char=0F" && set "char_name=Daisy"
if %errorlevel% == 17 set "char=10" && set "char_name=Peach"
if %errorlevel% == 18 set "char=11" && set "char_name=Birdo"
if %errorlevel% == 19 set "char=12" && set "char_name=Diddy Kong"
if %errorlevel% == 20 set "char=13" && set "char_name=King Boo"
if %errorlevel% == 21 set "char=14" && set "char_name=Bowser Jr."
if %errorlevel% == 22 set "char=15" && set "char_name=Dry Bowser"
if %errorlevel% == 23 set "char=16" && set "char_name=Funky Kong"
if %errorlevel% == 24 set "char=17" && set "char_name=Rosalina"
if %errorlevel% == 25 goto scene_mii_all
if %errorlevel% == 26 goto scene_others
goto scene_select_vehicles_all

:scene_select_vehicles_all
cls
echo.
echo    Now all CPU opponents play as %char_name%, select a vehicle for the opponents to use:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
if "%char%" == "01" goto scene_select_vehicles_s_all
if "%char%" == "04" goto scene_select_vehicles_s_all
if "%char%" == "05" goto scene_select_vehicles_s_all
if "%char%" == "06" goto scene_select_vehicles_s_all
if "%char%" == "08" goto scene_select_vehicles_s_all
if "%char%" == "0C" goto scene_select_vehicles_s_all
if "%char%" == "0D" goto scene_select_vehicles_s_all
if "%char%" == "0E" goto scene_select_vehicles_s_all
if "%char%" == "00" goto scene_select_vehicles_m_all
if "%char%" == "07" goto scene_select_vehicles_m_all
if "%char%" == "0A" goto scene_select_vehicles_m_all
if "%char%" == "0F" goto scene_select_vehicles_m_all
if "%char%" == "10" goto scene_select_vehicles_m_all
if "%char%" == "11" goto scene_select_vehicles_m_all
if "%char%" == "12" goto scene_select_vehicles_m_all
if "%char%" == "14" goto scene_select_vehicles_m_all
if "%char%" == "02" goto scene_select_vehicles_l_all
if "%char%" == "03" goto scene_select_vehicles_l_all
if "%char%" == "09" goto scene_select_vehicles_l_all
if "%char%" == "0B" goto scene_select_vehicles_l_all
if "%char%" == "13" goto scene_select_vehicles_l_all
if "%char%" == "15" goto scene_select_vehicles_l_all
if "%char%" == "16" goto scene_select_vehicles_l_all
if "%char%" == "17" goto scene_select_vehicles_l_all
goto scene_select_vehicles_all

:scene_mii_all
cls
echo.
echo    Now all CPU opponents play as Mii, select their gender:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Male" "   Female" " < Back a step"
if %errorlevel% == 1 set "mii_gen=M" && set "mii_gen_name=male" && set "mii_gen_name_2=Male"
if %errorlevel% == 2 set "mii_gen=F" && set "mii_gen_name=female" && set "mii_gen_name_2=Female"
if %errorlevel% == 3 goto scene_set_all
goto scene_mii_all_2

:scene_mii_all_2
cls
echo.
echo    Now all CPU opponents play as %mii_gen_name% Mii, select their outfit:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Outfit A" "   Outfit B" "   Outfit C" " < Back a step"
if %errorlevel% == 1 set "mii_outfit=A"
if %errorlevel% == 2 set "mii_outfit=B"
if %errorlevel% == 3 set "mii_outfit=C"
if %errorlevel% == 4 goto scene_mii_all
goto scene_mii_all_3

:scene_mii_all_3
cls
echo.
echo    Now all CPU opponents play as %mii_gen_name% Mii and wear outfit %mii_outfit%, select their size:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Small" "   Medium" "   Large" " < Back a step"
if %errorlevel% == 1 set "mii_size=S" && set "mii_size_name=small"
if %errorlevel% == 2 set "mii_size=M" && set "mii_size_name=medium"
if %errorlevel% == 3 set "mii_size=L" && set "mii_size_name=large"
if %errorlevel% == 4 goto scene_mii_all_2
call :system_mii_process
goto scene_mii_all_4

:: I'm a superior version of my inferior self
:: Does that make me better or worse? I don't even know
:scene_mii_all_4
cls
echo.
echo    Now all CPU opponents play as %mii_size_name% %mii_gen_name% Mii and wears outfit %mii_outfit%, select their vehicle:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
if "%mii_size%" == "S" call :scene_select_vehicles_s_mii_all
if "%mii_size%" == "M" call :scene_select_vehicles_m_mii_all
if "%mii_size%" == "L" call :scene_select_vehicles_l_mii_all
goto scene_mii_all_3

:scene_select_vehicles_s_all
echo    [Small Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart S" "   Booster Seat" "   Mini Beast" "   Cheep Charger" "   Tiny Titan" "   Blue Falcon" "   Standard Bike S" "   Bullet Bike" "   Bit Bike" "   Quacker" "   Magikruiser" "   Jet Bubble" " < Back a step"
if %errorlevel% == 1 set "veh=00" && set "veh_name=Standard Kart S"
if %errorlevel% == 2 set "veh=03" && set "veh_name=Booster Seat"
if %errorlevel% == 3 set "veh=06" && set "veh_name=Mini Beast"
if %errorlevel% == 4 set "veh=09" && set "veh_name=Cheep Charger"
if %errorlevel% == 5 set "veh=0C" && set "veh_name=Tiny Titan"
if %errorlevel% == 6 set "veh=0F" && set "veh_name=Blue Falcon"
if %errorlevel% == 7 set "veh=12" && set "veh_name=Standard Bike S"
if %errorlevel% == 8 set "veh=15" && set "veh_name=Bullet Bike"
if %errorlevel% == 9 set "veh=18" && set "veh_name=Bit Bike"
if %errorlevel% == 10 set "veh=1B" && set "veh_name=Quacker"
if %errorlevel% == 11 set "veh=1E" && set "veh_name=Magikruiser"
if %errorlevel% == 12 set "veh=21" && set "veh_name=Jet Bubble"
if %errorlevel% == 13 goto scene_set_all
for /l %%a in (1, 1, 11) do (
    set "veh%%a=%veh%"
	set "veh%%a_name=%veh_name%"
	set "char%%a=%char%"
	set "char%%a_name=%char_name%"
)
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:scene_select_vehicles_s_mii_all
echo    [Small Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart S" "   Booster Seat" "   Mini Beast" "   Cheep Charger" "   Tiny Titan" "   Blue Falcon" "   Standard Bike S" "   Bullet Bike" "   Bit Bike" "   Quacker" "   Magikruiser" "   Jet Bubble" " < Back a step"
if %errorlevel% == 1 set "veh=00" && set "veh_name=Standard Kart S"
if %errorlevel% == 2 set "veh=03" && set "veh_name=Booster Seat"
if %errorlevel% == 3 set "veh=06" && set "veh_name=Mini Beast"
if %errorlevel% == 4 set "veh=09" && set "veh_name=Cheep Charger"
if %errorlevel% == 5 set "veh=0C" && set "veh_name=Tiny Titan"
if %errorlevel% == 6 set "veh=0F" && set "veh_name=Blue Falcon"
if %errorlevel% == 7 set "veh=12" && set "veh_name=Standard Bike S"
if %errorlevel% == 8 set "veh=15" && set "veh_name=Bullet Bike"
if %errorlevel% == 9 set "veh=18" && set "veh_name=Bit Bike"
if %errorlevel% == 10 set "veh=1B" && set "veh_name=Quacker"
if %errorlevel% == 11 set "veh=1E" && set "veh_name=Magikruiser"
if %errorlevel% == 12 set "veh=21" && set "veh_name=Jet Bubble"
if %errorlevel% == 13 goto scene_mii_all_3
for /l %%a in (1, 1, 11) do (
    set "veh%%a=%veh%"
	set "veh%%a_name=%veh_name%"
	set "char%%a=%char%"
	set "char%%a_name=%mii_gen_name_2% Mii, outfit %mii_outfit%, small size"
)
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:scene_select_vehicles_m_all
echo    [Medium Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart M" "   Classic Dragster" "   Wild Wing" "   Super Blooper" "   Daytripper" "   Sprinter" "   Standard Bike M" "   Mach Bike" "   Sugarscoot" "   Zip Zip" "   Sneakster" "   Dolphin Dasher" " < Back a step"
if %errorlevel% == 1 set "veh=01" && set "veh_name=Standard Kart M"
if %errorlevel% == 2 set "veh=04" && set "veh_name=Classic Dragster"
if %errorlevel% == 3 set "veh=07" && set "veh_name=Wild Wing"
if %errorlevel% == 4 set "veh=0A" && set "veh_name=Super Blooper"
if %errorlevel% == 5 set "veh=0D" && set "veh_name=Daytripper"
if %errorlevel% == 6 set "veh=10" && set "veh_name=Sprinter"
if %errorlevel% == 7 set "veh=13" && set "veh_name=Standard Bike M"
if %errorlevel% == 8 set "veh=16" && set "veh_name=Mach Bike"
if %errorlevel% == 9 set "veh=19" && set "veh_name=Sugarscoot"
if %errorlevel% == 10 set "veh=1C" && set "veh_name=Zip Zip"
if %errorlevel% == 11 set "veh=1F" && set "veh_name=Sneakster"
if %errorlevel% == 12 set "veh=22" && set "veh_name=Dolphin Dasher"
if %errorlevel% == 13 goto scene_set_all
for /l %%a in (1, 1, 11) do (
    set "veh%%a=%veh%"
	set "veh%%a_name=%veh_name%"
	set "char%%a=%char%"
	set "char%%a_name=%char_name%"
)
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:: "Peter, the horse is here."
:scene_select_vehicles_m_mii_all
echo    [Medium Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart M" "   Classic Dragster" "   Wild Wing" "   Super Blooper" "   Daytripper" "   Sprinter" "   Standard Bike M" "   Mach Bike" "   Sugarscoot" "   Zip Zip" "   Sneakster" "   Dolphin Dasher" " < Back a step"
if %errorlevel% == 1 set "veh=01" && set "veh_name=Standard Kart M"
if %errorlevel% == 2 set "veh=04" && set "veh_name=Classic Dragster"
if %errorlevel% == 3 set "veh=07" && set "veh_name=Wild Wing"
if %errorlevel% == 4 set "veh=0A" && set "veh_name=Super Blooper"
if %errorlevel% == 5 set "veh=0D" && set "veh_name=Daytripper"
if %errorlevel% == 6 set "veh=10" && set "veh_name=Sprinter"
if %errorlevel% == 7 set "veh=13" && set "veh_name=Standard Bike M"
if %errorlevel% == 8 set "veh=16" && set "veh_name=Mach Bike"
if %errorlevel% == 9 set "veh=19" && set "veh_name=Sugarscoot"
if %errorlevel% == 10 set "veh=1C" && set "veh_name=Zip Zip"
if %errorlevel% == 11 set "veh=1F" && set "veh_name=Sneakster"
if %errorlevel% == 12 set "veh=22" && set "veh_name=Dolphin Dasher"
if %errorlevel% == 13 goto scene_mii_all_3
for /l %%a in (1, 1, 11) do (
    set "veh%%a=%veh%"
	set "veh%%a_name=%veh_name%"
	set "char%%a=%char%"
	set "char%%a_name=%mii_gen_name_2% Mii, outfit %mii_outfit%, medium size"
)
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:scene_select_vehicles_l_all
echo    [Large Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart L" "   Offroader" "   Flame Flyer" "   Piranha Prowler" "   Jetsetter" "   Honeycoupe" "   Standard Bike L" "   Flame Runner" "   Wario Bike" "   Shooting Star" "   Spear" "   Phantom" " < Back a step"
if %errorlevel% == 1 set "veh=02" && set "veh_name=Standard Kart L"
if %errorlevel% == 2 set "veh=05" && set "veh_name=Offroader"
if %errorlevel% == 3 set "veh=08" && set "veh_name=Flame Flyer"
if %errorlevel% == 4 set "veh=0B" && set "veh_name=Piranha Prowler"
if %errorlevel% == 5 set "veh=0E" && set "veh_name=Jetsetter"
if %errorlevel% == 6 set "veh=11" && set "veh_name=Honeycoupe"
if %errorlevel% == 7 set "veh=14" && set "veh_name=Standard Bike L"
if %errorlevel% == 8 set "veh=17" && set "veh_name=Flame Runner"
if %errorlevel% == 9 set "veh=1A" && set "veh_name=Wario Bike"
if %errorlevel% == 10 set "veh=1D" && set "veh_name=Shooting Star"
if %errorlevel% == 11 set "veh=20" && set "veh_name=Spear"
if %errorlevel% == 12 set "veh=23" && set "veh_name=Phantom"
if %errorlevel% == 13 goto scene_set_all
for /l %%a in (1, 1, 11) do (
    set "veh%%a=%veh%"
	set "veh%%a_name=%veh_name%"
	set "char%%a=%char%"
	set "char%%a_name=%char_name%"
)
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:scene_select_vehicles_l_mii_all
echo    [Large Vehicles]
echo.
cmdmenusel %bg_color%%hl_color% "   Standard Kart L" "   Offroader" "   Flame Flyer" "   Piranha Prowler" "   Jetsetter" "   Honeycoupe" "   Standard Bike L" "   Flame Runner" "   Wario Bike" "   Shooting Star" "   Spear" "   Phantom" " < Back a step"
if %errorlevel% == 1 set "veh=02" && set "veh_name=Standard Kart L"
if %errorlevel% == 2 set "veh=05" && set "veh_name=Offroader"
if %errorlevel% == 3 set "veh=08" && set "veh_name=Flame Flyer"
if %errorlevel% == 4 set "veh=0B" && set "veh_name=Piranha Prowler"
if %errorlevel% == 5 set "veh=0E" && set "veh_name=Jetsetter"
if %errorlevel% == 6 set "veh=11" && set "veh_name=Honeycoupe"
if %errorlevel% == 7 set "veh=14" && set "veh_name=Standard Bike L"
if %errorlevel% == 8 set "veh=17" && set "veh_name=Flame Runner"
if %errorlevel% == 9 set "veh=1A" && set "veh_name=Wario Bike"
if %errorlevel% == 10 set "veh=1D" && set "veh_name=Shooting Star"
if %errorlevel% == 11 set "veh=20" && set "veh_name=Spear"
if %errorlevel% == 12 set "veh=23" && set "veh_name=Phantom"
if %errorlevel% == 13 goto scene_mii_all_3
for /l %%a in (1, 1, 11) do (
    set "veh%%a=%veh%"
	set "veh%%a_name=%veh_name%"
	set "char%%a=%char%"
	set "char%%a_name=%mii_gen_name_2% Mii, outfit %mii_outfit%, large size"
)
call :system_saveSelectDatatoTMP
goto scene_select_opponent

:endoffile
:: This empty code block lets sub-processes to exit without closing the whole app
:: This area can be populated with cleanup commands produced by sub-processes if neccesary
:: But remember, do NOT add any redirect commands (except comments, 'cause why are you seeing this?) into here
:: And just for the fun of it, here's the 1653th line of this app's source code
