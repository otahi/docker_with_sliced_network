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

#TODO test installed object for trema-apos
# topology / flow_mangager / slicealbe_switch
#describe file("#{trema_apps_dir}/") do
#  it { should be_executable}
#end
