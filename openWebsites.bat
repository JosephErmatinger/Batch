@echo off

:start
title Website Opener
echo Website opener developed by Joe Ermatinger
echo Today is %Date% %Time%

:view
echo View List of URLs to be opened!
type url.txt
notepad url.txt

:display
for /f %%F in (url.txt) do (
	echo Opening %%F
	start %%F 
)

:finish
echo Program Finished!
echo It is %Date% %Time%