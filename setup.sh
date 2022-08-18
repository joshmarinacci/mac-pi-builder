# foo
# you must run this script as root

# because we are on release behind
echo "let us do updates from older debian build"
apt-get --allow-releaseinfo-change update
# update the cache
echo "update"
apt-get update
# install more deps
echo "install deps"
apt-get -y install coreutils quilt \
  parted qemu-user-static debootstrap zerofree zip \
  dosfstools libarchive-tools libcap2-bin grep rsync \
  xz-utils file git curl bc \
  qemu-utils kpartx gpg pigz git


echo "checkout the code"
# clone arm64 branch of pi-gen
git clone https://github.com/RPI-Distro/pi-gen.git
# go into pi-gen dir
echo "go into pi-gen/"
cd pi-gen
# switch to the right branch
echo "switch to the arm64 branch"
git branch -a
git checkout arm64

cd ..
echo "IMG_NAME='MyCoolOS'" >> config.txt
echo "all set up. now edit config.txt, cd to pi-gen and run"
echo "  sudo bash ./build.sh -c ../config.txt"
