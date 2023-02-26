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