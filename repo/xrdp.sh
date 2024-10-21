#!/bin/bash

GIT=git
GET=wget

# Package Informations
PKGNAME="xrdp"
PKGDESC="an open source RDP server"
PKGMAINTAINER="NeoPkgs Team"
PKGDEP="libgbm libssl imlib2 freetype libjpeg make nasm libfuse pixman libx11 libxft libxfixes libpam libxrandr"
PKGVER="0.10.1"

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
    wget https://github.com/neutrinolabs/xrdp/releases/download/v0.10.1/xrdp-0.10.1.tar.gz
    tar xvf xrdp-0.10.1.tar.gz
    cd xrdp-0.10.1/
    ./bootstrap
    ./configure --with-x --enable-jpeg --enable-pixman --enable-fuse --with-freetype2=yes --with-imlib2=yes
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
