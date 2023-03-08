# Demo 1
# Let's say we often want to get an UTC Date as file time
# We could keep doing that:
$UTCDate = Get-Date # Local date
$UTCDate.Kind
# https://learn.microsoft.com/fr-fr/dotnet/api/system.datetime.tofiletimeutc?view=net-7.0
$UTCDate.ToFileTimeUtc() # Convert to UTC if needed, then to Windows File Time

#$UTCDate = $UTCDate.ToFileTimeUtc()
$UTCDate

# Or we could write a function
function Get-CurrentDateInUTCFormat {
	$UTCDate = Get-Date # Local date
	$UTCDate.Kind
	$UTCDate.ToFileTimeUtc() # Convert to UTC if needed, then to Windows File Time	
}


# Let's run that
Get-CurrentDateInUTCFormat
$UTCDateTime = Get-CurrentDateInUTCFormat
$UTCDateTime

# OK, it's fine, but the function is only visible and callable from the current powershell session.


# to call a function from a file, you can create a Module5Functions\Get-CurrentDateInUTCFormat.ps1 file, 
# that contains this code

# # A "file as a function"
#  #Part of module 5

#  [cmdletbinding()]
#  param ()
 
#  #Or, we could write a function
#  process {
# 	 $UTCDate = Get-Date
# 	 $UTCDate = $UTCDate.ToFileTimeUTC()
# 	 $UTCDate
#  }

# And now, running the function from a file
# so yo can run the code from any powershell session
.\Module5Functions\Get-CurrentDateInUTCFormat.ps1


# Demo 2













# LAB 5 ASSIGNMENT

<# Write a function that accepts no parameters and gives you the latest file creation from the path `C:\JunkFiles`

Write another function that accepts a number parameter and returns the number times 1000
* Bonus: can you include some logic tom male sure the person does not passe zero?
* Double bonus: Can you make it so you can call this function from a script file?

translation to french: 
cricket = criquet
chirps = gazouillis

Write a function that recreates Dolbear's law:
* Dolbear law says that you can derive temperature from a cricket's chirps using the following equation: `temperature (F) = 50 + (Number of CHripts - 40) / 4`
* Write a function that accepts the number of chirps and returns the temperature in degress Fahrenheit
* Bonus: Add a parameter for cricket type! The equation changes on type: 
	* Field cricket: `F = 50 + ((N - 40) / 4)`
	* Snowy tree cricket: `F = 50 + ((N - 92) / 4.7)`
	* Common Katydid: `F = 60 + ((N - 19) / 3)`
	* Hint: Try the ValidateSet for the cricket type parameter
	* Double bonus: Make the number of chrips mandatory, but default to the field cricket type
	* Triple bonus! Can you male it so you can run this function from a file ? 
 #>


 