@echo off
@mode con lines=19 cols=92
set overwrite=0
set isDataCopied=0

:scene_slotSelect_1
set slot_page=1
cls
echo.
echo    Select a slot to save the selections: [1/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 1 [%slot1_name%]" "    Slot 2 [%slot2_name%]" "    Slot 3 [%slot3_name%]" "    Slot 4 [%slot4_name%]" "    Slot 5 [%slot5_name%]" "    Slot 6 [%slot6_name%]" "    Slot 7 [%slot7_name%]" "    Slot 8 [%slot8_name%]" "    Slot 9 [%slot9_name%]" "    Slot 10 [%slot10_name%]" " -> Next page" " -- -------- ----" " <  Back"
if %errorlevel% == 12 goto scene_slotSelect_1
if %errorlevel% == 11 goto scene_slotSelect_2
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set slot_num=%errorlevel%
goto scene_nameSlot

:scene_slotSelect_2
set slot_page=2
cls
echo.
echo    Select a slot to save the selections: [2/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 11 [%slot11_name%]" "    Slot 12 [%slot12_name%]" "    Slot 13 [%slot13_name%]" "    Slot 14 [%slot14_name%]" "    Slot 15 [%slot15_name%]" "    Slot 16 [%slot16_name%]" "    Slot 17 [%slot17_name%]" "    Slot 18 [%slot18_name%]" "    Slot 19 [%slot19_name%]" "    Slot 20 [%slot20_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_3
if %errorlevel% == 12 goto scene_slotSelect_1
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+10
goto scene_nameSlot

:scene_slotSelect_3
set slot_page=3
cls
echo.
echo    Select a slot to save the selections: [3/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 21 [%slot21_name%]" "    Slot 22 [%slot22_name%]" "    Slot 23 [%slot23_name%]" "    Slot 24 [%slot24_name%]" "    Slot 25 [%slot25_name%]" "    Slot 26 [%slot26_name%]" "    Slot 27 [%slot27_name%]" "    Slot 28 [%slot28_name%]" "    Slot 29 [%slot29_name%]" "    Slot 30 [%slot30_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_4
if %errorlevel% == 12 goto scene_slotSelect_2
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+20
goto scene_nameSlot

:scene_slotSelect_4
set slot_page=4
cls
echo.
echo    Select a slot to save the selections: [4/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 31 [%slot31_name%]" "    Slot 32 [%slot32_name%]" "    Slot 33 [%slot33_name%]" "    Slot 34 [%slot34_name%]" "    Slot 35 [%slot35_name%]" "    Slot 36 [%slot36_name%]" "    Slot 37 [%slot37_name%]" "    Slot 38 [%slot38_name%]" "    Slot 39 [%slot39_name%]" "    Slot 40 [%slot40_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_5
if %errorlevel% == 12 goto scene_slotSelect_3
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+30
goto scene_nameSlot

:scene_slotSelect_5
set slot_page=5
cls
echo.
echo    Select a slot to save the selections: [5/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 41 [%slot41_name%]" "    Slot 42 [%slot42_name%]" "    Slot 43 [%slot43_name%]" "    Slot 44 [%slot44_name%]" "    Slot 45 [%slot45_name%]" "    Slot 46 [%slot46_name%]" "    Slot 47 [%slot47_name%]" "    Slot 48 [%slot48_name%]" "    Slot 49 [%slot49_name%]" "    Slot 50 [%slot50_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_6
if %errorlevel% == 12 goto scene_slotSelect_4
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+40
goto scene_nameSlot

:scene_slotSelect_6
set slot_page=6
cls
echo.
echo    Select a slot to save the selections: [6/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 51 [%slot51_name%]" "    Slot 52 [%slot52_name%]" "    Slot 53 [%slot53_name%]" "    Slot 54 [%slot54_name%]" "    Slot 55 [%slot55_name%]" "    Slot 56 [%slot56_name%]" "    Slot 57 [%slot57_name%]" "    Slot 58 [%slot58_name%]" "    Slot 59 [%slot59_name%]" "    Slot 60 [%slot60_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_7
if %errorlevel% == 12 goto scene_slotSelect_5
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+50
goto scene_nameSlot

:scene_slotSelect_7
set slot_page=7
cls
echo.
echo    Select a slot to save the selections: [7/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 61 [%slot61_name%]" "    Slot 62 [%slot62_name%]" "    Slot 63 [%slot63_name%]" "    Slot 64 [%slot64_name%]" "    Slot 65 [%slot65_name%]" "    Slot 66 [%slot66_name%]" "    Slot 67 [%slot67_name%]" "    Slot 68 [%slot68_name%]" "    Slot 69 [%slot69_name%]" "    Slot 70 [%slot70_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_8
if %errorlevel% == 12 goto scene_slotSelect_6
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+60
goto scene_nameSlot

:scene_slotSelect_8
set slot_page=8
cls
echo.
echo    Select a slot to save the selections: [8/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 71 [%slot71_name%]" "    Slot 72 [%slot72_name%]" "    Slot 73 [%slot73_name%]" "    Slot 74 [%slot74_name%]" "    Slot 75 [%slot75_name%]" "    Slot 76 [%slot76_name%]" "    Slot 77 [%slot77_name%]" "    Slot 78 [%slot78_name%]" "    Slot 79 [%slot79_name%]" "    Slot 80 [%slot80_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_9
if %errorlevel% == 12 goto scene_slotSelect_7
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+70
goto scene_nameSlot

:scene_slotSelect_9
set slot_page=9
cls
echo.
echo    Select a slot to save the selections: [9/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 81 [%slot81_name%]" "    Slot 82 [%slot82_name%]" "    Slot 83 [%slot83_name%]" "    Slot 84 [%slot84_name%]" "    Slot 85 [%slot85_name%]" "    Slot 86 [%slot86_name%]" "    Slot 87 [%slot87_name%]" "    Slot 88 [%slot88_name%]" "    Slot 89 [%slot89_name%]" "    Slot 90 [%slot90_name%]" " -> Next page" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_10
if %errorlevel% == 12 goto scene_slotSelect_8
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+80
goto scene_nameSlot

:scene_slotSelect_10
set slot_page=10
cls
echo.
echo    Select a slot to save the selections: [10/10]
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "    Slot 91 [%slot91_name%]" "    Slot 92 [%slot92_name%]" "    Slot 93 [%slot93_name%]" "    Slot 94 [%slot94_name%]" "    Slot 95 [%slot95_name%]" "    Slot 96 [%slot96_name%]" "    Slot 97 [%slot97_name%]" "    Slot 98 [%slot98_name%]" "    Slot 99 [%slot99_name%]" "    Slot 100 [%slot100_name%]" " --  ---- ----" " <- Previous page" " <  Back"
if %errorlevel% == 11 goto scene_slotSelect_10
if %errorlevel% == 12 goto scene_slotSelect_9
if %errorlevel% == 13 call C:\karonboi\KaronWizard\tmp\select_data.bat & goto endoffile
set /a slot_num=%errorlevel%+90
goto scene_nameSlot
 
:system_readSlot
if %slot_num% == %slottoLoad% goto scene_cannotSaveonLoadSlot
copy "C:\karonboi\KaronWizard\saved_selections\%slot_num%.slt" "C:\karonboi\KaronWizard\tmp\save_slt.bat" > nul
call C:\karonboi\KaronWizard\tmp\save_slt.bat
del C:\karonboi\KaronWizard\tmp\save_slt.bat > nul
set slot_name_old=%slot_name%
if %subfunction% == 1 (
	call C:\karonboi\KaronWizard\saved_selections\%slot_num_to_copy%.slt
	set slot_name_new=%slot_name%
)
if not "%slot_name_old%" == "(none)" goto scene_askOverwrite
goto system_saveSlot

:scene_askOverwrite
cls
echo.
echo    Overwrite slot %slot_num%?
echo    	from "%slot_name_old%"
echo    	to "%slot_name_new%"
echo    Once done, the overwritten data cannot be recovered, so be careful^^!
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   Overwrite" "   Cancel"
if %errorlevel% == 1 set overwrite=1 && goto system_saveSlot
if %errorlevel% == 2 goto scene_slotSelect_%slot_page%
goto scene_slotSelect_%slot_page%

:scene_cannotSaveonLoadSlot
cls
echo.
echo    Cannot save on slot %slot_num% as it is being used to load data to workspace later on.
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   OK"
goto scene_slotSelect_%slot_page%

:scene_nameSlot
if %slot_num% == %slottoLoad% goto scene_cannotSaveonLoadSlot
if %subfunction% == 1 goto scene_readSlot
set "slot_name="
cls
echo.
echo    Name the slot %slot_num%:
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
echo    Type "-cancel" to go back. 50 characters maximum
echo.
set /p "slot_name_new="
if "%slot_name_new%" == "-cancel" goto scene_slotSelect_%slot_page%
if "%slot_name_new%" == "(none)" goto scene_nameNotAllowed
cmdwiz stringlen "%slot_name_new%"
if %errorlevel% gtr 50 (
	echo.
	echo    The slot's name has exceeded the maximum characters.
	pause > nul
	goto scene_nameSlot
)
goto system_readSlot

:scene_nameNotAllowed
echo.
echo    That slot's name is not allowed. Please try something else.
pause > nul
goto scene_nameSlot

:system_saveSlot
if %subfunction% == 1 goto system_saveSlot_copy
call C:\karonboi\KaronWizard\tmp\select_data.bat
(
	echo @echo off
	echo set "slot_name=%slot_name_new%"
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
) > "C:\karonboi\KaronWizard\saved_selections"\%slot_num%.slt"
goto scene_saveSlot_done

:system_saveSlot_copy
call C:\karonboi\KaronWizard\saved_selections\%slot_num_to_copy%.slt
set "slot_name_new=%slot_name%"
set slot_num_to_receiveCopy=%slot_num%
(
	echo @echo off
	echo set "slot_name=%slot_name_new%"
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
) > "C:\karonboi\KaronWizard\saved_selections"\%slot_num_to_receiveCopy%.slt"
goto scene_saveSlot_done

:scene_saveSlot_done
cls
echo.
echo    Slot %slot_num% is saved as:
echo    "%slot_name_new%".
echo.
echo ════════════════════════════════════════════════════════════════════════════════════════════
echo.
cmdmenusel %bg_color%%hl_color% "   OK"
copy "C:\karonboi\KaronWizard\saved_selections\%slot_num%.slt" "C:\karonboi\KaronWizard\tmp\save_slt.bat" > nul
call C:\karonboi\KaronWizard\tmp\save_slt.bat
set slot%slot_num%_name=%slot_name%
del C:\karonboi\KaronWizard\tmp\save_slt.bat
set /a free_slot=%free_slot%-1
set "data_%slot_num%=█"
set overwrite=0
set isDataCopied=1
goto scene_slotSelect_%slot_page%

:endoffile
:: honk honk
call C:\karonboi\KaronWizard\tmp\select_data.bat