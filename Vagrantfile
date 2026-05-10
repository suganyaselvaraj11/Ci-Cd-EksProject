Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "devops-lab"
  config.vm.boot_timeout = 600

  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL

    sudo apt-get update -y

    # ---------------- JAVA ----------------
    sudo apt-get install openjdk-11-jdk -y

    # ---------------- DOCKER ----------------
    sudo apt-get install docker.io -y
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker vagrant

    # ---------------- JENKINS ----------------
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
      /usr/share/keyrings/jenkins-keyring.asc > /dev/null

    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
      https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt-get update -y
    sudo apt-get install jenkins -y
    sudo systemctl enable jenkins
    sudo systemctl start jenkins

    # ---------------- TRIVY ----------------
    sudo apt-get install wget apt-transport-https -y
    wget https://aquasecurity.github.io/trivy-repo/deb/public.key
    sudo apt-key add public.key
    echo "deb https://aquasecurity.github.io/trivy-repo/deb bionic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
    sudo apt-get update -y
    sudo apt-get install trivy -y

    # ---------------- KUBERNETES (MINIKUBE LIGHT) ----------------
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    # ---------------- PROMETHEUS ----------------
    sudo useradd --no-create-home --shell /bin/false prometheus
    wget https://github.com/prometheus/prometheus/releases/latest/download/prometheus-*.linux-amd64.tar.gz
    tar -xvf prometheus-*.linux-amd64.tar.gz

    # ---------------- GRAFANA ----------------
    sudo apt-get install -y apt-transport-https software-properties-common
    wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
    echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
    sudo apt-get update -y
    sudo apt-get install grafana -y
    sudo systemctl enable grafana-server
    sudo systemctl start grafana-server

  SHELL
end