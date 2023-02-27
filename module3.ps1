# Demo 1: Exploring object properties
# Let's get a list of files
$files = Get-ChildItem C:\JunkFiles
$files

# Now, what properties des $files contains?
$files | Get-Member

# Wow, that's a lot. How can we access some of those things?
# Method 1: Select-Object. Useful for selecting multiple properties at once
$files | Select-Object Name, FullName, CreationTime, LastAccessTime

# Method 2: Property nmaes, for use in scripting and/or logical operators
$files.FullName
$files.CreationTime
$files.LastWriteTime

# Properties of properties
$files.Name | Get-Member

# The files type
# Ho Ho ! THis is System.Array
$files.GetType() 
# To get the first file type
$files[0].GetType() # System.IO.FileSystemInfo


# Demo2

# Object properties and the pipeline
# Let's explorer Measure-Object
$files = Get-ChildItem C:\JunkFiles

$files | Measure-Object # No propery, so just the count
$files | Get-Member 
$files | Measure-Object -Property Length -Sum
$files | Measure-Object -Property Length -Average
$files | Measure-Object -Property Length -Average -Sum -Minimum -Maximum
# So, for a DBA, Measure-Object is like GROUP BY on the property, then an agregation (SUM, AVG, ...)

# Everything is an object !
$files | Measure-Object -Property Length -Average -Sum -Minimum -Maximum | Select-Object Maximum

$measures = $files | Measure-Object -Property Length -Average -Sum -Minimum -Maximum
$measures.Maximum

# Grouping objects
$files | Group-Object -Property extension 
$filegroups = $files | Group-Object -Property extension 
$filegroups.Group 

# Sorting objects
$files | Sort-Object -Property CreationTime

# Expanding on Select-Object to get only top results
# Nice !
$files | Sort-Object -Property CreationTime | Select-Object FullName, CreationTime -first 2

# A taste of expressions (bonus)
$files | Select-Object name, Length
# Very nice !
$files | Select-Object name, @{Label="length of name";Expression={$_.Name.Length}}

# Demo 3
# Methods
# Let's explore thing we can do to date objects
$date = Get-Date
$date | Get-Member
$date.ToFileTime()
$date.AddDays(30)

# Did anything changed ?
$date # No
$date = $date.AddDays(30)

# String methods
$sometext = "Antoine is bald"
$sometext | Get-Member
$sometext.Replace("bald", "rad")
$sometext

# Didn't save. Why?
# We have to assign the change!
$sometext = $sometext.Replace("bald", "rad")
$sometext

# Arrays of objects and methods
$array = @("Rocky", "Sammy", "Jake", "Sammy")
$array | Get-Member
$array.Replace("Sammy", "Sam") # replace all occurences
$array[1] = $array[1].Replace("Sammy", "Sam") # replace the first Sammy. Note that you have to assign the item

# Demo 4
# Creating you own objects is very easy with powershell
$carobject = [PSCustomObject]@{
    Color = "white"
    Make = "mercedes"
    Model = "c43"
    Doors = 4
}

$carobject | Get-Member
$carobject.Make

# Add a new property!
$carobject | Add-Member -MemberType NoteProperty -Name Year -Value 2018
$carobject | Get-Member

# LAB 3 SOLUTION
# ==========================

# Create a variable that holds all the object (files) in the directory `C:\JunkFiles`
$files = Get-Item C:\JunkFiles\*

# Find the minimum, maximum, and average file sizes
$files | Measure-Object -Property Length -Minimum -Maximum -Average

# Create a new variable that contains ONLY the full path and last write time of the files in the folder
$files | Select-Object FullName, LastWriteTime

# Create a custom dog object with the following properties:
#	* Name (string)
#	* Breed (string)
#	* Age (number)
#	* Color (string)
#	* GoodDog (Boolean)
$dog = [PSCustomObject]@{
    Name = "Gitane"
    Breed = "German Shepperd"
    Age = 13
    Color = "Black"
    GoodDog = $true
}
$dog

# Create an array of dogs
$dogs = @($dog, 
    [PSCustomObject]@{
        Name = "Dick"
        Breed = "Epagneul Breton"
        Age = 19
        Color = "Brown"
        GoodDog = $true
})

$dogs


# With a date object, tell me what day of the week falls on in 30 years
((Get-Date).AddYears(30)).DayOfWeek


