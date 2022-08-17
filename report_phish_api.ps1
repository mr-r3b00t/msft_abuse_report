$logdate =  Get-Date -Format "yyyy-MM-dd"
$logtime =  Get-Date -Format "HH:mm"

$URL = 'https://api.msrc.microsoft.com/report/v2.0/abuse'

$ip = Read-Host -Prompt "Please enter an IP address: "

$Body = @{
  date = $logdate
  time = $logtime
  timeZone = "-0000" 
  reporterEmail = "ENTER YOUR EMAIL" 
  reporterName = "ENTER YOUR NAME" 
  reportNotes = "PHSHING/SCAMMERS Detected" 
  threatType = "IP Address" 
  incidentType = "Phishing" 
  sourceIp = $ip.tostring()
  destinationPort = "443"
  
}

$Body = ConvertTo-Json $Body

$report = Invoke-RestMethod -Method 'Post' -Uri $URL -Body $Body
