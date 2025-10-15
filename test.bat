@echo off

echo. Execution of myDosFunc with different aguments.
call:myDosFunc 100 YeePEE

set "var1=CmdTips"
echo. var1 before: %var1%

call:myGetFunc var1
echo.var1 after: %var1%

echo.&pause&goto:eof

:myDosFunc
echo.
echo. here the myDosFunc function is executing a group of commands
echo. it could do %~1 of things %~2.
goto:eof

:myGetFunc
set "%~1=DosTips"
goto:eof