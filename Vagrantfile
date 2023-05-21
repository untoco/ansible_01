# -*- mode: ruby -*-
# vi: set ft=ruby :
 
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

(1..3).each do |i|    
    config.vm.define "server#{i}" do |server|
     server.vm.box = "ubuntu/focal64"
     server.vm.hostname = "server#{1}"
     server.vm.network "private_network", ip: "192.168.50.#{10+i}"
     server.vm.synced_folder "./share","/home/vagrant/share"
     server.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/#g' /etc/ssh/sshd_config
      service ssh restart
     SHELL
     config.vm.provision "host_shell", inline: <<-SHELL
      ssh-keygen -R 192.168.50.#{10+i}
     SHELL
    end
end

end