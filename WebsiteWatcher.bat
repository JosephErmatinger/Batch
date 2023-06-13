@echo off
setlocal enabledelayedexpansion

REM Specify the file that contains the list of URLs
set "url_file=urls.txt"

REM Specify the temporary file to store the current webpage content
set "temp_file=temp.html"

REM Specify the delay (in seconds) between each check
set "delay=60"

REM Specify the threshold for considering a website as frequently changing
set "change_threshold=5"

REM Create a logfile to track changes
set "log_file=change_log.txt"
echo Website Change Log > "%log_file%"

REM Loop indefinitely
:loop
  REM Iterate over each URL in the file
  for /f "usebackq delims=" %%a in ("%url_file%") do (
    REM Download the webpage content using curl
    curl -o "%temp_file%" "%%a"

    REM Check if there is a difference between the current and previous versions
    fc /b "%temp_file%" "previous.html" > nul

    REM If there is a difference, display a prompt to the user
    if not errorlevel 1 (
      echo Website at %%a has changed!
      echo.
      
      REM Increment the change count for the website
      set /a "change_count[%%a]+=1"
      
      REM Check if the website has exceeded the change threshold
      if !change_count[%%a]! geq %change_threshold% (
        echo Website at %%a has changed frequently.
        echo.
        
        REM Log the website as frequently changing
        echo %%a >> "%log_file%"
      )
      
      echo Press any key to view the changes in your default browser...
      pause > nul
      
      REM Open the changed webpage in the default browser
      start "" "%temp_file%"
    )

    REM Rename the current version to previous.html for the next comparison
    move /y "%temp_file%" "previous.html"
  )

  REM Wait for the specified delay before checking again
  timeout /t %delay% > nul
goto loop
