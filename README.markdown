# blank

This is a blank puppet module.

# Usage

Use this module to start a new blank puppet module with all the required components ready for submitting to Puppet Forge.

## Create a new blank module

1. Clone this repository:

    ```PowerShell
    git clone -o puppet-blank -b master git://github.com/Aethylred/puppet-blank.git /path/to/new/repository
    ```

1. Merge any `puppet-blank` feature branches that are required and resolve conflicts.
1. Use the `unblank.ps1` script to customise the blank template
1. Delete clean up blank with `cleanup.ps1`
1. Delete past git history and reinitialise git (optional, but recommended):

    ```PowerShell
    Remove-Item .\.git -Force -Recurse
    git init
    ```

1. Commit changes:

    ```PowerShell
    git add -A
    git commit -m 'Initial commit'
    ```

1. Add a new `origin` remote:

    ```PowerShell
    git remote add origin git@a.git.repo:reponame.git
    ```

1. Push your changes:

    ```PowerShell
    git push origin master
    ```

## Feature Branches

The `puppet-blank` template has a number of  branches that can be merged in to add additional features to your Puppet module.

* `rspec-augeas` This branch will update the Travis configuration to install [`rspec-puppet-augeas`](https://github.com/domcleal/rspec-puppet-augeas) which provides additional tests when using the Puppet [augeas resource](http://docs.puppetlabs.com/references/latest/type.html#augeas).
* `vagrant` This branch adds a Vagrantfile and instructions on how to use [Vagrant](http://www.vagrantup.com/) to test your Puppet module on a local virtual machine.

## Windows scripts

Provided are some Powershell scripts that can be used to manage the blank puppet module template.

## Enable execution of unsigned scripts

Powershell will not run unsigned scripts by default, this can be enabled by executing the following command in an Administrator Powershell. This is required before any of the other powershell scripts will run.

1. Click *Start* menu
1. Type "powershell" in the *Search programs and files* box, do not press enter.
1. When *Powershell* shows up in the search results, right click and select *Run as administrator*
1. Windows UAC may ask for permission to run as an administrator, click *Yes*
1. Run the following command in the administrator PowerShell:

    ```PowerShell
    set-executionpolicy remotesigned
    ```

1. Press *Enter* again to confirm the policy change

**NOTE:** You may need to repeat this in both PowerShell and PowerShell (x86) on 64-bit systems.

## Change author and module

This updates the author and module name using the `.orig` templates. This script can be re-run, creating new templates. This may not be advisable in later stages of module development.

1. Start Powershell in the blank module directory
1. Run the `unblank.ps1` script:

    ```PowerShell
    .\unblank.ps1 newauthor newmodule
    ```

1. Add the newly created files to the git version control:

    ```PowerShell
    git add Modulefile manifests\init.pp tests\init.pp
    ```

1. Commit these changes to git:

    ```PowerShell
    git commit -am "Unblanked module with newauthor and newmodule"
    ```

1. Add new remote repository:

    ```PowerShell
    git remote add origin git@git.repo.server:repository.git
    ```

1. Push changes to origin:

    ```PowerShell
    git push origin master
    ```

1. The new module is ready for further development

## Updating puppet-blank

Just merge from the puppet-blank remote, though conflicts will be expected:

```
git pull puppet-blank master
```

## Cleaning up the puppet-blank files
1. Start Powershell in the blank module directory
1. Run the cleanup script:

    ```PowerShell
    .\cleanup.ps1
    ```

1. Commit the changes to git:

    ```PowerShell
    git commit -am "Cleaned up with the puppet-blank cleanup script"
    ```

1. Push changes to remote:

    ```PowerShell
    git push origin master
    ```

**NOTE:** The cleanup script is *destructive* and will delete several files, including itself.

**NOTE:** The puppet-blank remote is read-only, it should not be possible to push to it.

## Prepare a module for submission to Puppet Forge

1. To perform this step, the module will need to be cloned to a Linux server where puppet has been installed, and that the `UNKNOWN` entries in the `Modulefile` have been corrected.
1. in the parent directory to the module, build the module metadata where the module is in the directory `puppet-module`:

    ```PowerShell
    puppet module build puppet-module
    ```

1. Submit the resulting tarball to Puppet Forge as per [their instructions]
(http://docs.puppetlabs.com/puppet/2.7/reference/modules_publishing.html)

# Frequently Asked Questions

More like questions that should be asked.

## Why not use the puppet module generator?

This module started with the standard module generation using

    ```PowerShell
    puppet module generate author-blank
    ```

...but this has been (mostly) fixed, so why not continue to use it?

This module is intended for:

1. Writing a module in an environment where puppet is not or can not be installed
2. Use as a starting point for a collection of modules and pre-populated with things like licensing, boiler plate, test environments, pictures of cats, etc. etc.
3. Writing a module in an environment where `puppet module generate` doesn't work, i.e. Windows.

## Why Windows powershell scripts?

My `$work` environment is restricted to using Windows 7, so I required scripts that run under Windows 7. I used PowerShell because it has Perl-like regular expressions and it sometimes, but not consistently, acts like bash. This made this much easier to use than `.bat` batch files.