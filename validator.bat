@echo off
set isChar1Invalid=0
set isChar2Invalid=0
set isChar3Invalid=0
set isChar4Invalid=0
set isChar5Invalid=0
set isChar6Invalid=0
set isChar7Invalid=0
set isChar8Invalid=0
set isChar9Invalid=0
set isChar10Invalid=0
set isChar11Invalid=0
set isVeh1Invalid=1
set isVeh2Invalid=1
set isVeh3Invalid=1
set isVeh4Invalid=1
set isVeh5Invalid=1
set isVeh6Invalid=1
set isVeh7Invalid=1
set isVeh8Invalid=1
set isVeh9Invalid=1
set isVeh10Invalid=1
set isVeh11Invalid=1

:system_validate_stage1_part1
if "%char1%" == "01" goto system_validate_stage2s_part1
if "%char1%" == "04" goto system_validate_stage2s_part1
if "%char1%" == "05" goto system_validate_stage2s_part1
if "%char1%" == "06" goto system_validate_stage2s_part1
if "%char1%" == "08" goto system_validate_stage2s_part1
if "%char1%" == "0C" goto system_validate_stage2s_part1
if "%char1%" == "0D" goto system_validate_stage2s_part1
if "%char1%" == "0E" goto system_validate_stage2s_part1
if "%char1%" == "00" goto system_validate_stage2m_part1
if "%char1%" == "07" goto system_validate_stage2m_part1
if "%char1%" == "0A" goto system_validate_stage2m_part1
if "%char1%" == "0F" goto system_validate_stage2m_part1
if "%char1%" == "10" goto system_validate_stage2m_part1
if "%char1%" == "11" goto system_validate_stage2m_part1
if "%char1%" == "12" goto system_validate_stage2m_part1
if "%char1%" == "14" goto system_validate_stage2m_part1
if "%char1%" == "02" goto system_validate_stage2l_part1
if "%char1%" == "03" goto system_validate_stage2l_part1
if "%char1%" == "09" goto system_validate_stage2l_part1
if "%char1%" == "0B" goto system_validate_stage2l_part1
if "%char1%" == "13" goto system_validate_stage2l_part1
if "%char1%" == "15" goto system_validate_stage2l_part1
if "%char1%" == "16" goto system_validate_stage2l_part1
if "%char1%" == "17" goto system_validate_stage2l_part1
set isChar1Invalid=1
goto system_validate_stage1_part2

:system_validate_stage1_part2
if "%char2%" == "01" goto system_validate_stage2s_part2
if "%char2%" == "04" goto system_validate_stage2s_part2
if "%char2%" == "05" goto system_validate_stage2s_part2
if "%char2%" == "06" goto system_validate_stage2s_part2
if "%char2%" == "08" goto system_validate_stage2s_part2
if "%char2%" == "0C" goto system_validate_stage2s_part2
if "%char2%" == "0D" goto system_validate_stage2s_part2
if "%char2%" == "0E" goto system_validate_stage2s_part2
if "%char2%" == "00" goto system_validate_stage2m_part2
if "%char2%" == "07" goto system_validate_stage2m_part2
if "%char2%" == "0A" goto system_validate_stage2m_part2
if "%char2%" == "0F" goto system_validate_stage2m_part2
if "%char2%" == "10" goto system_validate_stage2m_part2
if "%char2%" == "11" goto system_validate_stage2m_part2
if "%char2%" == "12" goto system_validate_stage2m_part2
if "%char2%" == "14" goto system_validate_stage2m_part2
if "%char2%" == "02" goto system_validate_stage2l_part2
if "%char2%" == "03" goto system_validate_stage2l_part2
if "%char2%" == "09" goto system_validate_stage2l_part2
if "%char2%" == "0B" goto system_validate_stage2l_part2
if "%char2%" == "13" goto system_validate_stage2l_part2
if "%char2%" == "15" goto system_validate_stage2l_part2
if "%char2%" == "16" goto system_validate_stage2l_part2
if "%char2%" == "17" goto system_validate_stage2l_part2
set isChar2Invalid=1
goto system_validate_stage1_part3

:system_validate_stage1_part3
if "%char3%" == "01" goto system_validate_stage2s_part3
if "%char3%" == "04" goto system_validate_stage2s_part3
if "%char3%" == "05" goto system_validate_stage2s_part3
if "%char3%" == "06" goto system_validate_stage2s_part3
if "%char3%" == "08" goto system_validate_stage2s_part3
if "%char3%" == "0C" goto system_validate_stage2s_part3
if "%char3%" == "0D" goto system_validate_stage2s_part3
if "%char3%" == "0E" goto system_validate_stage2s_part3
if "%char3%" == "00" goto system_validate_stage2m_part3
if "%char3%" == "07" goto system_validate_stage2m_part3
if "%char3%" == "0A" goto system_validate_stage2m_part3
if "%char3%" == "0F" goto system_validate_stage2m_part3
if "%char3%" == "10" goto system_validate_stage2m_part3
if "%char3%" == "11" goto system_validate_stage2m_part3
if "%char3%" == "12" goto system_validate_stage2m_part3
if "%char3%" == "14" goto system_validate_stage2m_part3
if "%char3%" == "02" goto system_validate_stage2l_part3
if "%char3%" == "03" goto system_validate_stage2l_part3
if "%char3%" == "09" goto system_validate_stage2l_part3
if "%char3%" == "0B" goto system_validate_stage2l_part3
if "%char3%" == "13" goto system_validate_stage2l_part3
if "%char3%" == "15" goto system_validate_stage2l_part3
if "%char3%" == "16" goto system_validate_stage2l_part3
if "%char3%" == "17" goto system_validate_stage2l_part3
set isChar3Invalid=1
goto system_validate_stage1_part4

