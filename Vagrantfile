Vagrant.configure("2") do |config|

(1..3).each do |i|
    config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = "1"
    end
    config.vm.define "server#{i}" do |server|
     server.vm.box = "ubuntu/lunar64"
     server.vm.hostname = "server#{1}"
     server.vm.network "private_network", ip: "192.168.50.#{10+i}"
#     server.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)"
     server.vm.synced_folder "./share","/home/vagrant/share"

     server.vm.provision "shell" do |s|
          ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
          s.inline = <<-SHELL
          echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
          echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
          sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/#g' /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
          service ssh restart
          SHELL
     end

     server.vm.provision "host_shell", inline: <<-SHELL
      ssh-keygen -R 192.168.50.#{10+i}
     SHELL
    end

end

end