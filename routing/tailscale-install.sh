#!/bin/bash

DISTRO=$(which lsb_release)
APT=$(which apt)
APTCACHE=$(which apt-cache)
IP=$1

preparation(){

    if [ ! -x $DISTRO ] || [ ! -x $APT ] || [ ! -x $APTCACHE ] || [ ! -x $IP ]
    then
        echo "2:500:critical commands not found."
        exit 1
    fi

}

check_args () {

    if [ $! -eq 0 ]
    then
        echo "Syntax: tailscale-install.sh virtual.ip.address, e.g. tailscale-install.sh 10.5.22.2"
        exit 1
    fi
}

update_aptcache() {

    UPD=$($APT update -y errors.txt log)
        if [ $? -ne 0 ]
        then
            echo "apt update failed, please investigate errors.txt log ..."
            exit 1
        fi

}

verify_package() {

    VERIFYP=$($APTCACHE show keepalived 2> errors.txt)
        if [ $? -ne 0 ]
        then
            echo "keepalived isn't in your apt repo, please investigate errors.txt log ..."
            exit 1
        fi

}

grab_subnet () {





