#!/usr/bin/env bash

set -euo pipefail

sudo apt update
sudo apt install -y ansible

# 終わったらWSLを再起動すること
ansible-playbook -i localhost, -c local --ask-become-pass configure_playbook.yml
