require 'spec_helper'

trema_apps_dir = "/opt/trema/apps"

describe package('sqlite') do
  it { should be_installed }
end

describe package('perl-DBD-SQLite') do
  it { should be_installed }
end

describe package('trema') do
  it { should be_installed.by('gem') }
end

%w(topology flow_manager sliceable_switch).each do |app|
  describe file("#{trema_apps_dir}/#{app}/#{app}") do
    it { should be_executable}
  end
end

%w(filter.db slice.db).each do |db|
  describe file("#{trema_apps_dir}/sliceable_switch/#{db}") do
    it { should be_file}
  end
end

describe 'trema_sliceable_switch' do
  describe port(6653) do
    it { should be_listening.with('tcp') }
  end
end

describe 'open_flow_switch' do
  describe command('ovs-vsctl show') do
    it { should return_stdout /ofs0/ }
    it { should return_stdout /6653/ }
  end
end
