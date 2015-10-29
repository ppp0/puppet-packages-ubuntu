require 'spec_helper'

describe 'environment' do

  describe file('/etc/environment') do
    it { should be_file }
    its(:content) { should match /foo=baz/}
    its(:content) { should match /alice=bob/}
  end

end
