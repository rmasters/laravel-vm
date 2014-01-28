# laravel-vm

A recipe for building a development VM for working on Laravel and apps.

- PHP 5.5
- MySQL
- PostgreSQL
- Redis (w/web frontend)
- Memcached
- SQLite
- Beanstalkd (w/web frontend)

To add your app to the virtual machine, open Vagrantfile and edit
[line 12](Vagrantfile#L12) ("Add your Laravel app here") with the relative path
to your app on your local (host) machine. This will then be available on
[localhost:8500](http://localhost:8500) once the machine is booted.

This uses Ansible on your host machine to provison, but installs it on the guest
machine [if your host is running Windows][ansible-windows].

I strongly recommend using [this Vagrant plugin][vbguest] that makes sure your
VirtualBox guest additions are up-to-date. If you have issues when bringing your
VM down and back up again this can help.

    vagrant up
    # If provisioning doesn't happen: (i.e. lots of shell output)
    vagrant provision

The following ports are exposed:

-   Your Laravel app - [localhost:8500](http://localhost:8500)
-   Beanstalk Console - [localhost:8501](http://localhost:8501)
-   Redis Commander - [localhost:8502](http://localhost:8502) (currently broken,
    see [#1](https://github.com/rmasters/laravel-vm/issues/1))

Connect to the following services in your app or by using clients on your host
by tunnelling through SSH (run `vagrant ssh-config` to find which local port):

-   MySQL - 127.0.0.1:3306
-   PostgreSQL - 127.0.0.1:5432
-   Redis - 127.0.0.1:6379

To tunnel through SSH use the username **vagrant** and the SSH key in
**~/.vagrant.d/insecure_private_key**.

[MIT licensed](LICENSE).

[ansible-windows]: https://groups.google.com/d/msg/ansible-project/17YZIgArn2g/vY-QDVVUKusJ
[vbguest]: https://github.com/dotless-de/vagrant-vbguest
