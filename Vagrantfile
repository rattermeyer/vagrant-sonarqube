# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "minimal/xenial64"
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  config.vm.box = "geerlingguy/ubuntu1404"
  config.vm.define "sonarqube" do |machine_config|
    machine_config.vm.hostname = "sonarqube"
    machine_config.vm.network :private_network, ip: "192.168.56.20"
    machine_config.vm.provider :virtualbox do |vb|
      vb.name = "sonarqube"
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--cpus", 2]
    end #vb
    machine_config.vm.provision "shell", inline: "apt-get install python2.7"
  end # machine_config

  config.vm.define "sqcontroller", autostart: true do |vm_config|
    vm_config.vm.box = "geerlingguy/ubuntu1604"
    vm_config.vm.hostname = "sqcontroller"
    vm_config.vm.synced_folder ".", "/vagrant"
    vm_config.vm.synced_folder "./.vagrant", "/vagrant/.vagrant", mount_options: ["dmode=700,fmode=600"]
    vm_config.vm.network :private_network, ip: "192.168.56.10"
    vm_config.vm.provider :virtualbox do |vb|
      vb.name = "sqcontroller"
      vb.memory = "512"
      vb.customize ["modifyvm", :id, "--cpus", 1]
    end
    vm_config.vm.provision "shell", path: "scripts/ansible.sh"
    vm_config.vm.provision "shell", path: "scripts/provision.sh"
  end
end
