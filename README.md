# Robocopy-Backup

# Getting started

1. First, You may need to edit the script to tell what drive to look for, and what to execute. The two lines to change are:
   1. `if ($driveLetter -eq 'G:' -and $driveLabel -eq 'LucaRoui')`
      1. My usb hard drive named 'LucaRoui' and is set as the G: drive. You could just use `if ($driveLabel -eq 'MyDiskLabel')` if you don't need the letter.
   2. `start-process "C:\backup.bat"`
      1. Path of whatever task you want to do. In this example, I have created a batch file on my C: drive which run a backup tasks from a SSD to a Business OneDrive, but it could be anything.
2. Save your script somewhere *(extension .ps1)*, then create a task in the `Task Scheduler` to have your script run in background
   1. Trigger: ***At log on***
   2. Action: ***Start a program***
   3. Program/script: ***powershell***
3. **(Optional)** If you want your script window to be hidden, use these arguments:  
   1. Add arguments: `-WindowStyle Hidden -ExecutionPolicy Unrestricted -File "<absolute_path>\Backup_script.ps1"`
   
If you want to output the script messages into a log file (that gets overwritten everytime the script starts, i.e. at log on), use the following task action:
- Program/script: ***cmd***
- Add arguments: `/c powershell -WindowStyle Hidden -ExecutionPolicy Unrestricted -File "<absolute_path>\Backup_script.ps1" > "C:\backup_log.txt"`
   
If you want to end a running hidden script, look for the "`Powershell`" process in the **Task Manager**.
