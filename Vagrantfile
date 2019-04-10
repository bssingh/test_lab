# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "ubuntu/xenial64"
 
  config.vm.define "r1" do |r1|
    r1.vm.host_name = "r1"
    r1.vm.network "private_network",
                         ip: "192.168.50.10",
                         virtualbox__intnet: "my_lan"
    r1.vm.network "private_network",
                         ip: "10.0.3.1",
                         virtualbox__intnet: "Docker Advertised network"
    config.vm.provision "shell", path: "provision_r1.sh", privileged: true
  end

  config.vm.define "r2" do |r2|
    r2.vm.host_name = "r2"
    r2.vm.network "private_network",
                         ip: "192.168.50.11",
                         virtualbox__intnet: "my_lan"
    r2.vm.network "private_network",
                         ip: "10.0.4.2",
                         virtualbox__intnet: "Docker Advertised network"
    config.vm.provision "shell", path: "provision_r2.sh", privileged: true
  end

  config.vm.define "r3" do |r3|
    r3.vm.host_name = "r3"
    r3.vm.network "private_network",
                         ip: "192.168.50.12",
                         virtualbox__intnet: "my_lan"
    r3.vm.network "private_network",
                         ip: "10.0.5.3",
                         virtualbox__intnet: "Docker Advertised network"
    config.vm.provision "shell", path: "provision_r3.sh", privileged: true
  end
end
