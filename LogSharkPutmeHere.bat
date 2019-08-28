@echo off

echo start
set cmd="C:\Program files\logshark\logshark"
echo %cmd%

set logname=%1
echo %logname


set runcmd=%cmd% %logname% -p
echo running logshark with below command
echo %cmd% %logname% -p

%runcmd%

echo thank you
pause