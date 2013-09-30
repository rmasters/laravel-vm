# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  # Add your Laravel app here
  #config.vm.synced_folder "../path/to/my/app", "/srv/app"

  # Web - development site
  config.vm.network :forwarded_port, guest: 80, host: 8500
  # Beanstalkd Console
  config.vm.network :forwarded_port, guest: 8501, host: 8501
  # Redis Commander
  config.vm.network :forwarded_port, guest: 8502, host: 8502

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.name = "laravel"
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  # If Ansible is not installed on the host (i.e. Windows), we install it
  # on the guest and then provision it locally.
  if Vagrant::Util::Platform.windows?
    config.vm.provision :shell, path: "install_ansible_guest.sh"
    config.vm.provision :shell, inline: "sudo -i ansible-playbook --connection=local /vagrant/playbook.yml"
  else
    config.vm.provision :ansible do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end

end
