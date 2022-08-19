# build Raspberry Pi OS on your Mac.

Here you will find instructions and a helper script to setup an emulated Debian Linux virtual machine to build Raspberry Pi OS on your Mac using UTM and Qemu.
Under the hood this uses the official [pi-gen](https://github.com/RPi-Distro/pi-gen) system to build the actual OS.

# Setup a Debian Linux Virtual Machine on your Mac

* [install UTM](https://mac.getutm.app) 
* go here [Debian 10.4 (Minimal) | UTM](https://mac.getutm.app/gallery/debian-10-4-minimal) and click ‘Open in UTM’. It will download and install a VM
* Go to *networking settings* on the VM, switch to `Emulated VLAN`  and add a port forwarding as shown here for 22022 (mac side) to 22 (VM side): [Setting Up Docker on macOS M1 Arm64 to Use Debian 10.4 Docker Engine - codeluge](https://www.codeluge.com/post/setting-up-docker-on-macos-m1-arm64-to-use-debian-10.4-docker-engine/)
* boot the VM
* from your Mac terminal do : `ssh debian@127.0.0.1 -p 22022` to get a nice terminal (with copy and paste) into the VM.

# setup deps with this script

In the VM terminal, clone this repo:

```shell
sudo apt-get install git
git clone https://github.com/joshmarinacci/mac-pi-builder.git
cd mac-pi-builder
sudo bash ./setup.sh
```

or paste it [the contents into](https://github.com/joshmarinacci/mac-pi-builder/blob/main/setup.sh) a file called `setup.sh`

```shell
sudo bash ./setup.sh
```

The script will install all required deps and check out the pi-gen repo, and create a file called `config.txt` to
put your customizations. Or you can manually run the same commands that are in [the script](https://github.com/joshmarinacci/mac-pi-builder/blob/main/setup.sh)

# Build your Pi OS 

inside the `pi-gen` dir run the `build.sh` script as root
```shell
sudo bash ./build.sh -c ../config.txt
```

wait a very long time. Maybe an hour?


# next steps

All of the above will work except for one problem: not enough disk space. 
Resizing the virtual drive is cumbersome, so I'm looking into a way to create a 
pre-fab debian UTM that will already have enough storage for a full build.



