Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"

  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt update
    apt install -y openjdk-11-jdk git maven docker.io
    systemctl start docker
    systemctl enable docker
  SHELL

end