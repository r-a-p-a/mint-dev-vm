## Vagrantfile & scripts for Mint 17.3 Developers VM

Building upon the Mint Cinnamon 17.3 [rapa/mint-17.3-dev base box](https://atlas.hashicorp.com/rapa/boxes/mint-17.3-dev)
( [also available from source in GitHub](https://github.com/r-a-p-a/mint-dev-box) ), the 
`Vagrantfile` and scripts available in this repository install:

* Eclipse Mars
* Visual Studio Code
* Geany
* Firefox Extensions
* Git Config

## Building your Developers VM

You will need to have both [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) installed.
Then, after you have cloned this repository, all you need to do from the root of your cloned repository is:

    $ vagrant up

## Installation Details
### Eclipse Mars

In order to reduce my own personal 'setup' time with Eclipse, the scripts in this repository
preset various (Java slanted) preferences to my own choices. This has also meant that
a pre-determined workspace has been configured in `/opt/workspace`. Use these files
as the basis for scripting your own automated Eclipse installation.
#### Eclipse Plugins
Currently only a single plugin is installed:
* YEdit

### Visual Studio Code

This is a 'vanilla' install, with the intention that it be used for TypeScript or similar development.

### Geany

Geany has been installed as a complement to `gedit` in order to have an
editor that automatically remembers which files were edited in the previous session and opens
them automatically.

### Firefox Extensions
* Adblock Plus
* Ghostery
* NoScript Security Suite
* Markdown Viewer
* Classic Theme Restorer
* Tab Groups

### Git Config

The last provisioner in the `Vagrantfile` attempts to copy the `.gitconfig` in your host
user's home directory to the home directory of the 'vagrant' user within the VM.
