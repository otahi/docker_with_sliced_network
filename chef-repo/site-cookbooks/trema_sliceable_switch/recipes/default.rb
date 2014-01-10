#
# Cookbook Name:: trema_sliceable_switch
# Recipe:: default
#
# Copyright 2014, OTA Hiroshi
#
# All rights reserved
#

trema_dir = "/opt/trema"
trema_apps_dir = "#{trema_dir}/apps"

directory trema_apps_dir do
  action :create
  recursive true
end

%w(gcc make glib2 glib2-devel ruby-devel libpcap-devel sqlite perl-DBD-SQLite perl-Time-HiRes).each do |pkg|
  package pkg do
    action :install
  end
end

gem_package "trema" do
  action :install
  options("--force")
end

git trema_apps_dir do
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
    ./create_tables.sh
  EOH
end
