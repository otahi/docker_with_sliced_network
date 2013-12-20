#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2013, OTA Hiroshi
#
# All rights reserved
#

["libcgroup", "lxc-libs", "lxc", "docker-io"].each do |pkg|
  package pkg do
    action :install
  end
end

service "docker" do
  action [ :enable , :start ]
end
