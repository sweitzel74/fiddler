# encoding: UTF-8
describe 'fiddler::default' do

  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should include the dotnetframework' do
    expect(chef_run).to include_recipe 'dotnetframework'
  end

  it 'should install Fiddler' do
    expect(chef_run).to install_windows_package('Fiddler').with(
      source: chef_run.node['fiddler']['url'],
      checksum: chef_run.node['fiddler']['checksum']
    )
  end
end
