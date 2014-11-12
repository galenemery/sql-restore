require 'spec_helper'

describe 'skeleton::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'installs sample package' do
    expect(chef_run).to install_package 'vim'
  end

  it 'does something' do
    skip 'Replace this test with meaningful tests'
  end
end
