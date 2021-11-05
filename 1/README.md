### ejercicio 1
#### Ejecutar los siguientes comandos:

```shell
$ vagrant init hashicorp/precise32
$ vagrant up
$ vagrant ssh
```
#### Qué es lo que sucede?

los comandos anteriores crean un archivo vagrantfile, y levantan una máquina virtual con la imagen hashicorp/precise32, luego, realiza una conexión ssh a la nueva máquina

los archivos necesarios se descargan en la ruta
```
 ~/.vagrant.d/boxes/
```

#### eso es todo !!!