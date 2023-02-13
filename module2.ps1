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
