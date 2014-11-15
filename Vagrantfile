# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider :virtualbox do |vb|
    vb.memory = '1024'
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  # trantor is the puppet server (master, pdb, pgsql, foreman)
  config.vm.define 'trantor' do |host|
    host.vm.box = 'rhel6-x86_64'
    host.vm.box_url = 'http://linux-install.cc.gatech.edu/boxes/rhel6-x86_64.box'
    host.vm.host_name = 'trantor.vm'
    host.vm.network 'private_network', ip: '10.250.0.10'

    host.vm.provision :shell, :path => 'trantor/bootstrap.sh'
  end

  # anacreon is the ELK server
  config.vm.define 'anacreon' do |host|
    host.vm.box = 'rhel6-x86_64'
    host.vm.box_url = 'http://linux-install.cc.gatech.edu/boxes/rhel6-x86_64.box'
    host.vm.host_name = 'anacreon.vm'
    host.vm.network 'private_network', ip: '10.250.0.11'

    host.vm.provision :shell, :path => 'anacreon/bootstrap.sh'
  end
end