:system_validate_stage1_part4
if "%char4%" == "01" goto system_validate_stage2s_part4
if "%char4%" == "04" goto system_validate_stage2s_part4
if "%char4%" == "05" goto system_validate_stage2s_part4
if "%char4%" == "06" goto system_validate_stage2s_part4
if "%char4%" == "08" goto system_validate_stage2s_part4
if "%char4%" == "0C" goto system_validate_stage2s_part4
if "%char4%" == "0D" goto system_validate_stage2s_part4
if "%char4%" == "0E" goto system_validate_stage2s_part4
if "%char4%" == "00" goto system_validate_stage2m_part4
if "%char4%" == "07" goto system_validate_stage2m_part4
if "%char4%" == "0A" goto system_validate_stage2m_part4
if "%char4%" == "0F" goto system_validate_stage2m_part4
if "%char4%" == "10" goto system_validate_stage2m_part4
if "%char4%" == "11" goto system_validate_stage2m_part4
if "%char4%" == "12" goto system_validate_stage2m_part4
if "%char4%" == "14" goto system_validate_stage2m_part4
if "%char4%" == "02" goto system_validate_stage2l_part4
if "%char4%" == "03" goto system_validate_stage2l_part4
if "%char4%" == "09" goto system_validate_stage2l_part4
if "%char4%" == "0B" goto system_validate_stage2l_part4
if "%char4%" == "13" goto system_validate_stage2l_part4
if "%char4%" == "15" goto system_validate_stage2l_part4
if "%char4%" == "16" goto system_validate_stage2l_part4
if "%char4%" == "17" goto system_validate_stage2l_part4
set isChar4Invalid=1
goto system_validate_stage1_part5

:system_validate_stage1_part5
if "%char5%" == "01" goto system_validate_stage2s_part5
if "%char5%" == "04" goto system_validate_stage2s_part5
if "%char5%" == "05" goto system_validate_stage2s_part5
if "%char5%" == "06" goto system_validate_stage2s_part5
if "%char5%" == "08" goto system_validate_stage2s_part5
if "%char5%" == "0C" goto system_validate_stage2s_part5
if "%char5%" == "0D" goto system_validate_stage2s_part5
if "%char5%" == "0E" goto system_validate_stage2s_part5
if "%char5%" == "00" goto system_validate_stage2m_part5
if "%char5%" == "07" goto system_validate_stage2m_part5
if "%char5%" == "0A" goto system_validate_stage2m_part5
if "%char5%" == "0F" goto system_validate_stage2m_part5
if "%char5%" == "10" goto system_validate_stage2m_part5
if "%char5%" == "11" goto system_validate_stage2m_part5
if "%char5%" == "12" goto system_validate_stage2m_part5
if "%char5%" == "14" goto system_validate_stage2m_part5
if "%char5%" == "02" goto system_validate_stage2l_part5
if "%char5%" == "03" goto system_validate_stage2l_part5
if "%char5%" == "09" goto system_validate_stage2l_part5
if "%char5%" == "0B" goto system_validate_stage2l_part5
if "%char5%" == "13" goto system_validate_stage2l_part5
if "%char5%" == "15" goto system_validate_stage2l_part5
if "%char5%" == "16" goto system_validate_stage2l_part5
if "%char5%" == "17" goto system_validate_stage2l_part5
set isChar5Invalid=1
goto system_validate_stage1_part6

:system_validate_stage1_part6
if "%char6%" == "01" goto system_validate_stage2s_part6
if "%char6%" == "04" goto system_validate_stage2s_part6
if "%char6%" == "05" goto system_validate_stage2s_part6
if "%char6%" == "06" goto system_validate_stage2s_part6
if "%char6%" == "08" goto system_validate_stage2s_part6
if "%char6%" == "0C" goto system_validate_stage2s_part6
if "%char6%" == "0D" goto system_validate_stage2s_part6
if "%char6%" == "0E" goto system_validate_stage2s_part6
if "%char6%" == "00" goto system_validate_stage2m_part6
if "%char6%" == "07" goto system_validate_stage2m_part6
if "%char6%" == "0A" goto system_validate_stage2m_part6
if "%char6%" == "0F" goto system_validate_stage2m_part6
if "%char6%" == "10" goto system_validate_stage2m_part6
if "%char6%" == "11" goto system_validate_stage2m_part6
if "%char6%" == "12" goto system_validate_stage2m_part6
if "%char6%" == "14" goto system_validate_stage2m_part6
if "%char6%" == "02" goto system_validate_stage2l_part6
if "%char6%" == "03" goto system_validate_stage2l_part6
if "%char6%" == "09" goto system_validate_stage2l_part6
if "%char6%" == "0B" goto system_validate_stage2l_part6
if "%char6%" == "13" goto system_validate_stage2l_part6
if "%char6%" == "15" goto system_validate_stage2l_part6
if "%char6%" == "16" goto system_validate_stage2l_part6
if "%char6%" == "17" goto system_validate_stage2l_part6
set isChar6Invalid=1
goto system_validate_stage1_part7

:system_validate_stage1_part7
if "%char7%" == "01" goto system_validate_stage2s_part7
if "%char7%" == "04" goto system_validate_stage2s_part7
if "%char7%" == "05" goto system_validate_stage2s_part7
if "%char7%" == "06" goto system_validate_stage2s_part7
if "%char7%" == "08" goto system_validate_stage2s_part7
if "%char7%" == "0C" goto system_validate_stage2s_part7
if "%char7%" == "0D" goto system_validate_stage2s_part7
if "%char7%" == "0E" goto system_validate_stage2s_part7
if "%char7%" == "00" goto system_validate_stage2m_part7
if "%char7%" == "07" goto system_validate_stage2m_part7
if "%char7%" == "0A" goto system_validate_stage2m_part7
if "%char7%" == "0F" goto system_validate_stage2m_part7
if "%char7%" == "10" goto system_validate_stage2m_part7
if "%char7%" == "11" goto system_validate_stage2m_part7
if "%char7%" == "12" goto system_validate_stage2m_part7
if "%char7%" == "14" goto system_validate_stage2m_part7
if "%char7%" == "02" goto system_validate_stage2l_part7
if "%char7%" == "03" goto system_validate_stage2l_part7
if "%char7%" == "09" goto system_validate_stage2l_part7
if "%char7%" == "0B" goto system_validate_stage2l_part7
if "%char7%" == "13" goto system_validate_stage2l_part7
if "%char7%" == "15" goto system_validate_stage2l_part7
if "%char7%" == "16" goto system_validate_stage2l_part7
if "%char7%" == "17" goto system_validate_stage2l_part7
set isChar7Invalid=1
goto system_validate_stage1_part8

