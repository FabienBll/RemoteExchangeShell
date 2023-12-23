
<#PSScriptInfo

.VERSION 1.0

.GUID ca2bdc7f-3fe2-49d9-bd3e-7e0d3a917a3c

.AUTHOR FabienBllr

.COMPANYNAME 

.COPYRIGHT 

.TAGS 

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


#>

<# 

.DESCRIPTION 
 The script creates a new PowerShell session to the Exchange Management Shell of an Exchange Server, imports the session, and executes Exchange commands using the `New-PSSession` and `Import-PSSession` cmdlets. 

#> 
Param()

# Specify the IP address or server name of the Exchange server
$ExchangeServer = "<Server's Name>.<Domain Name>"
# $ExchangeServer = "<IP Address>"

# Specify the username and password for connecting to the Exchange server
$ExchangeUser = "<Domain Name>\<User Login>"
$ExchangePasswd = ConvertTo-SecureString "<Your Password>" -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential($ExchangeUser, $ExchangePasswd)

# Create a new PowerShell session for Exchange with the specified configuration and credentials
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://$ExchangeServer/PowerShell/ -Authentication Kerberos -Credential $Credentials

# Import the PowerShell session and disable name checking
Import-PSSession $Session -DisableNameChecking

# Enter the Exchange commands you want to execute here

# Remove the PowerShell session when done
Remove-PSSession $Session


