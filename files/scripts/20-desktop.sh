#!/usr/bin/env bash

set -xeuo pipefail

if [[ "${VARIANT}" == "gnome" ]]; then
    dnf install -y \
        @"Workstation"

    systemctl enable gdm

elif [[ "${VARIANT}" == "kde" ]]; then
    dnf install -y \
        @"KDE Plasma Workspaces"

    systemctl enable sddm

else
    echo "NO VARIANT FOUND ${VARIANT} ---"
    dnf install -y \
        @"KDE Plasma Workspaces"
    #dnf install -y "@kde-desktop-environment"
    systemctl enable sddm
    true

fi

systemctl set-default graphical.target

dnf -y remove \
    setroubleshoot
