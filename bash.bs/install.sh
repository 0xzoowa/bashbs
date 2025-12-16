#!/bin/bash

# get directory where script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$EUID" -ne 0 ]; then 
    echo "please run with sudo: sudo ./install.sh"
    exit 1
fi

echo "creating template directory at /var/bash.bs/templates..."
mkdir -p /var/bash.bs/templates

echo "copying templates..."
cp -R "$SCRIPT_DIR/templates/"* /var/bash.bs/templates/

echo "installing bashbs script..."
cp "$SCRIPT_DIR/bashbs.sh" /usr/local/bin/bashbs
chmod +x /usr/local/bin/bashbs

echo "installation complete!"
echo "you can now run 'bashbs' from anywhere."