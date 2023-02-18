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

:download
wget -i url.txt

:finish
echo Program Finished!
echo It is %Date% %Time%