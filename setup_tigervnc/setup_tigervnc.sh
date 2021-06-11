#!/bin/bash

set -ex

LD_PRELOAD=

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

read -s -p "foo:" foo2

echo "${foo2}" | sudo -S -k pacman -Sy --noconfirm tigervnc

vncpasswd

#. "${script_dir}/vars"

set +ex