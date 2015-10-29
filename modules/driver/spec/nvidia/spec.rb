require 'spec_helper'

describe 'Install nvidia driver' do

  describe package('nvidia-346') do
    it { should be_installed }
  end
end
