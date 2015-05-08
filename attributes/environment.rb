default['elasticsearch']['env'].tap do |e|
  e['es_home'] = '/usr/share/elasticsearch'
  e['max_open_files'] = 65_535
  e['max_map_count'] = 262_144
  e['log_dir'] = '/var/log/elasticsearch'
  e['data_dir'] = '/var/lib/elasticsearch'
  e['work_dir'] = '/tmp/elasticsearch'
  e['conf_dir'] = '/etc/elasticsearch'
  e['conf_file'] = '/etc/elasticsearch/elasticsearch.yml'
  e['es_user'] = 'elasticsearch'
  e['es_heap_size'] = "#{(node['memory']['total'].to_i * 0.6).floor / 1024}m"
end
