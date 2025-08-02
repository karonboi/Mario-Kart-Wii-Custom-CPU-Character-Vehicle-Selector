@echo off

:system_checkResetProtocol
if %reset_protocol% == 1 goto system_resetSlots
if %reset_protocol% == 0 goto system_checkSlots
goto system_checkResetProtocol

:system_checkSlots
if not exist "C:\karonboi\KaronWizard\saved_selections" (
	mkdir "C:\karonboi\KaronWizard\saved_selections" > nul
	call :system_createSlots
	goto endoffile
) else goto system_createSlots
goto system_checkSlots
	

:system_resetSlots
for /l %%a in (1, 1, 100) do (
	set slot_num=%%a
	del "C:\karonboi\KaronWizard\saved_selections\%slot_num%.slt" > nul
)
goto endoffile

:system_createSlots
for /l %%a in (1, 1, 100) do (
	set slot_num=%%a
	if not exist "C:\karonboi\KaronWizard\saved_selections\%slot_num%.slt" call :system_addSlot
)
goto endoffile

:system_addSlot
(
	echo @echo off
	echo set "slot_name=(none)"
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
) > "C:\karonboi\KaronWizard\saved_selections"\%slot_num%.slt"
goto endoffile

:endoffile
:: I'm a weiner
:: weeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee