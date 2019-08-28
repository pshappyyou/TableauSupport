@echo off
echo Creating customer DB in PostgreSQL

set dbadmin=tblwgadmin
set PGPASSWORD=75a7680ed0d7c17cde334fc2d8673f04
set PATH=%PATH%;C:\Program Files\Tableau\Tableau Server\packages\pgsql.20183.18.1128.2033\bin

set /p dbname=Enter New DB name:
set /p bkfile=Enter full path of backup file: 

echo running createdb -h localhost -p 8060 -U %dbadmin% %dbname%
createdb -h localhost -p 8060 -w -U %dbadmin% %dbname%

echo pg_restore -h localhost -p 8060 -U %dbadmin% -d %dbname%
pg_restore -h localhost -p 8060 -U %dbadmin% -d %dbname%

pause