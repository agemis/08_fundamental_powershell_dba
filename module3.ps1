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






