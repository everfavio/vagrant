### ejercicio 4
####  Creando multiples maquinas virtuales
Con el siguiente vagrantfile hacemos uso de un array de propiedades para usarlas al momento de crear maquinas virtuales

```ruby
hosts = [
  {name: 'box01', ip: '10.10.0.1'},
  {name: 'box02', ip: '10.10.0.2'},
  {name: 'box03', ip: '10.10.0.3'}
]
Vagrant.configure('2') do |config|
  hosts.each do |host|
    config.vm.define host[:name] do |node|
      node.vm.network :private_network, ip: host[:ip]
      node.vm.box = "debian/buster64"
      node.vm.hostname = host[:name]
      node.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.customize ["modifyvm", :id, "--memory", "4048"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
      end
    end
  end
end
```