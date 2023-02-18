@echo off

:start
title Website Watcher
echo Website change tracker developed by Joe Ermatinger
echo Today is %Date% %Time%

:view
echo View List of URLs to be processed!
type url.txt
notepad url.txt
pause

:prompt
set /p url="Enter url "
echo %url%

:download
for /f %%F in (url.txt) do (
	echo Downloading old %%F
	curl %%F >> old.txt
	echo Downloading new %%F
	curl %%F >> new.txt
)
:display
start old.html
start new.html

:compare
fc old.html new.html
if %ERRORLEVEL% EQU 0 Echo Website hasn't changed
if %ERRORLEVEL% EQU 1 Echo Website changed


:finish
echo Program Finished!
echo It is %Date% %Time%