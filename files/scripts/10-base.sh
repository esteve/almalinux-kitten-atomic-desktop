#!/usr/bin/env bash

set -xeuo pipefail

# Start customizing your image here

# Examples:
# dnf install -y 'dnf-command(config-manager)'
# dnf config-manager --set-enabled crb

dnf install -y 'dnf-command(config-manager)' epel-release
dnf config-manager --set-enabled crb
dnf config-manager --set-enabled epel-testing

dnf install -y system-reinstall-bootc

#echo "Hello, Atomic AlmaLinux respin world!."
