# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  config.vm.hostname = "jiridev"
  config.vm.synced_folder "~", "/vagrant_home", mount_options: ["uid=9000", "gid=9000"]
  if ARGV[0] == "ssh"
    config.ssh.username = "jiri"
    config.ssh.private_key_path = "~/.ssh/id_rsa"
  end
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "8192"
    vb.cpus = "2"
  end
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook_vagrant.yml"
    ansible.verbose = true
    ansible.vault_password_file = "/vagrant_home/.vaultp"
    ansible.extra_vars = {
      hostname: "jiridev",
      yaourt_user: "vagrant"
    }
  end
end
