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


