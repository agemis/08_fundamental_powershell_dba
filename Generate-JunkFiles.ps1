begin {
    $Colors = @('Blue','Red','Violet','Yellow','Green','Orange','Teal','White','Black')
    $Dictionary = @('pomology','terremotive','charivari','imagism','simplex','superjection','mellification','ossuary','quattrocentism','abactor')
    $StartTime = Get-Date
    $CurrentTime = $StartTime
    $EndTime = $StartTime.AddMinutes(30)
    Write-Host "Starting at $CurrentTime and running until $endTime..."
}

process {
    While ($CurrentTime -lt $EndTime) {
        $RandomExtension = Get-Random -Minimum 0 -Maximum 4
        $ColorIndex = Get-Random -Minimum 0 -Maximum ($Colors.Length)
        $DictIndex = Get-Random -Minimum 0 -Maximum ($Dictionary.Length)
        $FileName = $CurrentTime.ToFileTime().ToString() + "_" + $Colors[$ColorIndex].ToLower() + "_" + $Dictionary[$DictIndex].ToLower() + "." + $RandomExtension
        $FileContent = $Colors[$ColorIndex].ToLower() + " " + $Dictionary[$DictIndex].ToLower() + " number " + $RandomExtension
        $FileContent | Out-File -FilePath "C:\JunkFiles\$FileName" 
        Write-Host "Writing to $FileName..."
        Start-Sleep -Seconds 2
		$CurrentTime = Get-Date
    }
}

end {
    Write-Host "Done!"
}