
default['java']['jdk_version'] = 7

default['elasticsearch'].tap do |es|
  es['version'] = 1.7
  es['base_url'] = 'http://packages.elasticsearch.org'

  es['skip_restart'] = true

  es['search_query'] =
    "chef_environment:#{node.chef_environment} AND role:es_cluster"

  es['conf_file'] = '/etc/elasticsearch/elasticsearch.yml'
  es['env_file'] = value_for_platform_family(
    'rhel' => '/etc/sysconfig/elasticsearch',
    'debian' => '/etc/default/elasticsearch'
  )
end
