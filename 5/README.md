### Ejercicio 5
#### Aprovisionamiento via shell

El siguiente es un ejemplo de aprovisionamiento de un vagrant box con shell, tambien se agrega port forwarding y shared folder que edita y expone el index.html de nginx en el puerto 8080 del host anfitrion.

```ruby
# vagrantfile
Vagrant.configure('2') do |config|
  config.vm.define "node" do |node|
    node.vm.network :private_network, ip: "10.10.0.4"
    node.vm.network "forwarded_port", guest: 80, host: 8080
    node.vm.box = "ubuntu/impish64"
    node.vm.hostname = 'debian'
    node.vm.synced_folder 'html', '/var/www/html'
    node.vm.provision :shell,
      path: "bootstrap.sh"
      # inline: "echo Hello, World" // inline: $script
    node.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "4048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
  end
end
```
```bash
#!/usr/bin/env bash
# establecemos la interfaz de debian como no interactiva
export DEBIAN_FRONTEND=noninteractive

sudo apt-get update
sudo apt-get -y install openssh-server
sudo apt-get -y install net-tools
sudo apt-get -y install vim
sudo apt-get -y install nginx
exit
```



