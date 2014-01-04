require 'spec_helper'

trema_apps_dir = "/vagrant/trema/apps"

describe package('sqlite') do
  it { should be_installed }
end

describe package('perl-DBD-SQLite') do
  it { should be_installed }
end

describe package('trema') do
  it { should be_installed.by('gem') }
end

%w(topology flow_mangager slicealbe_switch).each do |app|
  describe file("#{trema_apps_dir}/#{app}/#{app}") do
    it { should be_executable}
  end
end
