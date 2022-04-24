#!/bin/bash

podman=$(sudo podman ps)

$podman 
#| awk ' { print $1 } '
