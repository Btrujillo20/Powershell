

$netcard = get-netadapter -name #ethernetname
$netcard | set-netipinterface -dhcp Disabled
$netcard | new-netipaddress -ipaddress 172.16.0.55 -PrefixLength 24 -DefaultGateway 172.16.0.2
set-dnsclientserveraddress -interfacealias #ethernetname -ServerAddresses #DNSIP