@echo off

:start
echo Website change tracker developed by Joe Ermatinger
echo Today is %Date% %Time%

type url.txt

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
echo Program Finished!
echo It is %Date% %Time%