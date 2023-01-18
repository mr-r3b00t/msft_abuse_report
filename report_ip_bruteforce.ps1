$logdate =  Get-Date -Format "yyyy-MM-dd"
$logtime =  Get-Date -Format "HH:mm"

$URL = 'https://api.msrc.microsoft.com/report/v2.0/abuse'

$IP = Read-Host -Prompt "Please enter an IP Address: "
$dstIP = Read-Host -Prompt "Please enter the destination IP Address: "
$dstPort = Read-Host -Prompt "Please enter the destination Port"

$Body = @{
  anonymizeReport = "true"
  date = $logdate
  time = $logtime
  timeZone = "-0000" 
  reporterEmail = "email" 
  reporterName = "Name" 
  reportNotes = "Brute Force Attack" 
  threatType = "IP Address" 
  incidentType = "Brute Force" 
  sourceIp = $IP
  destinationPort = $dstPort
  
}


$Body = ConvertTo-Json $Body

$report = Invoke-RestMethod -Method 'Post' -Uri $URL -Body $Body
