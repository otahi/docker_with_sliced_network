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
