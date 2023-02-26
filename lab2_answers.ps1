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

