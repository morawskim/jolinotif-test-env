#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <VIRTUALBOX_VERSION> <PHP_VERSION>"
    exit 1
fi

# Process the arguments
VIRTUALBOX_VERSION="$1"
PHP_VERSION="$2"
FEDORA_VERSION=$(cat /etc/os-release | grep VERSION_ID | cut -d= -f2)

echo VIRTUALBOX_VERSION=$VIRTUALBOX_VERSION
echo PHP_VERSION=$PHP_VERSION
echo INSTALL_VBOX_GUEST_ADDITIONS=$INSTALL_VBOX_GUEST_ADDITIONS
echo FEDORA_VERSION=$FEDORA_VERSION

dnf groupinstall -y "Xfce Desktop"
systemctl set-default graphical.target
dnf install -y make valgrind

dnf install -y https://rpms.remirepo.net/fedora/remi-release-${FEDORA_VERSION}.rpm
dnf install -y ${PHP_VERSION} ${PHP_VERSION}-php-ffi
ln -s /usr/bin/${PHP_VERSION} /usr/bin/php

wget -O /usr/local/bin/composer https://getcomposer.org/download/2.1.6/composer.phar
chmod 755 /usr/local/bin/composer
