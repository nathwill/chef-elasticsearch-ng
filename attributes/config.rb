default['elasticsearch']['config'].tap do |c|
  c['cluster.name'] = node.chef_environment
  c['node.name'] = node.name

  c['http.port'] = 9_200
  c['transport.tcp.port'] = 9_300
  c['discovery.zen.ping.multicast.port'] = 54_328

  c['node.max_local_storage_nodes'] = 1
  c['bootstrap.mlockall'] = true
  c['action.auto_create_index'] = true
  c['action.disable_delete_all_indices'] = true
  c['script.disable_dynamic'] = true
end
