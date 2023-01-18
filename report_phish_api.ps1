$logdate =  Get-Date -Format "yyyy-MM-dd"
$logtime =  Get-Date -Format "HH:mm"

$URL = 'https://api.msrc.microsoft.com/report/v2.0/abuse'

$phishURL = Read-Host -Prompt "Please enter a URL: "

$Body = @{
  anonymizeReport = "true"
  date = $logdate
  time = $logtime
  timeZone = "-0000" 
  reporterEmail = "EMAIL" 
  reporterName = "NAME" 
  reportNotes = "PHISHING/SCAMMERS Detected" 
  threatType = "URL" 
  incidentType = "Phishing" 
  sourceUrl = $phishURL
  destinationPort = "443"
  
}


$Body = ConvertTo-Json $Body

$report = Invoke-RestMethod -Method 'Post' -Uri $URL -Body $Body
