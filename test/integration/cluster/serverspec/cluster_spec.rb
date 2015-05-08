require 'spec_helper'

describe 'cluster recipe' do
  describe file('/etc/elasticsearch/elasticsearch.yml') do
    its(:content) { should match /gateway.expected_nodes: 3/ }
    its(:content) { should match /discovery.zen.minimum_master_nodes: 2/ }
    its(:content) { should match /discovery.zen.ping.multicast.enabled: false/ }
    its(:content) { should match /discovery.zen.ping.unicast.hosts: \["12.34.56.78", "12.34.56.89", "12.34.56.90"\]/ }
  end
end
