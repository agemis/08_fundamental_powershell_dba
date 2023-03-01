# demo 1

# sample logicial operators
$a = 5
$b = 6
$c = 5

# equals
$a -eq $b

# not equals
$a -ne $b

# greater than and less than
$b -gt $a
$b -lt $a

# greater than or equal to, less than or equal to
$b -ge $a
$b -le $a

$a -le $b -and $a -ge $c
$a -le $b -and $a -ge $b

# Date compares
$today = Get-Date
$tomorrow = Get-Date
$today -lt $tomorrow
$today -lt "12/28/1979 01:14 AM"

# Boolean logic
$a -and $b # remember that $true = 0
$a -or $b

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operator_precedence?view=powershell-7.3
$true -or $true -and $false # false, because -or and -and have the same precedence -> ($true -or $true) -and $false
$true -or ($true -and $false) # true

-not $a

# string test operation
$sometext = "Antoine's cat is so nice"
$sometext -like "cat"
$sometext -like "*cat*"

# Test the presence of asterisks
$sometext = "What is the result of 2 * 2 "
$sometext -like "*" # will be always $true
$sometext = ""
$sometext -like "*" # will be always $true

# Regex and escape characters to the rescue
$sometext = "What is the result of 2 * 2 "
$sometext -match "\*" # escape char is \
$sometext = "What is the result of 2 - 2 "
$sometext -match "\*" 

# Array operators
$array = @("Antoine", "Isa")
$array -contains "Antoine" # $true
$array -contains "antoine" # true, by default, case does not ot matters

# the other way, a value in a array
"antoine" -in $array # $true
"antoine" -notin $array # $false

# Module 3
# While loop
$x = 0
while ($x -lt 100) {
    $x
    $x = $x +1
}
$x

# For loop.
# I want to rename 4 file extensions, adding 3 to extension

$files = Get-Item C:\Junkfiles\*
for ($x = 0; $x -lt 4; $x = $x + 1) {
    $filesext = $files | Where-Object {$_.Extension -eq ".$x" }
    $filesext | Rename-Item -NewName {$_.Name.Replace(".$x", ".$($x+3)")} -Whatif
}










