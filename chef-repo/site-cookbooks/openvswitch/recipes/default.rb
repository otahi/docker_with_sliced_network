#
# Cookbook Name:: openvswitch
# Recipe:: default
#
# Copyright 2013, OTA Hiroshi
#
# All rights reserved
#

rpm_files = ["kmod-openvswitch-1.9.0-1.el6.x86_64.rpm", "openvswitch-1.9.0-1.x86_64.rpm", "openvswitch-debuginfo-1.9.0-1.x86_64.rpm"]

rpm_files.each do |rpm|
  remote_file "#{Chef::Config[:file_cache_path]}/#{rpm}" do
    source "https://github.com/otahi/vagrant-vm-with-ovs/raw/master/RPMS/centos64/x86_64/#{rpm}"
    action :create
  end
end


rpm_package "kmod-openvswitch" do
  source  "#{Chef::Config[:file_cache_path]}/kmod-openvswitch-1.9.0-1.el6.x86_64.rpm"
  action :install
end

rpm_package "openvswitch" do
  source  "#{Chef::Config[:file_cache_path]}/openvswitch-1.9.0-1.x86_64.rpm"
  action :install
end

rpm_package "openvswitch-debuginfo" do
  source  "#{Chef::Config[:file_cache_path]}/openvswitch-debuginfo-1.9.0-1.x86_64.rpm"
  action :install
end
