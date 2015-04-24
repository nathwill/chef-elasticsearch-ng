#
# Cookbook Name:: elasticsearch-ng
# Recipe:: default
#

template node['elasticsearch']['conf_file'] do
  source 'es.config.erb'
  variables conf: node['elasticsearch']['config']
end

template node['elasticsearch']['env_file'] do
  source 'es.env.erb'
  variables env: node['elasticsearch']['env']
end
