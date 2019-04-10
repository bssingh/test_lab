apt-get -y install quagga quagga-doc
cp /usr/share/doc/quagga/examples/zebra.conf.sample /etc/quagga/zebra.conf
sed -i 's/zebra=no/zebra=yes/' /etc/quagga/daemons
sed -i 's/bgpd=no/bgpd=yes/' /etc/quagga/daemons

cat > /etc/quagga/bgpd.conf <<'EOF'
password zebra
enable password zebra
log file /var/log/quagga/bgpd.log

router bgp 64512
bgp router-id 192.168.50.12
neighbor 192.168.50.10 remote-as 64512
network 10.0.5.0/24
EOF

chown quagga.quaggavty /etc/quagga/*.conf
chmod 640 /etc/quagga/*.conf

cd /etc/init.d
update-rc.d  quagga defaults
service quagga start
