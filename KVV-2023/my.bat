@ECHO OFF
timeout 1
cd /d C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build
call vcvarsall.bat x86
cd /d D:\\KVV-2023\\Generation\Generation
ml /c /coff /Zi Gen.asm
link /OPT:NOREF /DEBUG /SUBSYSTEM:CONSOLE libucrt.lib Gen.obj 
call Gen.exe
timeout 5
pause
exit