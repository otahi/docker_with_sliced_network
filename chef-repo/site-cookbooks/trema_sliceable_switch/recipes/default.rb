#
# Cookbook Name:: trema_sliceable_switch
# Recipe:: default
#
# Copyright 2014, OTA Hiroshi
#
# All rights reserved
#

trema_apps_dir = "/vagrant/trema/apps"

["sqlite", "perl-DBD-SQLite"].each do |pkg|
  package pkg do
    action :install
  end
end

gem_package "trema" do
  action :install
end

git "#{trema_apps_dir}" do
  repository "https://github.com/trema/apps.git"
  reference "master"
  action :sync
end

bash "apps/topology" do
  cwd "#{trema_apps_dir}/topology"
  code <<-EOH
    make
  EOH
end

bash "apps/flow_manager" do
  cwd "#{trema_apps_dir}/flow_manager"
  code <<-EOH
    make
  EOH
end

bash "apps/sliceable_switch" do
  cwd "#{trema_apps_dir}/sliceable_switch"
  code <<-EOH
    make
  EOH
end
