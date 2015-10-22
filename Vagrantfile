Vagrant.configure('2') do |config|
  if Vagrant.has_plugin?('vagrant-proxyconf')
    config.vm.synced_folder '.proxy-cache', '/tmp/proxy-cache', :owner => 'proxy', :create => true
    if ['true', '1'].include?(ENV['DISABLE_PROXY'])
      config.proxy.https = false
      config.proxy.http = false
    else
      config.proxy.https = 'http://localhost:8123/'
      config.proxy.http = 'http://localhost:8123/'
      config.proxy.no_proxy = '127.0.0.1,localhost'
    end
  else
    warn("Installing the vagrant plugin 'vagrant-proxyconf' is highly recommended for dramatic performance gains. \nRun\n \`vagrant plugin install vagrant-proxyconf\` to install it")
  end

  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'spec'
    puppet.manifest_file = 'provision.pp'
    puppet.module_path = 'modules'
  end

  config.vm.define 'vivid', primary: true do |vivid|
    vivid.vm.box = 'cargomedia/ubuntu-1504-default'
    # Additional network card to test module network (TODO: add resource type network::interface)
    vivid.vm.network :private_network, ip: '10.10.15.4', auto_config: false
  end
end