:system_validate_stage1_part8
if "%char8%" == "01" goto system_validate_stage2s_part8
if "%char8%" == "04" goto system_validate_stage2s_part8
if "%char8%" == "05" goto system_validate_stage2s_part8
if "%char8%" == "06" goto system_validate_stage2s_part8
if "%char8%" == "08" goto system_validate_stage2s_part8
if "%char8%" == "0C" goto system_validate_stage2s_part8
if "%char8%" == "0D" goto system_validate_stage2s_part8
if "%char8%" == "0E" goto system_validate_stage2s_part8
if "%char8%" == "00" goto system_validate_stage2m_part8
if "%char8%" == "07" goto system_validate_stage2m_part8
if "%char8%" == "0A" goto system_validate_stage2m_part8
if "%char8%" == "0F" goto system_validate_stage2m_part8
if "%char8%" == "10" goto system_validate_stage2m_part8
if "%char8%" == "11" goto system_validate_stage2m_part8
if "%char8%" == "12" goto system_validate_stage2m_part8
if "%char8%" == "14" goto system_validate_stage2m_part8
if "%char8%" == "02" goto system_validate_stage2l_part8
if "%char8%" == "03" goto system_validate_stage2l_part8
if "%char8%" == "09" goto system_validate_stage2l_part8
if "%char8%" == "0B" goto system_validate_stage2l_part8
if "%char8%" == "13" goto system_validate_stage2l_part8
if "%char8%" == "15" goto system_validate_stage2l_part8
if "%char8%" == "16" goto system_validate_stage2l_part8
if "%char8%" == "17" goto system_validate_stage2l_part8
set isChar8Invalid=1
goto system_validate_stage1_part9

:system_validate_stage1_part9
if "%char9%" == "01" goto system_validate_stage2s_part9
if "%char9%" == "04" goto system_validate_stage2s_part9
if "%char9%" == "05" goto system_validate_stage2s_part9
if "%char9%" == "06" goto system_validate_stage2s_part9
if "%char9%" == "08" goto system_validate_stage2s_part9
if "%char9%" == "0C" goto system_validate_stage2s_part9
if "%char9%" == "0D" goto system_validate_stage2s_part9
if "%char9%" == "0E" goto system_validate_stage2s_part9
if "%char9%" == "00" goto system_validate_stage2m_part9
if "%char9%" == "07" goto system_validate_stage2m_part9
if "%char9%" == "0A" goto system_validate_stage2m_part9
if "%char9%" == "0F" goto system_validate_stage2m_part9
if "%char9%" == "10" goto system_validate_stage2m_part9
if "%char9%" == "11" goto system_validate_stage2m_part9
if "%char9%" == "12" goto system_validate_stage2m_part9
if "%char9%" == "14" goto system_validate_stage2m_part9
if "%char9%" == "02" goto system_validate_stage2l_part9
if "%char9%" == "03" goto system_validate_stage2l_part9
if "%char9%" == "09" goto system_validate_stage2l_part9
if "%char9%" == "0B" goto system_validate_stage2l_part9
if "%char9%" == "13" goto system_validate_stage2l_part9
if "%char9%" == "15" goto system_validate_stage2l_part9
if "%char9%" == "16" goto system_validate_stage2l_part9
if "%char9%" == "17" goto system_validate_stage2l_part9
set isChar9Invalid=1
goto system_validate_stage1_part10

:system_validate_stage1_part10
if "%char10%" == "01" goto system_validate_stage2s_part10
if "%char10%" == "04" goto system_validate_stage2s_part10
if "%char10%" == "05" goto system_validate_stage2s_part10
if "%char10%" == "06" goto system_validate_stage2s_part10
if "%char10%" == "08" goto system_validate_stage2s_part10
if "%char10%" == "0C" goto system_validate_stage2s_part10
if "%char10%" == "0D" goto system_validate_stage2s_part10
if "%char10%" == "0E" goto system_validate_stage2s_part10
if "%char10%" == "00" goto system_validate_stage2m_part10
if "%char10%" == "07" goto system_validate_stage2m_part10
if "%char10%" == "0A" goto system_validate_stage2m_part10
if "%char10%" == "0F" goto system_validate_stage2m_part10
if "%char10%" == "10" goto system_validate_stage2m_part10
if "%char10%" == "11" goto system_validate_stage2m_part10
if "%char10%" == "12" goto system_validate_stage2m_part10
if "%char10%" == "14" goto system_validate_stage2m_part10
if "%char10%" == "02" goto system_validate_stage2l_part10
if "%char10%" == "03" goto system_validate_stage2l_part10
if "%char10%" == "09" goto system_validate_stage2l_part10
if "%char10%" == "0B" goto system_validate_stage2l_part10
if "%char10%" == "13" goto system_validate_stage2l_part10
if "%char10%" == "15" goto system_validate_stage2l_part10
if "%char10%" == "16" goto system_validate_stage2l_part10
if "%char10%" == "17" goto system_validate_stage2l_part10
set isChar10Invalid=1
goto system_validate_stage1_part11

