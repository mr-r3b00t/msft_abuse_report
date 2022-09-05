from datetime import datetime, timezone
import requests

ip = input('Please enter an IP address: ')

body = {
    'date': datetime.now(timezone.utc).strftime('%Y-%m-%d'),
    'time': datetime.now(timezone.utc).strftime('%H:%M'),
    'timeZone': '-0000',
    'reporterEmail': 'ENTER YOUR EMAIL',
    'reporterName': 'ENTER YOUR NAME',
    'reportNotes': 'PHISHING/SCAMMERS Detected',
    'threatType': 'IP Address',
    'incidentType': 'Phishing',
    'sourceIp': ip,
    'destinationPort': '443'
}

requests.post('https://api.msrc.microsoft.com/report/v2.0/abuse',headers={'Content-type': 'application/json'},json=body,verify=False)