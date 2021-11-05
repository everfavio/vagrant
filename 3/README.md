### ejercicio 3
### Creando una máquina virtual con mas especificaciones:

```ruby
VAGRANTFILE_API_VERSION = '2'ܝ
HOST_NAME = 'box001'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = HOST_NAME
  config.vm.box = 'alphainternational/centos-6.5-x64'
  config.vm.network :private_network,
    ip: '192.168.56.65',
    netmask: '255.255.255.0'
  config.vm.provider :virtualbox do |vb|
    vb.name = HOST_NAME
    vb.customize [:modifyvm,:id, '--memory', 256]
  end
end
````