:system_validate_stage1_part11
if "%char11%" == "01" goto system_validate_stage2s_part11
if "%char11%" == "04" goto system_validate_stage2s_part11
if "%char11%" == "05" goto system_validate_stage2s_part11
if "%char11%" == "06" goto system_validate_stage2s_part11
if "%char11%" == "08" goto system_validate_stage2s_part11
if "%char11%" == "0C" goto system_validate_stage2s_part11
if "%char11%" == "0D" goto system_validate_stage2s_part11
if "%char11%" == "0E" goto system_validate_stage2s_part11
if "%char11%" == "00" goto system_validate_stage2m_part11
if "%char11%" == "07" goto system_validate_stage2m_part11
if "%char11%" == "0A" goto system_validate_stage2m_part11
if "%char11%" == "0F" goto system_validate_stage2m_part11
if "%char11%" == "10" goto system_validate_stage2m_part11
if "%char11%" == "11" goto system_validate_stage2m_part11
if "%char11%" == "12" goto system_validate_stage2m_part11
if "%char11%" == "14" goto system_validate_stage2m_part11
if "%char11%" == "02" goto system_validate_stage2l_part11
if "%char11%" == "03" goto system_validate_stage2l_part11
if "%char11%" == "09" goto system_validate_stage2l_part11
if "%char11%" == "0B" goto system_validate_stage2l_part11
if "%char11%" == "13" goto system_validate_stage2l_part11
if "%char11%" == "15" goto system_validate_stage2l_part11
if "%char11%" == "16" goto system_validate_stage2l_part11
if "%char11%" == "17" goto system_validate_stage2l_part11
set isChar11Invalid=1
goto endoffile

:system_validate_stage2s_part1
if "%veh1%" == "00" set isVeh1Invalid=0
if "%veh1%" == "03" set isVeh1Invalid=0
if "%veh1%" == "06" set isVeh1Invalid=0
if "%veh1%" == "09" set isVeh1Invalid=0
if "%veh1%" == "0C" set isVeh1Invalid=0
if "%veh1%" == "0F" set isVeh1Invalid=0
if "%veh1%" == "12" set isVeh1Invalid=0
if "%veh1%" == "15" set isVeh1Invalid=0
if "%veh1%" == "18" set isVeh1Invalid=0
if "%veh1%" == "1B" set isVeh1Invalid=0
if "%veh1%" == "1E" set isVeh1Invalid=0
if "%veh1%" == "21" set isVeh1Invalid=0
goto system_validate_stage1_part2

:system_validate_stage2m_part1
if "%veh1%" == "01" set isVeh1Invalid=0
if "%veh1%" == "04" set isVeh1Invalid=0
if "%veh1%" == "07" set isVeh1Invalid=0
if "%veh1%" == "0A" set isVeh1Invalid=0
if "%veh1%" == "0D" set isVeh1Invalid=0
if "%veh1%" == "10" set isVeh1Invalid=0
if "%veh1%" == "13" set isVeh1Invalid=0
if "%veh1%" == "16" set isVeh1Invalid=0
if "%veh1%" == "19" set isVeh1Invalid=0
if "%veh1%" == "1C" set isVeh1Invalid=0
if "%veh1%" == "1F" set isVeh1Invalid=0
if "%veh1%" == "22" set isVeh1Invalid=0
goto system_validate_stage1_part2

:system_validate_stage2l_part1
if "%veh1%" == "02" set isVeh1Invalid=0
if "%veh1%" == "05" set isVeh1Invalid=0
if "%veh1%" == "08" set isVeh1Invalid=0
if "%veh1%" == "0B" set isVeh1Invalid=0
if "%veh1%" == "0E" set isVeh1Invalid=0
if "%veh1%" == "11" set isVeh1Invalid=0
if "%veh1%" == "14" set isVeh1Invalid=0
if "%veh1%" == "17" set isVeh1Invalid=0
if "%veh1%" == "1A" set isVeh1Invalid=0
if "%veh1%" == "1D" set isVeh1Invalid=0
if "%veh1%" == "20" set isVeh1Invalid=0
if "%veh1%" == "23" set isVeh1Invalid=0
goto system_validate_stage1_part2

:system_validate_stage2s_part2
if "%veh2%" == "00" set isVeh2Invalid=0
if "%veh2%" == "03" set isVeh2Invalid=0
if "%veh2%" == "06" set isVeh2Invalid=0
if "%veh2%" == "09" set isVeh2Invalid=0
if "%veh2%" == "0C" set isVeh2Invalid=0
if "%veh2%" == "0F" set isVeh2Invalid=0
if "%veh2%" == "12" set isVeh2Invalid=0
if "%veh2%" == "15" set isVeh2Invalid=0
if "%veh2%" == "18" set isVeh2Invalid=0
if "%veh2%" == "1B" set isVeh2Invalid=0
if "%veh2%" == "1E" set isVeh2Invalid=0
if "%veh2%" == "21" set isVeh2Invalid=0
goto system_validate_stage1_part3

:system_validate_stage2m_part2
if "%veh2%" == "01" set isVeh2Invalid=0
if "%veh2%" == "04" set isVeh2Invalid=0
if "%veh2%" == "07" set isVeh2Invalid=0
if "%veh2%" == "0A" set isVeh2Invalid=0
if "%veh2%" == "0D" set isVeh2Invalid=0
if "%veh2%" == "10" set isVeh2Invalid=0
if "%veh2%" == "13" set isVeh2Invalid=0
if "%veh2%" == "16" set isVeh2Invalid=0
if "%veh2%" == "19" set isVeh2Invalid=0
if "%veh2%" == "1C" set isVeh2Invalid=0
if "%veh2%" == "1F" set isVeh2Invalid=0
if "%veh2%" == "22" set isVeh2Invalid=0
goto system_validate_stage1_part3

