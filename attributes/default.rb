default['java']['jdk_version'] = 7
default['elasticsearch']['version'] = 1.5

default['elasticsearch']['conf_file'] = '/etc/elasticsearch/elasticsearch.yml'
default['elasticsearch']['env_file'] = value_for_platform_family(
  'rhel' => '/etc/sysconfig/elasticsearch',
  'debian' => '/etc/default/elasticsearch'
)
