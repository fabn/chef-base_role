RSpec.describe 'base_role::default' do

  subject do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  before do
    stub_data_bag('secrets').and_return([])
    stub_command('test -d /etc/zsh').and_return(true)
  end

  it { should include_recipe 'hostname' }
  it { should include_recipe 'system_base' }
  it { should include_recipe 'system_base::secrets' }
  it { should include_recipe 'system_base::locale' }
  it { should include_recipe 'system_base::rc_files' }
  it { should include_recipe 'ntp' }
  it { should include_recipe 'git' }
  it { should include_recipe 'timezone-ii' }
  it { should include_recipe 'base_role::resolver' }

end