:system_validate_stage2l_part2
if "%veh2%" == "02" set isVeh2Invalid=0
if "%veh2%" == "05" set isVeh2Invalid=0
if "%veh2%" == "08" set isVeh2Invalid=0
if "%veh2%" == "0B" set isVeh2Invalid=0
if "%veh2%" == "0E" set isVeh2Invalid=0
if "%veh2%" == "11" set isVeh2Invalid=0
if "%veh2%" == "14" set isVeh2Invalid=0
if "%veh2%" == "17" set isVeh2Invalid=0
if "%veh2%" == "1A" set isVeh2Invalid=0
if "%veh2%" == "1D" set isVeh2Invalid=0
if "%veh2%" == "20" set isVeh2Invalid=0
if "%veh2%" == "23" set isVeh2Invalid=0
goto system_validate_stage1_part3

:system_validate_stage2s_part3
if "%veh3%" == "00" set isVeh3Invalid=0
if "%veh3%" == "03" set isVeh3Invalid=0
if "%veh3%" == "06" set isVeh3Invalid=0
if "%veh3%" == "09" set isVeh3Invalid=0
if "%veh3%" == "0C" set isVeh3Invalid=0
if "%veh3%" == "0F" set isVeh3Invalid=0
if "%veh3%" == "12" set isVeh3Invalid=0
if "%veh3%" == "15" set isVeh3Invalid=0
if "%veh3%" == "18" set isVeh3Invalid=0
if "%veh3%" == "1B" set isVeh3Invalid=0
if "%veh3%" == "1E" set isVeh3Invalid=0
if "%veh3%" == "21" set isVeh3Invalid=0
goto system_validate_stage1_part4

:system_validate_stage2m_part3
if "%veh3%" == "01" set isVeh3Invalid=0
if "%veh3%" == "04" set isVeh3Invalid=0
if "%veh3%" == "07" set isVeh3Invalid=0
if "%veh3%" == "0A" set isVeh3Invalid=0
if "%veh3%" == "0D" set isVeh3Invalid=0
if "%veh3%" == "10" set isVeh3Invalid=0
if "%veh3%" == "13" set isVeh3Invalid=0
if "%veh3%" == "16" set isVeh3Invalid=0
if "%veh3%" == "19" set isVeh3Invalid=0
if "%veh3%" == "1C" set isVeh3Invalid=0
if "%veh3%" == "1F" set isVeh3Invalid=0
if "%veh3%" == "22" set isVeh3Invalid=0
goto system_validate_stage1_part4

:system_validate_stage2l_part3
if "%veh3%" == "02" set isVeh3Invalid=0
if "%veh3%" == "05" set isVeh3Invalid=0
if "%veh3%" == "08" set isVeh3Invalid=0
if "%veh3%" == "0B" set isVeh3Invalid=0
if "%veh3%" == "0E" set isVeh3Invalid=0
if "%veh3%" == "11" set isVeh3Invalid=0
if "%veh3%" == "14" set isVeh3Invalid=0
if "%veh3%" == "17" set isVeh3Invalid=0
if "%veh3%" == "1A" set isVeh3Invalid=0
if "%veh3%" == "1D" set isVeh3Invalid=0
if "%veh3%" == "20" set isVeh3Invalid=0
if "%veh3%" == "23" set isVeh3Invalid=0
goto system_validate_stage1_part4

:system_validate_stage2s_part4
if "%veh4%" == "00" set isVeh4Invalid=0
if "%veh4%" == "03" set isVeh4Invalid=0
if "%veh4%" == "06" set isVeh4Invalid=0
if "%veh4%" == "09" set isVeh4Invalid=0
if "%veh4%" == "0C" set isVeh4Invalid=0
if "%veh4%" == "0F" set isVeh4Invalid=0
if "%veh4%" == "12" set isVeh4Invalid=0
if "%veh4%" == "15" set isVeh4Invalid=0
if "%veh4%" == "18" set isVeh4Invalid=0
if "%veh4%" == "1B" set isVeh4Invalid=0
if "%veh4%" == "1E" set isVeh4Invalid=0
if "%veh4%" == "21" set isVeh4Invalid=0
goto system_validate_stage1_part5

:system_validate_stage2m_part4
if "%veh4%" == "01" set isVeh4Invalid=0
if "%veh4%" == "04" set isVeh4Invalid=0
if "%veh4%" == "07" set isVeh4Invalid=0
if "%veh4%" == "0A" set isVeh4Invalid=0
if "%veh4%" == "0D" set isVeh4Invalid=0
if "%veh4%" == "10" set isVeh4Invalid=0
if "%veh4%" == "13" set isVeh4Invalid=0
if "%veh4%" == "16" set isVeh4Invalid=0
if "%veh4%" == "19" set isVeh4Invalid=0
if "%veh4%" == "1C" set isVeh4Invalid=0
if "%veh4%" == "1F" set isVeh4Invalid=0
if "%veh4%" == "22" set isVeh4Invalid=0
goto system_validate_stage1_part5

:system_validate_stage2l_part4
if "%veh4%" == "02" set isVeh4Invalid=0
if "%veh4%" == "05" set isVeh4Invalid=0
if "%veh4%" == "08" set isVeh4Invalid=0
if "%veh4%" == "0B" set isVeh4Invalid=0
if "%veh4%" == "0E" set isVeh4Invalid=0
if "%veh4%" == "11" set isVeh4Invalid=0
if "%veh4%" == "14" set isVeh4Invalid=0
if "%veh4%" == "17" set isVeh4Invalid=0
if "%veh4%" == "1A" set isVeh4Invalid=0
if "%veh4%" == "1D" set isVeh4Invalid=0
if "%veh4%" == "20" set isVeh4Invalid=0
if "%veh4%" == "23" set isVeh4Invalid=0
goto system_validate_stage1_part5

