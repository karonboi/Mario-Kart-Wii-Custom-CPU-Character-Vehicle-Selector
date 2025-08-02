@echo off
set a=0
:: Las Vegas let's fucking gooooooooooo

:scene_randomizeWhat
cls
call C:\karonboi\KaronWizard\tmp\select_data.bat
@mode con lines=9 cols=92
echo.
echo    Randomize selections
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Single CPU player" "   All CPU players" " < Back"
if %errorlevel% == 1 goto scene_randomizeSingle
if %errorlevel% == 2 goto system_randomizeAll
if %errorlevel% == 3 goto endoffile
goto scene_randomizeWhat

:scene_randomizeSingle
cls
@mode con lines=18 cols=92
color %bg_color%
set "random_target=single"
echo.
echo    Select a CPU opponent to randomize its configs:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   CPU 1 [%char1_name%, %veh1_name%]" "   CPU 2 [%char2_name%, %veh2_name%]" "   CPU 3 [%char3_name%, %veh3_name%]" "   CPU 4 [%char4_name%, %veh4_name%]" "   CPU 5 [%char5_name%, %veh5_name%]" "   CPU 6 [%char6_name%, %veh6_name%]" "   CPU 7 [%char7_name%, %veh7_name%]" "   CPU 8 [%char8_name%, %veh8_name%]" "   CPU 9 [%char9_name%, %veh9_name%]" "   CPU 10 [%char10_name%, %veh10_name%]" "   CPU 11 [%char11_name%, %veh11_name%]" " < Back"
if %errorlevel% == 1 set opponent=1
if %errorlevel% == 2 set opponent=2
if %errorlevel% == 3 set opponent=3
if %errorlevel% == 4 set opponent=4
if %errorlevel% == 5 set opponent=5
if %errorlevel% == 6 set opponent=6
if %errorlevel% == 7 set opponent=7
if %errorlevel% == 8 set opponent=8
if %errorlevel% == 9 set opponent=9
if %errorlevel% == 10 set opponent=10
if %errorlevel% == 11 set opponent=11
if %errorlevel% == 12 goto scene_randomizeWhat
goto system_randomize_1

:system_randomizeAll
set "random_target=all"
call :system_randomize_1
set /a a=%a%+1
set "char%a%=%char%"
set "char%a%_name=%char_name%"
set "veh%a%=%veh%"
set "veh%a%_name=%veh_name%"
if %a% gtr 10 goto scene_randomizeAll_confirm
goto system_randomizeAll

:system_randomize_1
:: Stage 1: Pick a character
set /a i=(%random%*24)/32768
if %i% == 0 goto system_randomize_1
if %i% == 1 set "char=00" && set "char_name=Mario"
if %i% == 2 set "char=01" && set "char_name=Baby Peach"
if %i% == 3 set "char=02" && set "char_name=Waluigi"
if %i% == 4 set "char=03" && set "char_name=Bowser"
if %i% == 5 set "char=04" && set "char_name=Baby Daisy"
if %i% == 6 set "char=05" && set "char_name=Dry Bones"
if %i% == 7 set "char=06" && set "char_name=Baby Mario"
if %i% == 8 set "char=07" && set "char_name=Luigi"
if %i% == 9 set "char=08" && set "char_name=Toad"
if %i% == 10 set "char=09" && set "char_name=Donkey Kong"
if %i% == 11 set "char=0A" && set "char_name=Yoshi"
if %i% == 12 set "char=0B" && set "char_name=Wario"
if %i% == 13 set "char=0C" && set "char_name=Baby Luigi"
if %i% == 14 set "char=0D" && set "char_name=Toadette"
if %i% == 15 set "char=0E" && set "char_name=Koopa Troopa"
if %i% == 16 set "char=0F" && set "char_name=Daisy"
if %i% == 17 set "char=10" && set "char_name=Peach"
if %i% == 18 set "char=11" && set "char_name=Birdo"
if %i% == 19 set "char=12" && set "char_name=Diddy Kong"
if %i% == 20 set "char=13" && set "char_name=King Boo"
if %i% == 21 set "char=14" && set "char_name=Bowser Jr."
if %i% == 22 set "char=15" && set "char_name=Dry Bowser"
if %i% == 23 set "char=16" && set "char_name=Funky Kong"
if %i% == 24 set "char=17" && set "char_name=Rosalina"
rem Stage 2: Check the selected character's size
if "%char%" == "01" goto system_randomize_2_s
if "%char%" == "04" goto system_randomize_2_s
if "%char%" == "05" goto system_randomize_2_s
if "%char%" == "06" goto system_randomize_2_s
if "%char%" == "08" goto system_randomize_2_s
if "%char%" == "0C" goto system_randomize_2_s
if "%char%" == "0D" goto system_randomize_2_s
if "%char%" == "0E" goto system_randomize_2_s
if "%char%" == "00" goto system_randomize_2_m
if "%char%" == "07" goto system_randomize_2_m
if "%char%" == "0A" goto system_randomize_2_m
if "%char%" == "0F" goto system_randomize_2_m
if "%char%" == "10" goto system_randomize_2_m
if "%char%" == "11" goto system_randomize_2_m
if "%char%" == "12" goto system_randomize_2_m
if "%char%" == "14" goto system_randomize_2_m
if "%char%" == "02" goto system_randomize_2_l
if "%char%" == "03" goto system_randomize_2_l
if "%char%" == "09" goto system_randomize_2_l
if "%char%" == "0B" goto system_randomize_2_l
if "%char%" == "13" goto system_randomize_2_l
if "%char%" == "15" goto system_randomize_2_l
if "%char%" == "16" goto system_randomize_2_l
if "%char%" == "17" goto system_randomize_2_l
goto system_randomize_1

