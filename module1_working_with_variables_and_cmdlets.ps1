#################################################
# Module 1 - Working with variables and cmdlets
#################################################

# What is a variable ?  A variable is a name to store a value.
# Show how variables are created
# A "non initialized" variable
$variable

## ADVANCED: Testing if a variable is null
# https://learn.microsoft.com/fr-fr/powershell/scripting/learn/deep-dives/everything-about-null?view=powershell-7.3
    ($null -eq $variable) ## pwsh < v7
    $variable ?? '$variable is NULL' # using pwsh v7 null coalescing operator

# Let’s give it a value
$variable = 1

# Get the value
$variable

# Do something to a variable
$variable + 1

# Did is changed the value of the variable ? 
# No. To change the value of the variable
$variable = $variable + 1


# Numbers in PowerShell
$Variable = $variable + .5
$variable = $variable - .3
$variable = $variable * 5
$variable = $variable / 6


# Order of operations
# PEMDAS (PEMDAS stands for P- Parentheses, E- Exponents, M- Multiplication, D- Division, A- Addition, and S- Subtraction)
$variable = 1
$variable = $variable + 1 * 4
$variable = ($variable + 1) * 4


# What about if I try to add letters?
$variable = $variable + 'Drew'
# Pwsh annot add a string to a number

# But variables can just change
$variable = 'Drew'
$variable = $variable + 1
$variable
# But it accept to add a int (implicitely casted int to string), to a string


# Now can I "add" things?
$variable = $variable + "Brent"
$variable
# Yes


# Strings and string literals
# Let’s use strings to build strings
$Number1 = 1
$Number10 = 10
$String = "I am thinking of a number between $Number1 and $Number10" # it's called variable substitution
$String

$String = "This thing costs $12012 dollars"
$String

$String = 'This thing costs $12012 dollars'
$String
# So if you don't want varibable substitution in a string, 
# use literal string (single quotes)

$String = 'I am thinking of a number between $Number1 and $Number10'
$String

$String = 'I am thinking of a number between ' + $Number1 + ' and ' + $Number10 + ' and if you guess it, you get $12012'
$String

# ADVANCED: Variable substitution tricks
# https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-string-substitutions?view=powershell-7.3
    $Number5 = 1
    "Number5 **immediately** followed by 0 should be 10. Is it ? $Number50" # does not work
    "Number5 **immediately** followed by 0 should be 10. Is it ? $($Number5)0" # does work
    'Number5 **immediately** followed by 0 should be 10. Is it ? {0}0' -f $Number5 # does work

# boolean
$booleanVariable = $true
$booleanVariable
$booleanVariable = $false
$booleanVariable


# Arrays!
# Declaring an array
$variable = @(1,2,3,4)

# Outputing an array
$variable


# Getting one array value
$variable[0]
$variable[2]
$variable[3]
$variable[10]

#Setting one array value
$variable[1] = "new value"
$variable

# Adding to an array
$variable = $variable + 'another new value'
$variable

# Can you subtract from any array?
$variable = $variable - 1 # Not like this

# ADVANCED: How to do then ? 
    # although an Array has a method Remove(), it is non-functional, because arrays are of fixed size !
    # so you have to reconstruct the array
    $variable = @(1,2,3,4)
    # To garantee that you get an array you need to wrap the entire statement in @(...), 
    # or strongly type the receiving variable:
    [array]$variable = $variable | Where-Object { $_ -ne 4 }
    $variable

    
# Are there any restrictions on variable names?
# Some
# Boolean values
$true = 1 # error
$false = 'Drew' # error
$true = $false # error

# How about starting with numbers?
$123 = 123 # Powershell accept that, but it's a bad practice
$123


