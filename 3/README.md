### ejercicio 3
#### Creando una máquina virtual con mas especificaciones:

hostname: debian
ram: 4gb
cpu: 2

```ruby
Vagrant.configure('2') do |config|
  config.vm.define "master" do |master|
    master.vm.network :private_network, ip: "192.168.15.10"
    master.vm.box = "debian/buster64"
    master.vm.hostname = 'debian'
    master.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "4048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
end
```