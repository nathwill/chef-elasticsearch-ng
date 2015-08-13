class Chef::Provider
  class ElasticsearchPlugin < Chef::Provider::LWRPBase
    use_inline_resource

    def whyrun_supported?
      true
    end

    provides :elasticsearch_plugin

    action :install do

    end

    action :uninstall do

    end
  end
end
