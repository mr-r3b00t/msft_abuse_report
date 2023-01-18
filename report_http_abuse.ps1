#https://msrc-blog.microsoft.com/2021/02/01/new-and-improved-report-abuse-portal-and-api/
#https://msrc.microsoft.com/report/developer
# this one takes a file in as input

$abuseip = Get-Content -Path .\abuse_ip.txt

# this needs updating for the new schema

foreach($ip in $abuseip){

$logdate =  Get-Date -Format "yyyy-MM-dd"
$logtime =  Get-Date -Format "HH:mm"

$URL = 'https://api.msrc.microsoft.com/report/v2.0/abuse'

#$ip = Read-Host -Prompt "Please enter an IP address: "

$Body = @{
  date = $logdate
  time = $logtime
  timeZone = "-0000" 
  reporterEmail = "EMAIL" 
  reporterName = "NAME" 
  reportNotes = "https abuse" 
  threatType = "IP Address" 
  incidentType = "Malware" 
  sourceIp = $ip.tostring()
  destinationPort = "443"
  
}

$Body = ConvertTo-Json $Body

$report = Invoke-RestMethod -Method 'Post' -Uri $URL -Body $Body

}
