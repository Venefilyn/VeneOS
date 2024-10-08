#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/40/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install podman-compose podman-remote krb5-workstation libva-utils libvirt vagrant

# I use flatpak steam with some addons instead
rpm-ostree override remove steam

# this would install a package from rpmfusion
# rpm-ostree install vlc

# Install nix through Nix Determinate Installer
#curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --no-confirm

#### Example for enabling a System Unit File
systemctl enable podman.socket
