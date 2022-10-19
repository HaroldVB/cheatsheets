# Alle hoofdstukken beginnen op het configure terminal niveau.
# Algemene configuratie
```
$ hostname <naam>
$ service password encryption
$ enable secret <wachtwoord>
$ banner motd <banner>
$ no ip domain-lookup
$ line console 0 
$ password <wachtwoord>
$ end
$ copy running-config startup-config \\ kan ook naar tftp
```
# IP Configuratie
Dit is voor interfaces van routers en switches. Dit gaat niet over VLANs of sub-interfaces. 
```
$ interface <interface nummer>
$ ip address <ip adres> <subnet mask>
$ no shutdown
```
# Verkeer routeren
## IP routes
```
$ ip route <onbekend subnet> <subnet mask> <destination IP of interface>
```
## rip routing (versie 2)
```
$ router rip
$ version 2
$ network <subnet van direct aangesloten netwerk>
$ passive-interface <interface waar geen L3 switch of router aan verbonden is>
$ redistribute static <Op de router waar de default route naar het WAN is.>
```

# DHCP
```
$ ip dhcp pool <naam>
$ network <subnet> <subnet mask>
$ default-router <IP van default gateway>
$ dns-server <IP van dns server>
$ exit
$ ip dhcp excluded-address <start van excluded range> <end van excluded range>
```

# VLANs
## Switches
### VLAN Aanmaken
```
$ vlan <vlan nummer>
$ vlan name <vlan naam>
$ ip address <ip adres in VLAN> <subnet mask> \\ Alleen gebruiken indien nodig
$ no shutdown
```
### Trunking
```
$ interface <interface voor trunk>
$ switchport mode trunk
$ switchport trunk encapsulation dot1q
$ switchport trunk allowed vlan <VLAN nummers>
$ switchport trunk native vlan <management VLAN> \\ Alleen gebruiken wanneer aangegeven! 
                                                 \\Dit moet gelijk zijn aan beide kanten van de trunk
```
### Poorten
```
$ int <interface nummer> \\ voor 1 poort
$ int range <interface nummer - einde reeks> \\ bijv: int range f1/1 - 24
$ switchport mode access
$ switchport access vlan <VLAN nummer>
$ no shutdown
```
# SSH
```
$ ip domain-name <domein>
$ crypto key generate rsa \\ 1024 voor SSH versie 2
$ ip ssh version 2
$ line vty <eerste lijn> <laatste lijn> \\ bijv: line vty 0 4
$ transport input ssh
$ login local
$ username <naam> password <wachtwoord>
```
# Telnet
```
$ line vty <eerste lijn> <laatste lijn> \\ bijv: line vty 0 4
$ password <wachtwoord>
$ login
```

# Show commando's
```
$ show ip interface brief
$ show ip route
$ show ip dhcp pool
$ show ip dhcp binding
```
