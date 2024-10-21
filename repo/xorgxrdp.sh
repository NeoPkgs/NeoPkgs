#!/bin/bash

GIT=git
GET=wget

# Package Informations
PKGNAME="xorgxrdp"
PKGDESC="an open source RDP server"
PKGMAINTAINER="NeoPkgs Team"
PKGDEP="xrdp libgbm make xserver-xorg-dev"
PKGVER="0.10.2"

# You cannot modify this function.
function info() {
    echo "Package Name: $PKGNAME"
    echo "Description: $PKGDESC"
    echo "Maintainer: $PKGMAINTAINER"
    echo "Dependencies: $PKGDEP"
    echo "Version: $PKGVER"
    echo ""
    echo "You must install all dependencies for install this package."
}

function build() {
    echo "Starting build for $PKGNAME..."

    mkdir -p /tmp/$PKGNAME-build
    cd /tmp/$PKGNAME-build
    echo "Compiling $PKGNAME..."
    wget https://github.com/neutrinolabs/xorgxrdp/releases/download/v0.10.2/xorgxrdp-0.10.2.tar.gz
    tar xvf xorgxrdp-0.10.2.tar.gz
    cd xorgxrdp-0.10.2/
    ./bootstrap
    ./configure
    make
    make install
    echo "Installation completed for $PKGNAME."
}

function main() {
    case "$1" in
        info)
            info
            ;;
        build)
            build
            ;;
        *)
            echo "Usage: $0 {info|build}"
            exit 1
            ;;
    esac
}

main "$@"
