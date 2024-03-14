#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <VIRTUALBOX_VERSION> <PHP_VERSION> <INSTALL_VBOX_GUEST_ADDITIONS>"
    exit 1
fi

# Process the arguments
VIRTUALBOX_VERSION="$1"
PHP_VERSION="$2"
INSTALL_VBOX_GUEST_ADDITIONS="$3"

echo VIRTUALBOX_VERSION=$VIRTUALBOX_VERSION
echo PHP_VERSION=$PHP_VERSION
echo INSTALL_VBOX_GUEST_ADDITIONS=$INSTALL_VBOX_GUEST_ADDITIONS

echo Update repositories
apt-get update -q

echo Install required packages
export DEBIAN_FRONTEND=noninteractive
apt-get install -y -q ubuntu-desktop build-essential valgrind apt-file ubuntu-dbgsym-keyring

if [ $INSTALL_VBOX_GUEST_ADDITIONS -eq 1 ]; then
  echo Download and install VBoxGuestAdditions
  wget -q -O/tmp/VBoxGuestAdditions.iso http://download.virtualbox.org/virtualbox/${VIRTUALBOX_VERSION}/VBoxGuestAdditions_${VIRTUALBOX_VERSION}.iso
  mount -o loop /tmp/VBoxGuestAdditions.iso /mnt
  sh /mnt/VBoxLinuxAdditions.run
fi;

echo Enable repositories with debug packages
printf "deb http://ddebs.ubuntu.com %s main restricted universe multiverse\n" $(lsb_release -cs){,-updates,-security,-proposed} | \
  sudo tee -a /etc/apt/sources.list.d/ddebs.list

echo Install PHP
add-apt-repository --yes ppa:ondrej/php
apt-get install -y -q --no-install-recommends ${PHP_VERSION} ${PHP_VERSION}-cli ${PHP_VERSION}-curl
wget -O /usr/local/bin/composer https://getcomposer.org/download/2.1.6/composer.phar
chmod 755 /usr/local/bin/composer

echo Install debug symbols
apt-get update -q
apt-get install -y -q libglib2.0-0-dbgsym
