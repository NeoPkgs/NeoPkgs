#!/bin/bash

GIT=git
GET=wget

# Package Informations
PKGNAME="example"
PKGDESC="An example package"
PKGMAINTAINER="NeoPkgs Team"
PKGDEP="dep1"
PKGVER="1.0.0"

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
    # Place installion script here
    
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
