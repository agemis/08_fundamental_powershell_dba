# What cmdlet can i run? Find out with a cmdlet
Get-Command

# Approved verbs
Get-Verb

# What does a cmdlet do, without running it?
Get-Help Get-Process

# Parameter support
Get-Help Get-Process -Detailed

# Let's actually run a cmdlet!
Get-Process

# We can assign output to a variable, too
$procs = Get-Process
$procs

# More cmdlets? Sure !
# How about reading a file? 
# What happens if a cmdlet requires a parametes?
Get-Content

# Or include it
Get-Content -Path C:\JunkFiles\133206592385025899_white_charivari.2

# Get everything in a path?
Get-ChildItem # current path
Get-ChildItem -Path C:\JunkFiles
Get-Help Get-ChildItem -Detailed

# Get a date object. 
Get-Date -Year 2020 # a little weird here, the current data, but in 2020

# Writing things to the screen
Write-Host "Hello, here's a message"


# Demo 2 - The pipeline
# Let's see what happends when we pipe the Get-Prcoess cmdlet to another cmdlet that does something with the output
Get-Process
Get-Process | Out-File -FilePath c:\lab\pyprocess.txt
#             note the the parameters are not coherent here between Out-File and Export-CSV
Get-Process | Export-CSV -Path c:\lab\pyprocess.txt 
Get-Process | Out-GridView


# Select-Object is a great cmdlet to pipe things to, if you want a subset of things returned
Get-ChildItem | Select-Object 
Get-ChildItem | Select-Object Name
Get-ChildItem | Select-Object LastWriteTime
Get-ChildItem | Select-Object Name, LastWriteTime

# Double pipe !
Get-ChildItem | Select-Object Name, LastWriteTime | Out-File c:\lab\superpipe.txt

# You can also use parenthesis with cmdlet!
Get-ChildItem -Path (Resolve-Path ~)


# LAB 2 SOLUTION
# ==========================

# Get a list of running processes -> variables
$processes = Get-Process

# from the variable, export to text file, to csv file, to grid view
$processes  # Same as: $processes | Write-Output

# Arg ! Lines like this "System.Diagnostics.Process (AggregatorHost)"
$processes | Set-Content C:\lab\processes.txt 

# Nice ! OK
$processes | Out-File C:\lab\processes1.txt 

# IMPORTANT. Set-Content and Out-File
# https://devblogs.microsoft.com/powershell-community/how-to-send-output-to-a-file/
# If you pass a non-string object:
# - Set-Content use ToString()
# - Out-File uses PowerShell’s formatting system to write to the file rather than using ToString().
#       Using Out-File cmdlet means Powershell sends the file the same display representation that you see from the console.

$processes | Export-Csv C:\lab\processes.csv
$processes | Out-GridView



# bonus: one liner, all processes, write to a file, but only include process name and CPU usage
Get-Process | Select-Object Name, CPU | Out-File C:\lab\processes2.txt


# search the help, what cmdlet could you run to get a random number?
get-help random  
    Get-Random

# read the content of a file you saved
Get-Content C:\lab\processes2.txt


# bonus: read the csv file you saved, but parse the csv
Get-Help csv
    Import-Csv
$csv = Import-Csv C:\lab\processes.csv
$csv[1].Description

