require 'spec_helper'

describe 'do-collectd::default' do

  describe 'ubuntu' do
    let(:runner) { ChefSpec::ServerRunner.new(UBUNTU_OPTS) }
    let(:node) { runner.node }
    let(:chef_run) do
      runner.converge(described_recipe)
    end

    it 'includes the `apt` recipe' do
      expect(chef_run).to include_recipe('apt')
    end

    it 'installs collectd' do
      expect(chef_run).to install_package('collectd')
    end

    it 'installs collectd-utils' do
      expect(chef_run).to install_package('collectd-utils')
    end

    it 'creates the collectd.conf' do
      expect(chef_run).to create_template('/etc/collectd/collectd.conf')
    end
  end
end
