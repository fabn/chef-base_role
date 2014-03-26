require 'spec_helper'

describe 'Name resolution configuration' do

  describe file('/etc/resolv.conf') do

    it { should be_file }
    it { should_not be_linked_to '../run/resolvconf/resolv.conf' }
    its(:content) { should match /vagrantup.com/ }
    its(:content) { should match /8.8.8.8/ }
    its(:content) { should match /8.8.4.4/ }
  end

  # this is equal to say /etc/resolv.conf should not be a link
  # serverspec seems to not have such matcher
  describe command('find /etc -name resolv.conf -type l') do
    it { should_not return_stdout %r{/etc/resolv.conf} }
  end

end
