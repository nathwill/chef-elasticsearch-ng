#
# Cookbook Name:: elasticsearch-ng
# Recipe:: default
#

%w( repo install configure service ).each do |r|
  include_recipe "#{cookbook_name}::#{r}"
end
