#
# Cookbook Name:: elasticsearch-ng
# Recipe:: default
#
# Copyright 2015 Nathan Williams
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

es = node['elasticsearch']

if platform_family?('debian')
  include_recipe 'apt'

  apt_repository 'elasticsearch' do
    key 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
    uri "http://packages.elasticsearch.org/elasticsearch/#{es['version']}/debian"
    components %w( stable main )
    notifies :run, 'execute[apt-get update]', :immediately
  end
end

yum_repository 'elasticsearch' do
  description "Elasticsearch repository for #{es['version']} packages"
  baseurl "http://packages.elasticsearch.org/elasticsearch/#{es['version']}/centos"
  gpgkey 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
  gpgcheck true
  enabled true
  only_if { platform_family?('rhel') }
end
