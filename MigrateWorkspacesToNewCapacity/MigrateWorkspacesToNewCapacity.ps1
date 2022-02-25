# The following script will assign all your workspaces list to the new capacity. The workspaces list is pulled from "Workspaces" option in the admin portal, it's not necesary to be this file,
# you can create your own file and set a column with the name "ID".
# You need to set up two variables the workspaces file path and the capacity ID, then you can run the script.

#Log in to Power BI Service
Connect-PowerBIServiceAccount –Environment Public 	

#Enter the workspaces file path.
$workspacesCSVPath = "C:\Users\joseama\Downloads\Workspaces (1).csv"

#Enter the Capacity ID
$newCapacity = "92905A87-2797-4C66-AA8B-97F6F393CE22"

$file= Import-Csv -Path $workspacesCSVPath

[int]$LinesInFile = 0
$reader = New-Object IO.StreamReader $workspacesCSVPath
 while($reader.ReadLine() -ne $null){ $LinesInFile++ }


$headers = Get-PowerBIAccessToken
$body = @{
  capacityId = $newCapacity
}


$counter = 0
$NumberOfworkspaces = $LinesInFile - 1
#Now loop through the workspaces, hence the ForEach
ForEach($f in $file)
{
	if ($counter -lt $NumberOfworkspaces){
        
        $uri = "https://api.powerbi.com/v1.0/myorg/groups/"+$f.ID+"/AssignToCapacity"
        Invoke-RestMethod -Uri $uri –Headers $headers –Method POST -Body $body
        Write-Host "Workspace: " $f.Name "has been assigned to the capacity " $newCapacity
    }
}
Write-Host ""
Write-Host "All the workspaces has been moved to the new capacity, don't forget to give some minutes to get in the new capacity nodes, this will vary depends on your workspace size. Finally, refresh your web browser and check the workspaces."

