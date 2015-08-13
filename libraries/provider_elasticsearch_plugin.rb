class Chef::Provider
  class ElasticsearchPlugin < Chef::Provider::LWRPBase
    use_inline_resources

    def whyrun_supported?
      true
    end

    provides :elasticsearch_plugin

    [:install, :remove].each do |a|
      action a do
        r = new_resource

        cmd = ["bin/plugin --#{a} #{r.name}"]
        cmd[0] += "/#{r.version}" if r.version
        cmd << "--url #{r.url}" if r.url

        e = execute "install-elasticsearch-plugin-#{r.name}" do
          cwd '/usr/share/elasticsearch'
          command cmd.join(' ')
        end

        new_resource.updated_by_last_action(e.updated_by_last_action?)
      end
    end
  end
end
