$gateway = (Get-NetIPConfiguration).IPv4DefaultGateway.NextHop;
Add-Content C:/Windows/System32/drivers/etc/hosts "`r`n$gateway dockerhost"