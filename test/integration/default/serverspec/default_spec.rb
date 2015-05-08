require 'spec_helper'

describe 'elasticsearch-ng::default' do
  if os[:family] == 'redhat'
    repo_file = '/etc/yum.repos.d/elasticsearch.repo'
  elsif os[:family] == 'debian'
    repo_file = '/etc/apt/sources.list.d/elasticsearch.list'
  end

  describe file(repo_file) do
    its(:content) { should match /packages.elasticsearch.org/ }
  end

  describe package('elasticsearch') do
    it { should be_installed }
  end

  describe file('/etc/elasticsearch/elasticsearch.yml') do
    its(:content) { should match /cluster.name: _default/ }
    its(:content) { should match /http.port: 9200/ }
    its(:content) { should match /node.max_local_storage_nodes: 1/ }
    its(:content) { should match /bootstrap.mlockall: true/ }
  end

  if os[:family] == 'redhat'
    env_file = '/etc/sysconfig/elasticsearch'
  elsif os[:family] == 'debian'
    env_file = '/etc/default/elasticsearch'
  end

  describe file(env_file) do
    its(:content) { should match %r{ES_HOME=/usr/share/elasticsearch} }
    its(:content) { should match /MAX_OPEN_FILES=65535/ }
    its(:content) { should match /ES_USER=elasticsearch/ }
    its(:content) { should match %r{CONF_FILE=/etc/elasticsearch/elasticsearch.yml} }
  end

  describe service('elasticsearch') do
    it { should be_enabled }
    it { should be_running }
  end
end
