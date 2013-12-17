#
# Cookbook Name:: openvnet
# Recipe:: default
#
# Copyright 2013, OTA Hiroshi
#
# All rights reserved
#

yum_repository "openvnet" do
  description "openvnet repository"
  url "http://dlc.openvnet.axsh.jp/packages/rhel/6/vnet/current/"
  action :add
end

yum_repository "openvnet-third-party" do
  description "openvnet-third-party repository"
  url "http://dlc.openvnet.axsh.jp/packages/rhel/6/third_party/current/"
  action :add
end
