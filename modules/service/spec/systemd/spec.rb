require 'spec_helper'

describe file('/etc/systemd/system/foo.service') do
  it { should be_file }
end

describe service('foo') do
  it { should be_running }
  it { should be_enabled }
end
