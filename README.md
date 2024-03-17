# Info

This repository setup test environment (using Vagrant) to test [JoliNotif](https://github.com/jolicode/JoliNotif).
JoliNotif is a cross-platform PHP library to display desktop notifications.

Icons downloaded from [numix-icon-theme-circle](https://github.com/numixproject/numix-icon-theme-circle)

## Usage

Call `vagrant status` to see which virtual machines are provided
Example output:

```
ubuntu24                  poweroff (virtualbox)
ubuntu22                  poweroff (virtualbox)
ubuntu20                  poweroff (virtualbox)
fedora39                  poweroff (virtualbox)
```

Call `vagrant up ubuntu24` to start virtual machine "ubuntu24".
Wait few minutes to provision virtual machine, when machine will be ready call `vagrant reload ubuntu24`.
This command will restart virtual machine. After booting you should see a login screen.

Use vagrant/vagrant for log in to vm.
In VM open terminal go to directory vagrant - `cd /vagrant`
Next run command `make clean` then `composer install` and finally `make test-memory-leaks`
During this test, you should see notifications.
After the test you should see summary of potential memory leaks.
