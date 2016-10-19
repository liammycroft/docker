FROM microsoft/mssql-server-2016-developer-windows

MAINTAINER Liam Mycroft

RUN powershell.exe -NoProfile -command \
    Set-DtcNetworkSetting -DtcName Local -AuthenticationLevel NoAuth \ 
    -InboundTransactionsEnabled 1 -OutboundTransactionsEnabled 1 \ 
    -RemoteClientAccessEnabled 1 -Confirm:$false
    
EXPOSE 1433 3372