Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"

  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 3000, host: 3000 # Grafana
  config.vm.network "forwarded_port", guest: 9090, host: 9090 # Prometheus

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    set -eux

    apt update

    # Core tools
    apt install -y openjdk-11-jdk git maven curl unzip

    # Docker
    apt install -y docker.io
    systemctl enable docker
    systemctl start docker

    # Allow vagrant user to use docker
    usermod -aG docker vagrant

    # kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

  SHELL

end