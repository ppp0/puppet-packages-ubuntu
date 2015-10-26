require 'spec_helper'

describe 'helper::script' do

  describe 'Should write the env variable to a file and execute another write to file command only the first time' do

    describe file('/tmp/env') do
      it { should be_file }
      its(:content) { should match /message='Hello world'/}
    end

    describe file('/tmp/hello') do
      it { should be_file }
      its(:content) { should match /hello world/}
    end

    describe command('wc -l /tmp/hello') do
      its(:stdout) { should match /1/}
    end

  end
end
