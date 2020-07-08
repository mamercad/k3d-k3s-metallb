#!/bin/bash

set -o nounset
set -o errexit

# Local and host tap interfaces
localTapInterface=tap1
hostTapInterface=eth1

# Local and host gateway addresses
localGateway='192.168.99.1/30'
hostGateway='192.168.99.2'
hostNetmask='255.255.255.252'

# Startup local and host tuntap interfaces
sudo ifconfig $localTapInterface $localGateway up
docker run --rm --privileged --net=host --pid=host alpine ifconfig $hostTapInterface $hostGateway netmask $hostNetmask up
