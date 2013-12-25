#
# Cookbook Name:: openvswitch
# Recipe:: default
#
# Copyright 2013, OTA Hiroshi
#
# All rights reserved
#

yum_packages = ["kmod-openvswitch-1.10.0-1.el6.x86_64.rpm","openvswitch-1.10.0-1.x86_64.rpm","openvswitch-debuginfo-1.10.0-1.x86_64.rpm"]

yum_packages.each do |pkg|
  yum_package pkg do
    source  "/vagrant/RPMS/x86_64/#{pkg}"
    action :install
  end
end

service "openvswitch" do
  action [:enable, :start]
end
