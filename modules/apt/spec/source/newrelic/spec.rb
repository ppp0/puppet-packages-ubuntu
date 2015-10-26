require 'spec_helper'

describe 'apt::source::newrelic' do

  describe file('/etc/apt/sources.list.d/newrelic.list') do
    it { should be_file }
  end
end
