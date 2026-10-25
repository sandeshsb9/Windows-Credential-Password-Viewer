<#
open a command prompt and run the following command to display the target list,

Then copy the target you want to retrieve the password for and paste it into the $Target variable below.

for example: 
cmdkey.exe /list
you will see output similar to the following:

   Target: LegacyGeneric:target=git:https://github.com
    Type: Generic
    User: yourusername...
    Local machine persistence

copy the target you want to retrieve the password for and paste it into the $Target variable below.

#>



$Target = ""

Import-Module CredentialManager

$creds = Get-StoredCredential -Target $Target -AsCredentialObject

$passwordBytes = [System.Text.Encoding]::Unicode.GetBytes($creds.Password)
$asciiString = [System.Text.Encoding]::ASCII.GetString($passwordBytes)

Write-Host ""
Write-Host "Plain text password:"
Write-Host $asciiString