# test_lab

Create a test lab network with VM.
VM1: Run quagga router. IP: 192.168.50.10, Annouced range 10.0.3.0/24 
VM2: Run quagga bgl reflecter client. IP: 192.168.50.11, Annouced range 10.0.4.0/2
VM3: Run quagga bgl reflecter client, IP: 192.168.50.12, Annouced range 10.0.5.0/2

Bgp range on each VM can be used by docker or any other container.
