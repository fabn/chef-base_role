RSpec.describe 'base_role::resolver' do

  subject do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  before do
    allow(::File).to receive(:delete) # Prevent actual deletion of files, just in case
    allow(::File).to receive(:symlink?).and_return false
  end

  it 'should delete symlinked version of resolv.conf' do
    expect(::File).to receive(:symlink?).and_return true
    # Actually execute the resource, credits: https://gist.github.com/retr0h/3808196#comment-580927
    subject.resource_collection.first { |r| r.name == 'disable ubuntu resolvconf' }.old_run_action(:create)
  end

  it 'should set defaults nameservers if none given' do
    expect(subject.node[:resolver][:nameservers]).to eq %w(8.8.8.8 8.8.4.4)
  end

  it { should include_recipe 'resolver' }

end
