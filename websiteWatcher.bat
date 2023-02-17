@echo off

:start
title Website Watcher
echo Website change tracker developed by Joe Ermatinger
echo Today is %Date% %Time%

:display
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
:finish
echo Program Finished!
echo It is %Date% %Time%