require 'spec_helper'

describe package('kmod-openvswitch') do
  it { should be_installed }
end

describe package('openvswitch') do
  it { should be_installed }
end

describe package('openvswitch-debuginfo') do
  it { should be_installed }
end

describe kernel_module('openvswitch') do
  it { should be_loaded }
end

describe service('openvswitch') do
  it { should be_enabled }
  it { should be_running }
end
