#
# Cookbook Name:: elasticsearch-ng
# Recipe:: default
#

es = node['elasticsearch']

if platform_family?('debian')
  include_recipe 'apt'

  apt_repository 'elasticsearch' do
    key "#{es['base_url']}/GPG-KEY-elasticsearch"
    uri "#{es['base_url']}/elasticsearch/#{es['version']}/debian"
    components %w( stable main )
    notifies :run, 'execute[apt-get update]', :immediately
  end
end

yum_repository 'elasticsearch' do
  description "Elasticsearch repository for #{es['version']} packages"
  baseurl "#{es['base_url']}/elasticsearch/#{es['version']}/centos"
  gpgkey "#{es['base_url']}/GPG-KEY-elasticsearch"
  gpgcheck true
  enabled true
  only_if { platform_family?('rhel') }
end
