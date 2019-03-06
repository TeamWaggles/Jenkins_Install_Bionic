Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64" 
  config.vm.network "private_network", ip: "35.25.35.125"

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "1536"
  end
  config.vm.provision "shell", path: "./jenkins.sh"
end
