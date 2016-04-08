# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "rapa/mint-17.3-dev"
 
  config.vm.provider "virtualbox" do |vb|
	 vb.name = "mint-17.3-dev"
     vb.gui = true
     vb.memory = "6144"
  end
  
  config.vm.provision "file", source: "./files", destination: "/tmp/"
  config.vm.provision :shell, :path => "provision.sh"
  config.vm.provision :shell, :path => "vagrantUser.sh", privileged: false
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  
end



