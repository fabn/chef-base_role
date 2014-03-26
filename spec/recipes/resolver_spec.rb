require 'spec_helper'

describe 'base_role::resolver' do

  subject do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  before do
    ::File.stub(:delete) # Prevent actual deletion of files, just in case
    ::File.stub(symlink?: false)
  end

  it 'should delete symlinked version of resolv.conf' do
    ::File.should_receive(:delete).with('/etc/resolv.conf')
    ::File.stub(symlink?: true)
    # Actually execute the resource, credits: https://gist.github.com/retr0h/3808196#comment-580927
    subject.resource_collection.first { |r| r.name == 'disable ubuntu resolvconf' }.old_run_action(:create)
  end

  it 'should set defaults nameservers if none given' do
    subject.node[:resolver][:nameservers].should == %w(8.8.8.8 8.8.4.4)
  end

  it { should include_recipe 'resolver' }

end
