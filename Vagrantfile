# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_plugin('vagrant-serverspec')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-base"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

  #install chef
  config.vm.provision "shell", inline: "curl -L http://www.opscode.com/chef/install.sh | sudo bash"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef-repo/cookbooks", "chef-repo/site-cookbooks"]
    chef.add_recipe("yum")
  end

  config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/*/*_spec.rb'
  end

end
