class Chef::Resource
  class ElasticsearchPlugin  < Chef::Resource::LWRPBase
    self.resource_name = :elasticsearch_plugin
    provides :elasticsearch_plugin

    actions :install, :uninstall
    default_action :install

    attribute :url, kind_of: String, default: nil, required: true
    attribute :version, kind_of: [String, Numeric], default: nil
  end
end
