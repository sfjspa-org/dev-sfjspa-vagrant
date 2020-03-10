# -*- mode: ruby -*-
# vi: set ft=ruby :

VB_NAME="dev-sfjspa"
VM_MEMORY=2048
VM_CORES=2
#VM_NETIF_NAME="Realtek USB GbE Family Controller" 
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "public_network"
  #config.vm.network "public_network", bridge: VM_NETIF_NAME

  config.vm.synced_folder ".", "/vagrant", enabled: true, type: "virtualbox"
  unless Vagrant.has_plugin?("vagrant-vbguest")
    puts 'vagrant-vbguest plugin required. To install simply do `vagrant plugin install vagrant-vbguest`'
    abort
  else
    config.vbguest.auto_update = false
    config.vbguest.no_remote = true
  end
  if Vagrant.has_plugin?("vagrant-disksize")
    config.disksize.size = '30GB'
  end

  config.vm.provider "virtualbox" do |vb|
	vb.name		= VB_NAME
	vb.memory	= VM_MEMORY
	vb.cpus		= VM_CORES
  end
  config.vm.provision "shell", inline: <<-SHELL
    echo Hello!
  SHELL
end
