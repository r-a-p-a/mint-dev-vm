## Vagrantfile and scripts for a Mint Cinnamon 17.3 VM

Building upon the [rapa/mint-17.3-dev base box](https://atlas.hashicorp.com/rapa/boxes/mint-17.3-dev)
( [also available from source in GitHub](https://github.com/r-a-p-a/mint-dev-box) ), the 
`Vagrantfile` and scripts available in this repository install:

* Eclipse Mars
* Visual Studio Code
* Geany
* Git Config

### Eclipse Mars

In order to reduce my own personal 'setup' time with Eclipse, the scripts in this repository
preset various (Java slanted) preferences to my own choices. This has also meant that
a pre-determined workspace has been configured in `/opt/workspace`. Use these files
as the basis for scripting your own automated Eclipse installation.
#### Eclipse Plugins
Currently only a single plugin is installed:
* YEdit

### Visual Studio Code

This is a 'vanilla' install, with the intention that it be used for TypeScript development.

### Geany

My main reason for installing the Geany editor as a complement to `gedit` is to have an
editor that remembers which files were being edited from the previous session.

### Git Config

The last provisioner in the `Vagrantfile` attempts to copy the `.gitconfig` in your host
user's home directory to the home directory of the 'vagrant' user within the VM.
