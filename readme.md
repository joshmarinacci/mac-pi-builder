This is a script to setup an emulated debian install to build Raspberry Pi OS on your Mac using UTM and Qemu.

# setup a Debian Linux Virtual Machine on your Mac
* [install UTM](https://mac.getutm.app) 
* go here [Debian 10.4 (Minimal) | UTM](https://mac.getutm.app/gallery/debian-10-4-minimal) and click ‘Open in UTM’. It will download and install a VM
* Go to networking settings on the VM, switch to ‘Emulated VLAN’  and add a port forwarding as shown here for 22022 to 22: [Setting Up Docker on macOS M1 Arm64 to Use Debian 10.4 Docker Engine - codeluge](https://www.codeluge.com/post/setting-up-docker-on-macos-m1-arm64-to-use-debian-10.4-docker-engine/)
* boot the VM
* from your Mac terminal do : `ssh debian@127.0.0.1 -p 22022`

# setup deps with this script

In the VM clone this repo:

```shell
sudo apt-get install git
git clone https://github.com/joshmarinacci/mac-pi-builder.git
cd mac-pi-builder
sudo bash ./setup.sh
```

or paste it to a file called setup.sh

```shell
sudo bash ./setup.sh
```

The script will install all required deps and check out the git-pi repo, and create a file called `config.txt` to
put your customizations.

# Build your Pi OS 

inside the `pi-gen` dir run the `build.sh` script as root
```shell
sudo bash ./build.sh -c ../config.txt`
```

wait a very long time. Maybe an hour?




