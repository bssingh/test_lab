apt-get -y install quagga quagga-doc
cp /usr/share/doc/quagga/examples/zebra.conf.sample /etc/quagga/zebra.conf
sed -i 's/zebra=no/zebra=yes/' /etc/quagga/daemons
sed -i  's/bgpd=no/bgpd=yes/' /etc/quagga/daemons

cat >/etc/quagga/bgpd.conf <<'EOF'
log file /var/log/quagga/bgpd.log
log monitor

password zebra
enable password zebra

log file /var/log/quagga/bgpd.log
router bgp 64512
bgp router-id 192.168.50.10
neighbor 192.168.50.11 remote-as 64512
neighbor 192.168.50.12 remote-as 64512
network 10.0.3.0/24
neighbor 192.168.50.11 route-reflector-client
neighbor 192.168.50.12 route-reflector-client
EOF

chown quagga.quaggavty /etc/quagga/*.conf
chmod 640 /etc/quagga/*.conf

cd /etc/init.d
update-rc.d  quagga defaults
service quagga start
