# Virtual machines for Ciao

This directory contains definitions for virtual machines (as Vagrant
templates, aka _boxes_) for most of the platforms supported by
[Ciao](http://github.com/ciao-lang/ciao). Use the images as base for
development, testing, or deployment environments for Ciao.

[Vagrant](https://www.vagrantup.com/) is a a higher-level wrapper
around virtualization software such as VirtualBox, VMware, KVM and
Linux Containers (LXC), and around configuration management software
such as Ansible, Chef, Salt and Puppet) (see
[wikipedia](https://en.wikipedia.org/wiki/Vagrant_(software)) for more
details)

# Usage

 - Install Vagrant (and VirtualBox).
 - Check in `VirtualBox`/`Preferences...` that VMs are stored in a
   partition with enough space (typical Unix-based OSes may need
   1-4GB, Windows around 20GB).
 - Change directory to the desired image.
 - Do `vagrant init` (only if no `Vagrantfile` config file present)
   and `vagrant up`. 
 - Login using `vagrant ssh` or click on running VirtualBox instance.
 - Other useful commands:
   - `vagrant reload` --provision 
   - `vagrant suspend`
   - `vagrant resume`
   - `vagrant destroy` - to delete the virtual machine

You may also use the `boxes.pl` Ciao script.

# Notes about the included _boxes_

These templates are based on pre-installed images created by the
Vagrant community and available from:

 - [http://www.vagrantbox.es/](http://www.vagrantbox.es/)
 - [https://atlas.hashicorp.com/boxes/search](https://atlas.hashicorp.com/boxes/search)

 
