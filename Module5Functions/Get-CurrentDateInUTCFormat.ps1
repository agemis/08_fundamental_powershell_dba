# A "file as a function"
 #Part of module 5

[cmdletbinding()]
param ()

#Or, we could write a function
process {
    $UTCDate = Get-Date # Local date
	$UTCDate.Kind
	$UTCDate.ToFileTimeUtc() # Convert to UTC if needed, then to Windows File Time
}