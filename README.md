# Robocopy-Backup

Powershell script for automatic background files backup on Windows when a USB Drive is connected.

The script runs continuously as a background process, which you can start at system logon with the task scheduler. It will be notified whenever a new drive is connected and then do something.

I.E., I use this script to backup all of my school courses from my SSD to my Personal OneDrive.

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
   4. Arguments: `-ExecutionPolicy Unrestricted -File "C:\temp\RunBackup.ps1`

3. **(Optional)** If you want your script window to be hidden, use this argument  
   1. Add arguments: `-WindowStyle Hidden`
   
# E-Mail Authentification

If you want to use Mail notification, you may run `EncryptPassword.ps1` to store your password as a secure string.

Then in the `decryptPassword.ps1`, enter your username and the function will return a credential object.

Now you can pass your encrypted credentials after calling the `SendMail.ps1` function.
   
# Aknowledgments

- [mtone](https://superuser.com/questions/31881/is-it-possible-to-do-safe-usb-autorun-with-task-scheduler-on-windows-7/93751#93751) for the *drive detection* event
