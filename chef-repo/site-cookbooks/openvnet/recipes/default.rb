#
# Cookbook Name:: openvnet
# Recipe:: default
#
# Copyright 2013, OTA Hiroshi
#
# All rights reserved
#

yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  action :add
end

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
