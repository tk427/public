<#
.SYNOPSIS
    Gets the temp of your CPU's
    Code Author     : Tim Fox
    Dependencies    : Local Admin Access
    Creation Date   : 11/21/2019 13:05 PM 
    Code Version    : 20191121-1
    
.DESCRIPTION
    Gets the temp of your CPU's.  This is a script I found online and started modifying it.  This is a function, but I have added code
    to output a running list of temps.  This is also written to a text file with the hopes of creating a graph from the points of data.
    This script is NOT ready for prime time.
OPTIONAL parameter include
.PARAMETER PARAMETER NAME
    PARAMETER DESCRIPTION
OPTIONAL parameter include
.EXAMPLE
.NOTES
#>

function Get-CPUTemperature {
    $t = Get-WmiObject MSAcpi_ThermalZoneTemperature -Namespace "root/wmi"
    $returntemp = @()

    foreach ($temp in $t.CurrentTemperature)
    {
        $date = Get-Date -Format "MM-dd-yyy HH:mm:ss" # Generates a TimeStamp
        $currentTempKelvin = $temp / 10
        $currentTempCelsius = $currentTempKelvin - 273.15
        $currentTempFahrenheit = (9/5) * $currentTempCelsius + 32
        $returntemp += $currentTempCelsius.ToString() + "C - " + $currentTempFahrenheit.ToString() + "F"
    }
    return $returntemp
}

# Get-CPUTemperature # Function to display the above temp

# Monitors CPU temp for 500 points of data and exports them to a txt file
$count = 5
do {
        $temp = Get-CPUTemperature
        Write-host $temp
        Add-Content d:\temp\temp.txt $temp
        $count--
        Start-Sleep -s 5
    } 
    until ( $count -eq 0)