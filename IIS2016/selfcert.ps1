Import-Module IISAdministration;

$cert = New-SelfSignedCertificate -DnsName localhost -CertStoreLocation cert:\LocalMachine\My -FriendlyName localcert
$certHash = $cert.GetCertHash()
$sm = Get-IISServerManager;

$sm.Sites["Default Web Site"].Bindings.Add("*:443:", $certHash, "My", "0");

$sm.CommitChanges();