:system_randomize_2_s
:: Stage 2.1: Select a small-size vehicle
set /a i=(%random%*12)/32768
if %i% == 0 goto system_randomize_2_s
if %i% == 1 set "veh=00" && set "veh_name=Standard Kart S"
if %i% == 2 set "veh=03" && set "veh_name=Booster Seat"
if %i% == 3 set "veh=06" && set "veh_name=Mini Beast"
if %i% == 4 set "veh=09" && set "veh_name=Cheep Charger"
if %i% == 5 set "veh=0C" && set "veh_name=Tiny Titan"
if %i% == 6 set "veh=0F" && set "veh_name=Blue Falcon"
if %i% == 7 set "veh=12" && set "veh_name=Standard Bike S"
if %i% == 8 set "veh=15" && set "veh_name=Bullet Bike"
if %i% == 9 set "veh=18" && set "veh_name=Bit Bike"
if %i% == 10 set "veh=1B" && set "veh_name=Quacker"
if %i% == 11 set "veh=1E" && set "veh_name=Magikruiser"
if %i% == 12 set "veh=21" && set "veh_name=Jet Bubble"
if "%random_target%" == "single" goto scene_randomizeSingle_confirm
if "%random_target%" == "all" goto endoffile
goto system_randomize_2_s

:system_randomize_2_m
:: Stage 2.2: Select a medium-size vehicle
set /a i=(%random%*12)/32768
if %i% == 0 goto system_randomize_2_m
if %i% == 1 set "veh=01" && set "veh_name=Standard Kart M"
if %i% == 2 set "veh=04" && set "veh_name=Classic Dragster"
if %i% == 3 set "veh=07" && set "veh_name=Wild Wing"
if %i% == 4 set "veh=0A" && set "veh_name=Super Blooper"
if %i% == 5 set "veh=0D" && set "veh_name=Daytripper"
if %i% == 6 set "veh=10" && set "veh_name=Sprinter"
if %i% == 7 set "veh=13" && set "veh_name=Standard Bike M"
if %i% == 8 set "veh=16" && set "veh_name=Mach Bike"
if %i% == 9 set "veh=19" && set "veh_name=Sugarscoot"
if %i% == 10 set "veh=1C" && set "veh_name=Zip Zip"
if %i% == 11 set "veh=1F" && set "veh_name=Sneakster"
if %i% == 12 set "veh=22" && set "veh_name=Dolphin Dasher"
if "%random_target%" == "single" goto scene_randomizeSingle_confirm
if "%random_target%" == "all" goto endoffile
goto system_randomize_2_m

:system_randomize_2_l
:: Stage 2.3: Select a large-size vehicle
set /a i=(%random%*12)/32768
if %i% == 0 goto system_randomize_2_l
if %i% == 1 set "veh=02" && set "veh_name=Standard Kart L"
if %i% == 2 set "veh=05" && set "veh_name=Offroader"
if %i% == 3 set "veh=08" && set "veh_name=Flame Flyer"
if %i% == 4 set "veh=0B" && set "veh_name=Piranha Prowler"
if %i% == 5 set "veh=0E" && set "veh_name=Jetsetter"
if %i% == 6 set "veh=11" && set "veh_name=Honeycoupe"
if %i% == 7 set "veh=14" && set "veh_name=Standard Bike L"
if %i% == 8 set "veh=17" && set "veh_name=Flame Runner"
if %i% == 9 set "veh=1A" && set "veh_name=Wario Bike"
if %i% == 10 set "veh=1D" && set "veh_name=Shooting Star"
if %i% == 11 set "veh=20" && set "veh_name=Spear"
if %i% == 12 set "veh=23" && set "veh_name=Phantom"
if "%random_target%" == "single" goto scene_randomizeSingle_confirm
if "%random_target%" == "all" goto endoffile
goto system_randomize_2_l

:scene_randomizeSingle_confirm
cls
echo.
echo    Is this config okay for you?
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    CPU %opponent% [%char_name%, %veh_name%]
echo.
cmdmenusel %bg_color%%hl_color% "   Yes" "   Randomize again" "   Cancel"
if %errorlevel% == 1 (
	set "char%opponent%=%char%"
	set "char%opponent%_name=%char_name%"
	set "veh%opponent%=%veh%"
	set "veh%opponent%_name=%veh_name%"
	goto endoffile
)
if %errorlevel% == 2 goto system_randomize_1
if %errorlevel% == 3 goto scene_randomizeWhat
goto scene_randomizeWhat

:scene_randomizeAll_confirm
cls
@mode con lines=21 cols=92
color %bg_color%
echo.
echo    Are these configs okay for you?
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    CPU 1 [%char1_name%, %veh1_name%]
echo    CPU 2 [%char2_name%, %veh2_name%]
echo    CPU 3 [%char3_name%, %veh3_name%]
echo    CPU 4 [%char4_name%, %veh4_name%]
echo    CPU 5 [%char5_name%, %veh5_name%]
echo    CPU 6 [%char6_name%, %veh6_name%]
echo    CPU 7 [%char7_name%, %veh7_name%]
echo    CPU 8 [%char8_name%, %veh8_name%]
echo    CPU 9 [%char9_name%, %veh9_name%]
echo    CPU 10 [%char10_name%, %veh10_name%]
echo    CPU 11 [%char11_name%, %veh11_name%]
echo.
cmdmenusel %bg_color%%hl_color% "   Yes" "   Randomize again" "   Cancel"
if %errorlevel% == 1 goto endoffile
if %errorlevel% == 2 set a=0 & goto system_randomizeAll
if %errorlevel% == 3 set a=0 & goto scene_randomizeWhat
goto scene_randomizeWhat

:endoffile