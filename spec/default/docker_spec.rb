require 'spec_helper'

describe package('libcgroup') do
  it { should be_installed }
end

describe package('lxc-libs') do
  it { should be_installed }
end

describe package('lxc') do
  it { should be_installed }
end

describe package('docker-io') do
  it { should be_installed }
end

describe service('docker') do
  it { should be_running }
  it { should be_enabled }
end

