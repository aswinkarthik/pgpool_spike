Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-6.5"

  config.vm.provider "virtualbox" do |node|
    node.memory = 1024
    node.cpus = 2
    node.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
  
  config.vm.synced_folder "data/", "/data/"

  config.vm.define "db1" do |node|
    node.vm.network "private_network", ip: "10.0.0.100"
  end

  config.vm.define "db2" do |node|
    node.vm.network "private_network", ip: "10.0.0.101"
  end

  config.vm.define "pgpool1" do |node|
    node.vm.network "private_network", ip: "10.0.0.102"
  end

  config.vm.define "pgpool2" do |node|
    node.vm.network "private_network", ip: "10.0.0.103"
  end
end
