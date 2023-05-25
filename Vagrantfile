# -*- mode: ruby -*-
# vi: set ft=ruby :
 
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

(1..3).each do |i|
    config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = "2"
#     vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
#     vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end
    config.vm.define "server#{i}" do |server|
     server.vm.box = "ubuntu/lunar64"
     server.vm.hostname = "server#{1}"
     server.vm.network "private_network", ip: "192.168.50.#{10+i}"
#     server.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
     server.vm.synced_folder "./share","/home/vagrant/share"
     server.vm.provision "shell", inline: <<-SHELL
#      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/#g' /etc/ssh/sshd_config
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/#g' /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
      service ssh restart
     SHELL
     config.vm.provision "host_shell", inline: <<-SHELL
      ssh-keygen -R 192.168.50.#{10+i}
     SHELL
    end

end

end