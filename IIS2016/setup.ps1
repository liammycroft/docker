# Import-Module IISAdministration;
Install-WindowsFeature -Name Web-Mgmt-Service,Web-Asp-Net45,Web-AppInit,NET-WCF-HTTP-Activation45,NET-WCF-Pipe-Activation45,NET-WCF-TCP-Activation45;
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\WebManagement\Server -Name EnableRemoteManagement -Value 1;
Set-Service -Name WMSvc -StartupType Automatic;
Start-Service WMSvc;
Set-DtcNetworkSetting -DtcName Local -AuthenticationLevel NoAuth -InboundTransactionsEnabled 1 -OutboundTransactionsEnabled 1 -RemoteClientAccessEnabled 1 -Confirm:$false
