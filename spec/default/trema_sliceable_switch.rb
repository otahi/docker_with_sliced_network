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

%w(topology flow_mangager sliceable_switch).each do |app|
  describe file("#{trema_apps_dir}/#{app}/#{app}") do
    it { should be_executable}
  end
end

%w(filter.db slice.db).each do |db|
  describe file("#{trema_apps_dir}/sliceable_switch/#{db}") do
    it { should be_file}
  end
end
