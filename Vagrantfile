Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/jammy64"

  # Increase boot stability timeout
  config.vm.boot_timeout = 600

  # Use NAT + Host only (safe for VirtualBox)
  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.name = "devops-vm"
    vb.memory = 4096
    vb.cpus = 2

    # ⚠️ Disk size ONLY works if plugin installed
    # vagrant plugin install vagrant-disksize
    if Vagrant.has_plugin?("vagrant-disksize")
      config.disksize.size = "20GB"
    end
  end

  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    set -eux

    # Fix package issues
    apt-get update -y

    # Basic tools
    apt-get install -y curl unzip wget gnupg ca-certificates apt-transport-https

    # Docker stable install
    apt-get install -y docker.io
    systemctl enable docker
    systemctl start docker

    # Add vagrant user to docker group
    usermod -aG docker vagrant || true

    # docker-compose (safe install)
    curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
      -o /usr/local/bin/docker-compose

    chmod +x /usr/local/bin/docker-compose

  SHELL

end