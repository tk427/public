clear-host
$date = (Get-Date).AddDays(-1).ToString('MM-dd-yyyy')
$wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer() # Intended to be ran locally on WSUS Server
$Groups = "Automated Patching", "Manual Patching"
# $groups = $wsus.GetComputerTargetGroups().name #Gets all Groups on Server and uses that to list the members of all groups

ForEach ($Group in $Groups)
    {
        $mygroup = $wsus.GetComputerTargetGroups() | ? {$_.Name -eq $Group}
        $mygroup.GetComputerTargets() |
            select-Object FullDomainName, IPAddress, @{NAME="Server OS";expression={$_.OSDescription}}, @{NAME="Patching Group";expression={$MyGroup.Name}} |
            export-csv c:\temp\PatchingList_$date.CSV -NoTypeInformation -Append
    }