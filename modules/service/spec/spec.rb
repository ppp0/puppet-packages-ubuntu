require 'spec_helper'

describe 'Systemd service definition' do

  describe file('/etc/systemd/system/foo-oneshot.service') do
    it { should be_file }
  end

  describe file('/etc/systemd/system/foo-daemon.service') do
    it { should be_file }
  end

  describe service('foo-oneshot') do
    it { should be_enabled }
  end

  describe service('foo-daemon') do
    it { should be_enabled }
    it { should be_running }
  end

  describe file('/tmp/out') do
    it { should be_file }
    its(:content) { should match /foo/}
    its(:content) { should_not match /Content that should be discarded/}

  end

  describe file('/tmp/out-daemon') do
    it { should be_file }
    its(:content) { should match /alive and kicking/}
  end

end
