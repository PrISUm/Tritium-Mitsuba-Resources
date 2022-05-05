
@echo off

set /p key=<tri86.key.txt
msp430encrypt.exe tri86.a43 tri86.tsf 0x00001002 4 %key%







