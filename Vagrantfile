Vagrant.configure("2") do |config|
  config.vm.define "Centos" do |master|
    master.vm.box = "centos/7"
    master.vm.box_check_update = false
    master.vm.hostname = "ubuntu"
    master.vm.network "private_network", ip: "10.0.0.100"
    config.vm.provision "shell", inline: <<-SHELL
        usermod vagrant -aG root
        sudo yum clean all && sudo yum update -y --nogpgcheck \
        && sudo yum install -y epel-release \
        && sudo yum install -y --nogpgcheck vim-enhanced cerl git wget ansible \
        && sudo yum clean all
        echo "=============================="
        echo "Installing is compleated"
     SHELL
  end  
  config.vm.define "Ubuntu" do |worker|
     worker.vm.box = "bento/ubuntu-18.04"
     worker.vm.box_check_update = false
     worker.vm.hostname = "Ubuntu"
     worker.vm.network "private_network", ip: "10.0.0.101"
     config.vm.provision "shell", inline: <<-SHELL
         usermod vagrant -aG root
         sudo su -
         sudo apt-get update -y \
         && sudo apt-get install -y vim wget curl git openjdk-8-jdk
         git --version
         echo "Installing is compleated"
      SHELL
  end
end 