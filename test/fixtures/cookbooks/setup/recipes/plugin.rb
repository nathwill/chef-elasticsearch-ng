
elasticsearch_plugin 'elasticsearch/elasticsearch-cloud-aws' do
  version '2.7.0'
  unless node['elasticsearch']['skip_restart']
    notifies :restart, 'service[elasticsearch]', :delayed
  end
end
