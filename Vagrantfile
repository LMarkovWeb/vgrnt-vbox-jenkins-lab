# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 2
  end

  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "~/.ssh/me.pub"
  config.vm.provision "shell", inline: <<-SHELL
    cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys
  SHELL
  
  # Jenkins on Centos 7
  config.vm.define "jen_cent7" do |config|
    config.vm.box = 'centos/7'
    config.vm.hostname = 'jenkins.loc'
    config.vm.network "private_network", ip: "192.168.20.210"
    config.vm.provision "shell", path: "bootstrap.sh"
  end

  # # minikube
  # config.vm.define "minikube" do |config|
  #   config.vm.box = 'centos/7'
  #   config.vm.hostname = 'minikube.loc'
  #   config.vm.network "private_network", ip: "192.168.20.211"
  # end
  
  # minikube
  config.vm.define "minikube" do |config|
    config.vm.box = 'peru/ubuntu-18.04-desktop-amd64'
    config.vm.hostname = 'minikube.loc'
    config.vm.network "private_network", ip: "192.168.20.211"
  end

end