:system_validate_stage2s_part5
if "%veh5%" == "00" set isVeh5Invalid=0
if "%veh5%" == "03" set isVeh5Invalid=0
if "%veh5%" == "06" set isVeh5Invalid=0
if "%veh5%" == "09" set isVeh5Invalid=0
if "%veh5%" == "0C" set isVeh5Invalid=0
if "%veh5%" == "0F" set isVeh5Invalid=0
if "%veh5%" == "12" set isVeh5Invalid=0
if "%veh5%" == "15" set isVeh5Invalid=0
if "%veh5%" == "18" set isVeh5Invalid=0
if "%veh5%" == "1B" set isVeh5Invalid=0
if "%veh5%" == "1E" set isVeh5Invalid=0
if "%veh5%" == "21" set isVeh5Invalid=0
goto system_validate_stage1_part6

:system_validate_stage2m_part5
if "%veh5%" == "01" set isVeh5Invalid=0
if "%veh5%" == "04" set isVeh5Invalid=0
if "%veh5%" == "07" set isVeh5Invalid=0
if "%veh5%" == "0A" set isVeh5Invalid=0
if "%veh5%" == "0D" set isVeh5Invalid=0
if "%veh5%" == "10" set isVeh5Invalid=0
if "%veh5%" == "13" set isVeh5Invalid=0
if "%veh5%" == "16" set isVeh5Invalid=0
if "%veh5%" == "19" set isVeh5Invalid=0
if "%veh5%" == "1C" set isVeh5Invalid=0
if "%veh5%" == "1F" set isVeh5Invalid=0
if "%veh5%" == "22" set isVeh5Invalid=0
goto system_validate_stage1_part6

:system_validate_stage2l_part5
if "%veh5%" == "02" set isVeh5Invalid=0
if "%veh5%" == "05" set isVeh5Invalid=0
if "%veh5%" == "08" set isVeh5Invalid=0
if "%veh5%" == "0B" set isVeh5Invalid=0
if "%veh5%" == "0E" set isVeh5Invalid=0
if "%veh5%" == "11" set isVeh5Invalid=0
if "%veh5%" == "14" set isVeh5Invalid=0
if "%veh5%" == "17" set isVeh5Invalid=0
if "%veh5%" == "1A" set isVeh5Invalid=0
if "%veh5%" == "1D" set isVeh5Invalid=0
if "%veh5%" == "20" set isVeh5Invalid=0
if "%veh5%" == "23" set isVeh5Invalid=0
goto system_validate_stage1_part6

:system_validate_stage2s_part6
if "%veh6%" == "00" set isVeh6Invalid=0
if "%veh6%" == "03" set isVeh6Invalid=0
if "%veh6%" == "06" set isVeh6Invalid=0
if "%veh6%" == "09" set isVeh6Invalid=0
if "%veh6%" == "0C" set isVeh6Invalid=0
if "%veh6%" == "0F" set isVeh6Invalid=0
if "%veh6%" == "12" set isVeh6Invalid=0
if "%veh6%" == "15" set isVeh6Invalid=0
if "%veh6%" == "18" set isVeh6Invalid=0
if "%veh6%" == "1B" set isVeh6Invalid=0
if "%veh6%" == "1E" set isVeh6Invalid=0
if "%veh6%" == "21" set isVeh6Invalid=0
goto system_validate_stage1_part7

:system_validate_stage2m_part6
if "%veh6%" == "01" set isVeh6Invalid=0
if "%veh6%" == "04" set isVeh6Invalid=0
if "%veh6%" == "07" set isVeh6Invalid=0
if "%veh6%" == "0A" set isVeh6Invalid=0
if "%veh6%" == "0D" set isVeh6Invalid=0
if "%veh6%" == "10" set isVeh6Invalid=0
if "%veh6%" == "13" set isVeh6Invalid=0
if "%veh6%" == "16" set isVeh6Invalid=0
if "%veh6%" == "19" set isVeh6Invalid=0
if "%veh6%" == "1C" set isVeh6Invalid=0
if "%veh6%" == "1F" set isVeh6Invalid=0
if "%veh6%" == "22" set isVeh6Invalid=0
goto system_validate_stage1_part7

:system_validate_stage2l_part6
if "%veh6%" == "02" set isVeh6Invalid=0
if "%veh6%" == "05" set isVeh6Invalid=0
if "%veh6%" == "08" set isVeh6Invalid=0
if "%veh6%" == "0B" set isVeh6Invalid=0
if "%veh6%" == "0E" set isVeh6Invalid=0
if "%veh6%" == "11" set isVeh6Invalid=0
if "%veh6%" == "14" set isVeh6Invalid=0
if "%veh6%" == "17" set isVeh6Invalid=0
if "%veh6%" == "1A" set isVeh6Invalid=0
if "%veh6%" == "1D" set isVeh6Invalid=0
if "%veh6%" == "20" set isVeh6Invalid=0
if "%veh6%" == "23" set isVeh6Invalid=0
goto system_validate_stage1_part7

:system_validate_stage2s_part7
if "%veh7%" == "00" set isVeh7Invalid=0
if "%veh7%" == "03" set isVeh7Invalid=0
if "%veh7%" == "06" set isVeh7Invalid=0
if "%veh7%" == "09" set isVeh7Invalid=0
if "%veh7%" == "0C" set isVeh7Invalid=0
if "%veh7%" == "0F" set isVeh7Invalid=0
if "%veh7%" == "12" set isVeh7Invalid=0
if "%veh7%" == "15" set isVeh7Invalid=0
if "%veh7%" == "18" set isVeh7Invalid=0
if "%veh7%" == "1B" set isVeh7Invalid=0
if "%veh7%" == "1E" set isVeh7Invalid=0
if "%veh7%" == "21" set isVeh7Invalid=0
goto system_validate_stage1_part8

