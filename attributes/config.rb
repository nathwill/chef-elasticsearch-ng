default['elasticsearch']['config'].tap do |c|
  c['cluster.name'] = node.chef_environment
  c['node.name'] = node.name
end
