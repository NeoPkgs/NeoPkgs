#!/bin/bash

GIT=git
GET=wget

# Package Informations
PKGNAME="neovim"
PKGDESC="Vim-fork focused on extensibility and usability"
PKGMAINTAINER="NeoPkgs Team"
PKGDEP="make cmake gettext unzip"
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
    wget https://github.com/neovim/neovim/archive/refs/tags/v0.10.2.zip
    unzip v0.10.2.zip
    cd neovim-0.10.2/
    make CMAKE_BUILD_TYPE=RelWithDebInfo
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