:system_validate_stage2m_part7
if "%veh7%" == "01" set isVeh7Invalid=0
if "%veh7%" == "04" set isVeh7Invalid=0
if "%veh7%" == "07" set isVeh7Invalid=0
if "%veh7%" == "0A" set isVeh7Invalid=0
if "%veh7%" == "0D" set isVeh7Invalid=0
if "%veh7%" == "10" set isVeh7Invalid=0
if "%veh7%" == "13" set isVeh7Invalid=0
if "%veh7%" == "16" set isVeh7Invalid=0
if "%veh7%" == "19" set isVeh7Invalid=0
if "%veh7%" == "1C" set isVeh7Invalid=0
if "%veh7%" == "1F" set isVeh7Invalid=0
if "%veh7%" == "22" set isVeh7Invalid=0
goto system_validate_stage1_part8

:system_validate_stage2l_part7
if "%veh7%" == "02" set isVeh7Invalid=0
if "%veh7%" == "05" set isVeh7Invalid=0
if "%veh7%" == "08" set isVeh7Invalid=0
if "%veh7%" == "0B" set isVeh7Invalid=0
if "%veh7%" == "0E" set isVeh7Invalid=0
if "%veh7%" == "11" set isVeh7Invalid=0
if "%veh7%" == "14" set isVeh7Invalid=0
if "%veh7%" == "17" set isVeh7Invalid=0
if "%veh7%" == "1A" set isVeh7Invalid=0
if "%veh7%" == "1D" set isVeh7Invalid=0
if "%veh7%" == "20" set isVeh7Invalid=0
if "%veh7%" == "23" set isVeh7Invalid=0
goto system_validate_stage1_part8

:system_validate_stage2s_part8
if "%veh8%" == "00" set isVeh8Invalid=0
if "%veh8%" == "03" set isVeh8Invalid=0
if "%veh8%" == "06" set isVeh8Invalid=0
if "%veh8%" == "09" set isVeh8Invalid=0
if "%veh8%" == "0C" set isVeh8Invalid=0
if "%veh8%" == "0F" set isVeh8Invalid=0
if "%veh8%" == "12" set isVeh8Invalid=0
if "%veh8%" == "15" set isVeh8Invalid=0
if "%veh8%" == "18" set isVeh8Invalid=0
if "%veh8%" == "1B" set isVeh8Invalid=0
if "%veh8%" == "1E" set isVeh8Invalid=0
if "%veh8%" == "21" set isVeh8Invalid=0
goto system_validate_stage1_part9

:system_validate_stage2m_part8
if "%veh8%" == "01" set isVeh8Invalid=0
if "%veh8%" == "04" set isVeh8Invalid=0
if "%veh8%" == "07" set isVeh8Invalid=0
if "%veh8%" == "0A" set isVeh8Invalid=0
if "%veh8%" == "0D" set isVeh8Invalid=0
if "%veh8%" == "10" set isVeh8Invalid=0
if "%veh8%" == "13" set isVeh8Invalid=0
if "%veh8%" == "16" set isVeh8Invalid=0
if "%veh8%" == "19" set isVeh8Invalid=0
if "%veh8%" == "1C" set isVeh8Invalid=0
if "%veh8%" == "1F" set isVeh8Invalid=0
if "%veh8%" == "22" set isVeh8Invalid=0
goto system_validate_stage1_part9

:system_validate_stage2l_part8
if "%veh8%" == "02" set isVeh8Invalid=0
if "%veh8%" == "05" set isVeh8Invalid=0
if "%veh8%" == "08" set isVeh8Invalid=0
if "%veh8%" == "0B" set isVeh8Invalid=0
if "%veh8%" == "0E" set isVeh8Invalid=0
if "%veh8%" == "11" set isVeh8Invalid=0
if "%veh8%" == "14" set isVeh8Invalid=0
if "%veh8%" == "17" set isVeh8Invalid=0
if "%veh8%" == "1A" set isVeh8Invalid=0
if "%veh8%" == "1D" set isVeh8Invalid=0
if "%veh8%" == "20" set isVeh8Invalid=0
if "%veh8%" == "23" set isVeh8Invalid=0
goto system_validate_stage1_part9

:system_validate_stage2s_part9
if "%veh9%" == "00" set isVeh9Invalid=0
if "%veh9%" == "03" set isVeh9Invalid=0
if "%veh9%" == "06" set isVeh9Invalid=0
if "%veh9%" == "09" set isVeh9Invalid=0
if "%veh9%" == "0C" set isVeh9Invalid=0
if "%veh9%" == "0F" set isVeh9Invalid=0
if "%veh9%" == "12" set isVeh9Invalid=0
if "%veh9%" == "15" set isVeh9Invalid=0
if "%veh9%" == "18" set isVeh9Invalid=0
if "%veh9%" == "1B" set isVeh9Invalid=0
if "%veh9%" == "1E" set isVeh9Invalid=0
if "%veh9%" == "21" set isVeh9Invalid=0
goto system_validate_stage1_part10

:system_validate_stage2m_part9
if "%veh9%" == "01" set isVeh9Invalid=0
if "%veh9%" == "04" set isVeh9Invalid=0
if "%veh9%" == "07" set isVeh9Invalid=0
if "%veh9%" == "0A" set isVeh9Invalid=0
if "%veh9%" == "0D" set isVeh9Invalid=0
if "%veh9%" == "10" set isVeh9Invalid=0
if "%veh9%" == "13" set isVeh9Invalid=0
if "%veh9%" == "16" set isVeh9Invalid=0
if "%veh9%" == "19" set isVeh9Invalid=0
if "%veh9%" == "1C" set isVeh9Invalid=0
if "%veh9%" == "1F" set isVeh9Invalid=0
if "%veh9%" == "22" set isVeh9Invalid=0
goto system_validate_stage1_part10

