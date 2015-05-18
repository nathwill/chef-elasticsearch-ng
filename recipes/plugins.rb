directory "#{node.elasticsearch[:env][:es_home]}/plugins/" do
  owner node.elasticsearch[:env][:es_user]
  group node.elasticsearch[:env][:es_user]
  mode 0755
  recursive true
end

node[:elasticsearch][:plugins].each do | name, config |
  install_plugin name, config
end
