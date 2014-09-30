require 'spec_helper'

describe 'Default recipe' do

  describe 'Hostname configuration' do

    describe command('hostname --fqdn') do
      it { should return_stdout 'base.vagrantup.com' }
    end

  end

  describe 'Installed package from system base' do

    %w(tree psmisc tmux autojump curl).each do |pkg|

      describe package(pkg) do
        it { should be_installed }
      end

    end

  end

  describe 'Ntp server' do

    describe service('ntp') do
      it { should be_running }
      it { should be_enabled }
    end

    describe file('/etc/ntp.conf') do
      it { should be_file }
      its(:content) { should match /0\.pool\.ntp\.org/ }
    end

  end

  describe package('git') do
    it { should be_installed }
  end

  # Timezone configuration
  describe command('date +%Z') do
    it { should return_stdout /CES?T/ }
  end

end