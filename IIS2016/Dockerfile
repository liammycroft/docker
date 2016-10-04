FROM microsoft/iis

MAINTAINER Liam Mycroft

COPY setup.ps1 /windows/temp/setup.ps1
RUN powershell.exe -executionpolicy bypass C:\windows\temp\setup.ps1

RUN powershell.exe -Command " \
    Import-Module IISAdministration; \
    $cert = New-SelfSignedCertificate -DnsName localhost -CertStoreLocation cert:\LocalMachine\My; \
    $certHash = $cert.GetCertHash(); \
    $sm = Get-IISServerManager; \
    $sm.Sites[\"Default Web Site\"].Bindings.Add(\"*:443:\", $certHash, \"My\", \"0\"); \
    $sm.CommitChanges();"

ENV admin_password docker.1234
RUN powershell -NoProfile -Command \
    $user = New-LocalUser -Name LocalAdmin -Password (ConvertTo-SecureString -AsPlainText -Force %admin_password%) -AccountNeverExpires; \
    Add-LocalGroupMember Administrators $user

COPY setdockerhost.ps1 /windows/temp/setdockerhost.ps1
ENTRYPOINT powershell.exe -executionpolicy bypass C:/windows/temp/setdockerhost.ps1 \
    && C:\\ServiceMonitor.exe w3svc

EXPOSE 8172