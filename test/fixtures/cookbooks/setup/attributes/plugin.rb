
default['elasticsearch'].tap do |es|
  es['skip_restart'] = false
  es['config'].tap do |c|
    c['cloud.aws.access_key'] = 'AKVAIQBF2RECL7FJWGJQ'
    c['cloud.aws.secret_key'] = 'vExyMThREXeRMm/b/LRzEB8jWwvzQeXgjqMX+6br'
    c['plugin.mandatory'] = 'elasticsearch-cloud-aws'
  end
end
