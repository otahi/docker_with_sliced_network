require 'spec_helper'

describe file('/etc/yum.repos.d/epel.repo') do
  it { should be_file }
  it { should contain "Extra Packages for Enterprise Linux" }
end
