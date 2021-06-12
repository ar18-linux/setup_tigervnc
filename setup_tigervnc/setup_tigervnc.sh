#!/bin/bash

set -ex

LD_PRELOAD=

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

. "${script_dir}/vars"

read -s -p "foo:" foo2

echo "${foo2}" | sudo -S -k pacman -Sy --noconfirm tigervnc

echo "Enter vnc password:"

vncpasswd

mkdir -p "~/.vnc"
cp -f "${script_dir}/xstartup" "~/.vnc/xstartup"

echo "${foo2}" | sudo -Sk cp -f "${script_dir}/vncserver.service" "/etc/systemd/system/vncserver.service"
echo "${foo2}" | sudo -Sk systemctl enable vncserver

set +ex