:system_validate_stage2l_part9
if "%veh9%" == "02" set isVeh9Invalid=0
if "%veh9%" == "05" set isVeh9Invalid=0
if "%veh9%" == "08" set isVeh9Invalid=0
if "%veh9%" == "0B" set isVeh9Invalid=0
if "%veh9%" == "0E" set isVeh9Invalid=0
if "%veh9%" == "11" set isVeh9Invalid=0
if "%veh9%" == "14" set isVeh9Invalid=0
if "%veh9%" == "17" set isVeh9Invalid=0
if "%veh9%" == "1A" set isVeh9Invalid=0
if "%veh9%" == "1D" set isVeh9Invalid=0
if "%veh9%" == "20" set isVeh9Invalid=0
if "%veh9%" == "23" set isVeh9Invalid=0
goto system_validate_stage1_part10

:system_validate_stage2s_part10
if "%veh10%" == "00" set isVeh10Invalid=0
if "%veh10%" == "03" set isVeh10Invalid=0
if "%veh10%" == "06" set isVeh10Invalid=0
if "%veh10%" == "09" set isVeh10Invalid=0
if "%veh10%" == "0C" set isVeh10Invalid=0
if "%veh10%" == "0F" set isVeh10Invalid=0
if "%veh10%" == "12" set isVeh10Invalid=0
if "%veh10%" == "15" set isVeh10Invalid=0
if "%veh10%" == "18" set isVeh10Invalid=0
if "%veh10%" == "1B" set isVeh10Invalid=0
if "%veh10%" == "1E" set isVeh10Invalid=0
if "%veh10%" == "21" set isVeh10Invalid=0
goto system_validate_stage1_part11

:system_validate_stage2m_part10
if "%veh10%" == "01" set isVeh10Invalid=0
if "%veh10%" == "04" set isVeh10Invalid=0
if "%veh10%" == "07" set isVeh10Invalid=0
if "%veh10%" == "0A" set isVeh10Invalid=0
if "%veh10%" == "0D" set isVeh10Invalid=0
if "%veh10%" == "10" set isVeh10Invalid=0
if "%veh10%" == "13" set isVeh10Invalid=0
if "%veh10%" == "16" set isVeh10Invalid=0
if "%veh10%" == "19" set isVeh10Invalid=0
if "%veh10%" == "1C" set isVeh10Invalid=0
if "%veh10%" == "1F" set isVeh10Invalid=0
if "%veh10%" == "22" set isVeh10Invalid=0
goto system_validate_stage1_part11

:system_validate_stage2l_part10
if "%veh10%" == "02" set isVeh10Invalid=0
if "%veh10%" == "05" set isVeh10Invalid=0
if "%veh10%" == "08" set isVeh10Invalid=0
if "%veh10%" == "0B" set isVeh10Invalid=0
if "%veh10%" == "0E" set isVeh10Invalid=0
if "%veh10%" == "11" set isVeh10Invalid=0
if "%veh10%" == "14" set isVeh10Invalid=0
if "%veh10%" == "17" set isVeh10Invalid=0
if "%veh10%" == "1A" set isVeh10Invalid=0
if "%veh10%" == "1D" set isVeh10Invalid=0
if "%veh10%" == "20" set isVeh10Invalid=0
if "%veh10%" == "23" set isVeh10Invalid=0
goto system_validate_stage1_part11

:system_validate_stage2s_part11
if "%veh11%" == "00" set isVeh11Invalid=0
if "%veh11%" == "03" set isVeh11Invalid=0
if "%veh11%" == "06" set isVeh11Invalid=0
if "%veh11%" == "09" set isVeh11Invalid=0
if "%veh11%" == "0C" set isVeh11Invalid=0
if "%veh11%" == "0F" set isVeh11Invalid=0
if "%veh11%" == "12" set isVeh11Invalid=0
if "%veh11%" == "15" set isVeh11Invalid=0
if "%veh11%" == "18" set isVeh11Invalid=0
if "%veh11%" == "1B" set isVeh11Invalid=0
if "%veh11%" == "1E" set isVeh11Invalid=0
if "%veh11%" == "21" set isVeh11Invalid=0
goto endoffile

:system_validate_stage2m_part11
if "%veh11%" == "01" set isVeh11Invalid=0
if "%veh11%" == "04" set isVeh11Invalid=0
if "%veh11%" == "07" set isVeh11Invalid=0
if "%veh11%" == "0A" set isVeh11Invalid=0
if "%veh11%" == "0D" set isVeh11Invalid=0
if "%veh11%" == "10" set isVeh11Invalid=0
if "%veh11%" == "13" set isVeh11Invalid=0
if "%veh11%" == "16" set isVeh11Invalid=0
if "%veh11%" == "19" set isVeh11Invalid=0
if "%veh11%" == "1C" set isVeh11Invalid=0
if "%veh11%" == "1F" set isVeh11Invalid=0
if "%veh11%" == "22" set isVeh11Invalid=0
goto endoffile

:system_validate_stage2l_part11
if "%veh11%" == "02" set isVeh11Invalid=0
if "%veh11%" == "05" set isVeh11Invalid=0
if "%veh11%" == "08" set isVeh11Invalid=0
if "%veh11%" == "0B" set isVeh11Invalid=0
if "%veh11%" == "0E" set isVeh11Invalid=0
if "%veh11%" == "11" set isVeh11Invalid=0
if "%veh11%" == "14" set isVeh11Invalid=0
if "%veh11%" == "17" set isVeh11Invalid=0
if "%veh11%" == "1A" set isVeh11Invalid=0
if "%veh11%" == "1D" set isVeh11Invalid=0
if "%veh11%" == "20" set isVeh11Invalid=0
if "%veh11%" == "23" set isVeh11Invalid=0
goto endoffile

:endoffile
:: Good luck finding any bugs here