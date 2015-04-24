
default['java']['jdk_version'] = 7

default['elasticsearch'].tap do |es|
  es['version'] = 1.5
  es['base_url'] = 'http://packages.elasticsearch.org'
  es['conf_file'] = '/etc/elasticsearch/elasticsearch.yml'
  es['env_file'] = value_for_platform_family(
    'rhel' => '/etc/sysconfig/elasticsearch',
    'debian' => '/etc/default/elasticsearch'
  )
end
