# Robocopy-Backup

Powershell script for automatic background files backup on Windows when a USB Drive is connected.

This is a script that occurs when a Drive is connected to a PC and I use it to backup all my school courses files from my SSD to my Personal OneDrive Business Cloud Storage.

# Getting started

1. First, You may need to edit the script to tell what drive to look for, and what to execute. 
   1. `if ($driveLetter -eq 'G:' -and $driveLabel -eq 'LucaRoui')`
      1. My USB Drive named 'LucaRoui' and is set as the G: drive
      2. You could just use one condition if you don't need to check for the letter and label at the same time
   2. `robocopy <source> <destination> /E /Z /B /W:30 /R:1000000"`
      1. Path of whatever task you want to do. 

2. Save your script somewhere *(extension .ps1)*, then create a task in the **Task Scheduler** to have your script run in background
   1. Trigger: ***At log on***
   2. Action: ***Start a program***
   3. Program/script: ***powershell***
   4. Arguments: `-ExecutionPolicy Unrestricted -File "C:\Backup_script.ps1`

3. **(Optional)** If you want your script window to be hidden, use this argument  
   1. Add arguments: `-WindowStyle Hidden`
   
4. If you want to log the script messages into a text file, use the following task action
   1. Program/script: ***cmd***
   2. Add arguments: `/c powershell -WindowStyle Hidden -ExecutionPolicy Unrestricted -File "C:\Backup_script.ps1" > "C:\backup_log.txt"`
   
