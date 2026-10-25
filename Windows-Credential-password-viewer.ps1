
$Target = ""

Import-Module CredentialManager

$creds = Get-StoredCredential -Target $Target -AsCredentialObject

$passwordBytes = [System.Text.Encoding]::Unicode.GetBytes($creds.Password)
$asciiString = [System.Text.Encoding]::ASCII.GetString($passwordBytes)

Write-Host ""
Write-Host "Plain text password:"
Write-Host $asciiString
