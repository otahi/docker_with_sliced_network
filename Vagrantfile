# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_plugin('vagrant-omnibus')
Vagrant.require_plugin('vagrant-serverspec')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos65-base"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

  config.vm.network :private_network, ip: "192.168.128.2", virtualbox__intnet: "true", adapter: 2

  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      rbenv: {
        user_installs: [{
                          user: "vagrant",
                          rubies: ["2.0.0-p353"],
                          global: "2.0.0-p353",
                          gems: {
                            "2.0.0-p353" => [
                                             {name: "bundler"}
                                            ]
                          }
                        }],
        rubies: ["2.0.0-p353"],
        global: "2.0.0-p353",
        gems: {
          "2.0.0-p353" => [
                           {name: "bundler"}
                          ]
        }

      },
      ofc: {
        port: "192.168.128.2:6653"
      },
      ofs: {
        datapath_id: "0000000000000001"
      }
    }

    chef.cookbooks_path = ["chef-repo/cookbooks", "chef-repo/site-cookbooks"]
    chef.add_recipe("common")
    chef.add_recipe("openvswitch")
    chef.add_recipe("docker")
    chef.add_recipe("git")
    chef.add_recipe("ruby_build")
    chef.add_recipe("rbenv::system")
    chef.add_recipe("rbenv::user")
    chef.add_recipe("trema_sliceable_switch")
  end

  config.vm.provision :serverspec do |spec|
    spec.pattern = 'spec/*/*_spec.rb'
  end

end
