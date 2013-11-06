# blank

This is a blank puppet module.

*NOTE:* Check README1st.markdown for usage of the blank puppet module template.

# Licensing

Update your license details here.

# Attribution

## puppet-blank

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

Vagrant will mount the module directory from the host as `/vagrant` within the VM, and these have to be added to the Puppet configuration. Add the `/vagrant` directory to the Puppet `modulepath` in `/etc/puppet/puppet.conf` to the `[main]` block:

```
modulepath = $confdir/modules:/usr/share/puppet/modules:/vagrant/
```

**Note:** the module path separator is : in POSIX and ; under Windows.


To run the smoke tests, logged in as root on the VM run:

```
$ puppet apply /vagrant/tests/init.pp
```

More complex Puppet modules (i.e. those with dependencies on other Puppet modules) may require additional configuration, such as installing the dependencies and adding them to the Puppet configuration.

## rspec-puppet-augeas

This module includes the [Travis](https://travis-ci.org) configuration to use [`rspec-puppet-augeas`](https://github.com/domcleal/rspec-puppet-augeas) to test and verify changes made to files using the [`augeas` resource](http://docs.puppetlabs.com/references/latest/type.html#augeas) available in Puppet. Check the `rspec-puppet-augeas` [documentation](https://github.com/domcleal/rspec-puppet-augeas/blob/master/README.md) for usage.

This will require a copy of the original input files to `spec/fixtures/augeas` using the same filesystem layout that the resource expects:

    $ tree spec/fixtures/augeas/
    spec/fixtures/augeas/
    `-- etc
        `-- ssh
            `-- sshd_config

# Gnu General Public License

This file is part of the blank Puppet module.

The blank Puppet module is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

The blank Puppet module is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with the blank Puppet module.  If not, see <http://www.gnu.org/licenses/>.
