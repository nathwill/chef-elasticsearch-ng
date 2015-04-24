#
# Cookbook Name:: elasticsearch-ng
# Recipe:: default
#

service 'elasticsearch' do
  action [:enable, :start]
end
