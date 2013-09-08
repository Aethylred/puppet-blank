# blank

This is a blank puppet module.

*NOTE:* Check README1st.markdown for usage of the blank puppet module template.

# Licensing

Update your license details here.

# Attribution

## `puppet-blank` for Puppet Module generation

This module is derived from the puppet-blank module by Aaron Hicks (aethylred@gmail.com)

* https://github.com/Aethylred/puppet-blank

This module has been developed for the use with Open Source Puppet (Apache 2.0 license) for automating server & service deployment.

* http://puppetlabs.com/puppet/puppet-open-source/

## `puppet-bootstrap` for bootstrapping Puppet into Vagrant

The Puppet bootstrap scripts are modified from the [Vagrant](http://www.vagrantup.com/) puppet-bootstrap scripts provided by Hashicorp.

* https://github.com/hashicorp/puppet-bootstrap

The current `Vagrantfile` is configured to use the box [CentOS NoCM Virtualbox](http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box) from the [PuppetLabs box repository](http://puppet-vagrant-boxes.puppetlabs.com/)

### Using the current Vagrant configuration

* Add the Vagrant box to your collection: 

```
$ vagrant box add centos-64-x64-vbox4210-nocm http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box
``` 

*  Start the box: 

```
$ vagrant up
```

### Changing the Vagrant configuration

To use a different Vagrant configuration, add a different base box to your collection and edit the Vagrantfile to specify it. If the base OS of the box is different, specify the correct Puppet bootstrap script by altering the line:

```ruby
  config.vm.box = "centos-64-x64-vbox4210-nocm"
```

### Testing the Puppet module

Vagrant will mount the module directory from the host as `/vagrant` within the VM, so to run the smoke tests, logged in as root on the VM run:

```
$ puppet agent -t /vagrant/tests/init.pp
```

More complex Puppet modules (i.e. those with dependencies on other Puppet modules) may require additional configuration, such as installing dependent puppet modules and adding the `/vagrant` directory to the Puppet `modulepath`.

# Gnu General Public License

This file is part of the blank Puppet module.

The blank Puppet module is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

The blank Puppet module is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the blank Puppet module.  If not, see <http://www.gnu.org/licenses/>.