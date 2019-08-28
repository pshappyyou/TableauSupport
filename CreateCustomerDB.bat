@echo off
echo ...Creating customer DB in PostgreSQL...

set dbadmin=tblwgadmin

set /p PGPASSWORD=ENTER pgadmin password(run "tsm configuration get -k pgsql.adminpassword" to get password):
echo %PGPASSWORD%
REM 75a7680ed0d7c17cde334fc2d8673f04

set PATH=%PATH%;C:\Program Files\Tableau\Tableau Server\packages\pgsql.20183.18.1128.2033\bin

set bkfile=%1 
echo back up file: %bkfile%

IF "%bkfile%"==" " (
echo NO BACKUPFILE name is entered.
echo Drag backup dump file into this batch file.
pause
exit
) 

set /p dbname=Enter New DB name:
echo NEW dbname is "%dbname%"

IF "%dbname%"=="" (
echo NO DBNAME is entered.
pause
exit
)

SET /P RUSURE=Are You SURE to CONTINUE (y/n)?
IF /I "%RUSURE%" NEQ "y" goto END
echo New db %dbname% will be created.
echo running createdb %dbname% ...
createdb -h localhost -p 8060 -w -U %dbadmin% %dbname%

echo running pg_restore with %dbname% ...
pg_restore -h localhost -p 8060 -U %dbadmin% -d %dbname% %bkfile%

ECHO JOB finished.
pause
exit

:END
ECHO you are not sure.
pause
exit
