# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  VBoxGuestAdditions = `vboxmanage --version`.match(/^(\d+\.\d+\.\d+)/)[1].to_s
  puts "VBoxGuestAdditions to install '#{VBoxGuestAdditions}'"

  def configure_virtualbox(vb, nestedpaging = true, graphicsController = nil)
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2560"

    # Change number of cpuss
    vb.cpus = 2

    # Set the video memory to 128Mb:
    vb.customize ["modifyvm", :id, "--vram", "128"]
    # Enable 3D acceleration:
    vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    # Turn off virtualization acceleration nested paging
    vb.customize ["modifyvm", :id, "--nestedpaging", "off"] unless nestedpaging
    vb.customize ["modifyvm", :id, "--graphicscontroller", graphicsController] unless graphicsController.nil?
  end

  config.vm.define "ubuntu24", autostart: false do |machine|
    machine.vm.box = "ubuntu/noble64"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    machine.vm.provider "virtualbox" do |vb|
      configure_virtualbox vb, false, "vmsvga"
    end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    machine.vm.provision "shell" do |s|
      s.path = "ubuntu.sh"
      s.args   = [VBoxGuestAdditions, "php8.3", 1]
    end
  end

  config.vm.define "ubuntu22", autostart: false do |machine|
    machine.vm.box = "ubuntu/jammy64"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    machine.vm.provider "virtualbox" do |vb|
      configure_virtualbox vb, false, "vmsvga"
    end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    machine.vm.provision "shell" do |s|
      s.path = "ubuntu.sh"
      s.args   = [VBoxGuestAdditions, "php8.1", 1]
    end
  end

  config.vm.define "ubuntu20", autostart: false do |machine|
    machine.vm.box = "ubuntu/focal64"

    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    machine.vm.provider "virtualbox" do |vb|
      configure_virtualbox vb
    end

    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    machine.vm.provision "shell" do |s|
      s.path = "ubuntu.sh"
      s.args   = [VBoxGuestAdditions, "php8.1", 0]
    end
  end

  config.vm.define "fedora39", autostart: false do |machine|
      machine.vm.box = "fedora/39-cloud-base"
      machine.vm.box_version = "39.20231031.1"

      # Provider-specific configuration so you can fine-tune various
      # backing providers for Vagrant. These expose provider-specific options.
      machine.vm.provider "virtualbox" do |vb|
        configure_virtualbox vb
      end

      # Enable provisioning with a shell script. Additional provisioners such as
      # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
      # documentation for more information about their specific syntax and use.
      machine.vm.provision "shell" do |s|
        s.path = "fedora.sh"
        s.args   = [VBoxGuestAdditions, "php83"]
      end
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessable to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true
  #
  # View the documentation for the provider you are using for more
  # information on available options.
end
