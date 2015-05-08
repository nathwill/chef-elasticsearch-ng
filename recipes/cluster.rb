#
# Cookbook Name:: elasticsearch-ng
# Recipe:: cluster
#

es_nodes = search(:node, node['elasticsearch']['search_query']).map do |n|
  n['ipaddress']
end

node.default['elasticsearch']['config'].tap do |c|
  c['gateway.expected_nodes'] = es_nodes.length
  c['discovery.zen.minimum_master_nodes'] = (es_nodes.length / 2 ).floor + 1
  c['discovery.zen.ping.unicast.hosts'] = es_nodes.inspect
  c["discovery.zen.ping.multicast.enabled"] = false
end

include_recipe cookbook_name
