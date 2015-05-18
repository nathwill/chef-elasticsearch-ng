#
# Cookbook Name:: elasticsearch-ng
# Recipe:: default
#

Chef::Recipe, Chef::Resource].each { |l| l.send :include, ::Extensions }

%w( repo install configure service plugins).each do |r|
  include_recipe "#{cookbook_name}::#{r}"
end
