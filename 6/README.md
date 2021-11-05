### Ejercicio 6

#### Aprovisionamiento con ansible

```ruby
# vagrantfile:
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/impish64"
  config.vm.network :private_network, ip: "10.10.0.10"
  config.vm.network "forwarded_port", guest: 80, host: 8081
  config.vm.provision "ansible", run: "always" do |ansible|
    ansible.playbook = "steps.yml"
  end
  config.vm.synced_folder 'html', '/var/www/html'
end
```

```yml
# ansible
- hosts: all
  become: true
  tasks:
    - name: Instalar git
      apt: name=git state=present update_cache=true
    - name: Instalar postgresql
      apt: name=postgresql state=present
    - name: Instalar nginx
      apt: name=nginx state=present
```
